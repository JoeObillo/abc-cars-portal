package com.carportal.abc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
		@Bean
		public UserDetailsService userDetailsService() {
			return new UserDetailsServiceImpl();
		}

		@Bean
		PasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
		
		
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    	System.out.println("At Authen configure");
	        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
	    }
		
		@Bean
	    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	        http	
	        	.csrf(
	        			csrf -> csrf.disable()
	        	)
	        	.authorizeRequests( auth -> {
	                auth.requestMatchers("/").permitAll();
	                auth.requestMatchers("/css/**").permitAll();
                    auth.requestMatchers("/images/**").permitAll();
                    auth.requestMatchers("/js/**").permitAll();
                    auth.requestMatchers("/registration").permitAll();
	                auth.requestMatchers("/login").permitAll();
	                auth.requestMatchers("/home").permitAll();
	                auth.requestMatchers("/cars").hasAnyRole("User", "Administrator");
	                auth.requestMatchers("/all_cars").hasRole("Administrator");
	                auth.requestMatchers("/users").hasRole("Administrator");
	                auth.requestMatchers("/profile").hasAnyRole("User", "Administrator");
	        	})
	            .formLogin(
	                        form -> form
	                                .loginPage("/login")
	                                .loginProcessingUrl("/login")
	                                .failureUrl("/login_error")
	                                .defaultSuccessUrl("/home")
	                                .permitAll()
	             )
	             .logout(
	                        logout -> logout
	                                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	                                .permitAll()

	              );
	        return http.build();
	    }

}
