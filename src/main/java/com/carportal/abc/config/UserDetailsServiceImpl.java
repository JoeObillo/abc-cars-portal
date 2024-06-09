package com.carportal.abc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.carportal.abc.dao.Role;
import com.carportal.abc.dao.User;
import com.carportal.abc.repository.UserRepository;

import jakarta.transaction.Transactional;

@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
    public UserDetailsServiceImpl() {
    }

    @Override
    @Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
        System.out.println("Login UserName is "+ username);
        
        User user = userRepository.findByUserName(username);
        
        if(user == null) {
            throw new UsernameNotFoundException("user " + username + " is not valid. Please re-enter.");
        }

        org.springframework.security.core.userdetails.User.UserBuilder userBuilder = 
        		org.springframework.security.core.userdetails.User.builder();
        
        String[] roleNames= user.getRoles().stream().map(Role::getName).toArray(String[]::new);
        
        System.out.println("Role Name is "+roleNames);
        System.out.println("Password: " + user.getPassword());
        System.out.println("Username: " + user.getUserName());
        return userBuilder.username(user.getUserName())
                        .password(user.getPassword())
                        .roles(roleNames)
//                        .passwordEncoder(passwordEncoder::encode)
                        .build();
	}

}
