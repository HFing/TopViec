package com.hfing.TopViec.service;

import com.hfing.TopViec.config.VNPayConfigV2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@Service
public class VNPayService {

    private final RestTemplate restTemplate;

    @Autowired
    public VNPayService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public Map<String, String> createPayPalPayment(String price, String description, String returnUrl,
            String cancelUrl) {
        try {
            // Validate the price input
            if (price == null || price.isEmpty()) {
                throw new IllegalArgumentException("Price cannot be null or empty");
            }

            double priceInUSD = Double.parseDouble(price);

            // Step 1: Get Access Token
            String accessToken = getAccessToken();

            // Step 2: Create Payment
            String paymentUrl = "https://api.sandbox.paypal.com/v1/payments/payment";
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("intent", "sale");
            requestBody.put("payer", Map.of("payment_method", "paypal"));
            requestBody.put("transactions", new Object[] {
                    Map.of("amount", Map.of("currency", "USD", "total", priceInUSD), "description", description)
            });
            requestBody.put("redirect_urls", Map.of("return_url", returnUrl, "cancel_url", cancelUrl));

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + accessToken);

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<Map> response = restTemplate.postForEntity(paymentUrl, entity, Map.class);

            // Step 3: Extract approval URL
            Map<String, Object> responseBody = response.getBody();
            List<Map<String, String>> links = (List<Map<String, String>>) responseBody.get("links");
            String approvalUrl = links.stream()
                    .filter(link -> link.get("rel").equals("approval_url"))
                    .map(link -> link.get("href"))
                    .findFirst()
                    .orElse(null);

            return Map.of("approvalUrl", approvalUrl, "accessToken", accessToken);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating PayPal payment: " + e.getMessage());
        }
    }

    private String getAccessToken() {
        String url = "https://api.sandbox.paypal.com/v1/oauth2/token";
        String clientId = "AeyFK0Tomu06wnDGB4dmS3LMICoI_YezaWZBdHy6upiZ3S1YBDbmeJdKEQG2hXKnNf-XYcCE2lOgpVd2"; // Replace
                                                                                                              // with
                                                                                                              // your
                                                                                                              // PayPal
                                                                                                              // client
                                                                                                              // ID
        String clientSecret = "EGAT2t45s_W_D3vF73RkfG_TJcGKg1FeBoLeygeexDcokCNYXeLPmxqQSJ3Tba7WA3CwzW80rZnQ8-Uj"; // Replace
                                                                                                                  // with
                                                                                                                  // your
                                                                                                                  // PayPal
                                                                                                                  // client
                                                                                                                  // secret

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.set("Authorization",
                "Basic " + Base64.getEncoder().encodeToString((clientId + ":" + clientSecret).getBytes()));

        HttpEntity<String> entity = new HttpEntity<>("grant_type=client_credentials", headers);
        ResponseEntity<Map> response = restTemplate.postForEntity(url, entity, Map.class);

        // Log the response for debugging
        System.out.println("Access Token Response: " + response.getBody());

        return (String) response.getBody().get("access_token");
    }

    public Map<String, String> executePayPalPayment(String paymentId, String payerId) {
        try {
            // Get the access token again if needed, or pass it from the previous method
            String token = getAccessToken(); // Ensure you have the correct token

            String url = "https://api.sandbox.paypal.com/v1/payments/payment/" + paymentId + "/execute";
            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("payer_id", payerId);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + token);

            HttpEntity<Map<String, String>> entity = new HttpEntity<>(requestBody, headers);

            // Log the request details for debugging
            System.out.println("Executing payment with URL: " + url);
            System.out.println("Request Body: " + requestBody);
            System.out.println("Headers: " + headers);

            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, entity, Map.class);

            // Log the response for debugging
            System.out.println("Execute Payment Response: " + response.getBody());
            System.out.println("Response Status Code: " + response.getStatusCode());

            if (response.getStatusCode() == HttpStatus.OK) {
                String state = (String) response.getBody().get("state");
                return Map.of("message", state.equals("approved") ? "Payment successful" : "Payment failed");
            } else {
                throw new RuntimeException("Payment execution failed with status: " + response.getStatusCode());
            }
        } catch (HttpClientErrorException e) {
            // Log the error details
            System.err.println("HTTP Status Code: " + e.getStatusCode());
            System.err.println("Response Body: " + e.getResponseBodyAsString());
            throw new RuntimeException("Error executing PayPal payment: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error executing PayPal payment");
        }
    }
}