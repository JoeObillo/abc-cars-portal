package com.carportal.abc.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.carportal.abc.dao.User;
import com.carportal.abc.repository.RoleRepository;
import com.carportal.abc.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public interface UserService {
	
	public String save(User user);
	
	public User findLoginUser(String username);
	
	public List<User> showAllUser();
	
	public void update(User user);
	
	public Optional<User> getUserInfo(long uid);
	
	public void deleteUser(long uid);
	
	public void assignNewRole(User user, String role);

}
