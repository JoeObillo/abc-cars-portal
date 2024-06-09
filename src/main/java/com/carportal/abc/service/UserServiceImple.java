package com.carportal.abc.service;

import org.springframework.stereotype.Service;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.carportal.abc.dao.Role;
import com.carportal.abc.dao.User;
import com.carportal.abc.repository.RoleRepository;
import com.carportal.abc.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserServiceImple implements UserService {
	
	@Autowired //to prevent the invoke null error
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
    private PasswordEncoder passwordEncoder;

	public String save(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("User")));
		
		userRepository.save(user);
		
		return "User saved successfully";
	}

	public User findLoginUser(String username) {
		return userRepository.findByUserName(username);
	}

	public List<User> showAllUser() {
		return userRepository.findAll();
	}

	public void update(User user) {
		userRepository.save(user);
	}

	public Optional<User> getUserInfo(long uid) {
		return userRepository.findById(uid);
	}

	public void deleteUser(long uid) {
		userRepository.deleteById(uid);
	}

	public void assignNewRole(User user, String role) {
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles(role)));
		userRepository.save(user);
	}

}
