package com.hfing.TopViec.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import com.hfing.TopViec.service.CustomUserDetailsService;
import com.hfing.TopViec.service.RoleService;
import com.hfing.TopViec.service.UserRoleService;
import com.hfing.TopViec.service.UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

        private final UserService userService;
        private final UserRoleService userRoleService;
        private final RoleService roleService;

        public SecurityConfiguration(UserService userService, UserRoleService userRoleService,
                        RoleService roleService) {
                this.userService = userService;
                this.userRoleService = userRoleService;
                this.roleService = roleService;
        }

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public UserDetailsService userDetailsService(UserService userService) {
                return new CustomUserDetailsService(userService);
        }

        @Bean
        public OAuth2LoginSuccessHandler oAuth2LoginSuccessHandler() {
                return new OAuth2LoginSuccessHandler(userService, passwordEncoder(), roleService, userRoleService);
        }

        @Bean
        public DaoAuthenticationProvider authProvider(
                        PasswordEncoder passwordEncoder,
                        UserDetailsService userDetailsService) {

                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                // authProvider.setHideUserNotFoundExceptions(false);
                return authProvider;
        }

        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

                http
                                .cors(AbstractHttpConfigurer::disable)
                                .csrf(AbstractHttpConfigurer::disable)
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
                                                .permitAll()
                                                .requestMatchers("/", "/register/**", "/login", "/client/**", "/css/**",
                                                                "/js/**", "/images/**", "/register_recruiter/**",
                                                                "/api/districts", "/pricing/**", "/about/**",
                                                                "/companies/**", "/contact/**", "/oauth2/**",
                                                                "/verify/**")
                                                .permitAll()
                                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                                .requestMatchers("/recruiter/**").hasRole("RECRUITER")
                                                .anyRequest().authenticated())
                                .sessionManagement(sessionManagement -> sessionManagement
                                                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                                                .invalidSessionUrl("/logout?expired")
                                                .maximumSessions(1)
                                                .maxSessionsPreventsLogin(false))
                                .logout(logout -> logout
                                                .logoutUrl("/logout")
                                                .logoutSuccessUrl("/login?logout")
                                                .deleteCookies("JSESSIONID")
                                                .invalidateHttpSession(true))
                                .rememberMe(r -> r.rememberMeServices(rememberMeServices()))
                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureUrl("/login?error")
                                                .successHandler(new FormLoginSuccessHandler(userService))
                                                .permitAll())
                                .oauth2Login(oauth2Login -> oauth2Login
                                                .loginPage("/login")
                                                .successHandler(oAuth2LoginSuccessHandler())
                                                .failureUrl("/login?error")
                                                .permitAll())
                                .exceptionHandling(ex -> ex.accessDeniedPage("/404"));

                return http.build();
        }

        private SpringSessionRememberMeServices rememberMeServices() {
                SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
                rememberMeServices.setAlwaysRemember(true);
                return rememberMeServices;
        }
}