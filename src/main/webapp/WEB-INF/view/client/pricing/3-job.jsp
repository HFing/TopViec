<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/client/css/style.css">
</head>

<body>
    <jsp:include page="../layout/header.jsp" />

    <div class="section credit">
        <div class="container-default w-container">
            <div class="credit-wrapper">
                <div data-w-id="efe6f1ea-985f-ddb3-4c77-b94ff98b0cd5"
                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                    class="card credit">
                    <h1 class="title card-credit">3 Featured Job credit</h1>
                    <p class="paragraph card-credit">Lorem ipsum dolor sit amet, consectetur adipiscing elit ut
                        aliquam, purus sit amet luctus venenatis lectus.</p>
                    <div class="w-layout-grid card-credit-features-grid">
                        <div class="credit-feature-wrapper"><img
                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca5000c1298fa4b65f2643_icon-1-check-job-board-x-template.svg"
                                alt="Check Icon - Job Board X Webflow Template" class="image credit-feature-icon">
                            <div>3 featured job credit</div>
                        </div>
                        <div class="credit-feature-wrapper"><img
                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca5000c1298fa4b65f2643_icon-1-check-job-board-x-template.svg"
                                alt="Check Icon - Job Board X Webflow Template" class="image credit-feature-icon">
                            <div>Featured for 1 week</div>
                        </div>
                        <div class="credit-feature-wrapper"><img
                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca5000c1298fa4b65f2643_icon-1-check-job-board-x-template.svg"
                                alt="Check Icon - Job Board X Webflow Template" class="image credit-feature-icon">
                            <div>Published for 2 months</div>
                        </div>
                        <div class="credit-feature-wrapper"><img
                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca5000c1298fa4b65f2643_icon-1-check-job-board-x-template.svg"
                                alt="Check Icon - Job Board X Webflow Template" class="image credit-feature-icon">
                            <div>1 day approval</div>
                        </div>
                        <div class="credit-feature-wrapper"><img
                                src="https://assets-global.website-files.com/60c77302fcfa2b84ab595f64/60ca5000c1298fa4b65f2643_icon-1-check-job-board-x-template.svg"
                                alt="Check Icon - Job Board X Webflow Template" class="image credit-feature-icon">
                            <div>Verified company</div>
                        </div>
                    </div>
                    <div class="rich-text-card-credit w-richtext">
                        <h3>Why publishing a featured job opening?</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus augue sagittis erat
                            consectetur est. Blandit blandit nec <a href="#">mauris pulvinar</a>. Lectus duis amet
                            tortor, sit tincidunt. Rhoncus tincidunt imperdiet penatibus vitae risus, vitae.
                            <strong>Blandit auctor</strong> justo nisl massa.
                        </p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus dictum ultrices lacus
                            sodales nunc felis eu, consectetur arcu. Vitae nulla scelerisque id pellentesque feugiat
                            vel eu.</p>
                    </div>
                </div>
                <div data-w-id="f5b486e6-4014-931d-4010-8bdca4769789"
                    style="transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); opacity: 1; transform-style: preserve-3d;"
                    class="split-content credit-sidebar">
                    <div data-wf-sku-conditions="%7B%22condition%22%3A%7B%22fields%22%3A%7B%22default-sku%3Aprice%22%3A%7B%22exists%22%3A%22yes%22%2C%22type%22%3A%22CommercePrice%22%7D%7D%7D%2C%22timezone%22%3A%22America%2FMexico_City%22%7D"
                        class="card pay-credit">
                        <div class="pay-credit-content-top">
                            <h2 class="title h4-size">Pay your job credit</h2>
                            <p class="paragraph pay-credit">Lorem ipsum dolor sit amet, consecteturol adipiscing
                                elit. Cras lectus duis ornare.</p>
                            <div data-wf-sku-bindings="%5B%7B%22from%22%3A%22f_price_%22%2C%22to%22%3A%22innerHTML%22%7D%5D"
                                class="title h2-size pay-credit-price">149,000&nbsp;VND</div>
                        </div>

                        <div class="credit-add-cart">
                            <form class="w-commerce-commerceaddtocartform credit-add-cart-default-state">
                                <div class="credit-add-cart-buttons-wrapper">

                                    <button type="button"
                                        class="w-commerce-commercebuynowbutton button-primary full-width credit-add-cart-button"
                                        onclick="redirectToPayPal('12345', '99.00')">Pay now</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="../layout/footer.jsp" />
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=60c77302fcfa2b84ab595f64"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script>
        function redirectToPayPal(orderId, amount) {
            console.log("Order ID:", orderId);
            console.log("Amount:", amount);

            const encodedOrderId = encodeURIComponent(orderId);
            const encodedAmount = encodeURIComponent(amount);
            const url = `/create-paypal-payment?orderId=12345&amount=6`;

            console.log("Redirecting to URL:", url);
            window.location.href = url;
        }


    </script>
</body>


</html>