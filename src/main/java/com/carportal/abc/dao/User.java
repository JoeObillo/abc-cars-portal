package com.carportal.abc.dao;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

import jakarta.persistence.*;

@Entity
@Table(name = "abc_user", uniqueConstraints = 
{@UniqueConstraint(columnNames = "email")})
public class User {

		@Id
	    @GeneratedValue(strategy= GenerationType.IDENTITY)
	    private Long id;

		@Column(name="first_name")
	    private String firstName;
		
		@Column(name="last_name")
	    private String lastName;

//	    @Column(name="user_name")
//	    private String userName;

	    @Column(name="password")
	    private String password;
	    
	    @Column(name="phone_number")
	    private String phoneNumber;
	    
	    // email as username
	    @Column(name="email")
	    private String userName;
	    
	    @ManyToMany(fetch = FetchType.EAGER)
	    @JoinTable( name="user_role",
	                joinColumns = @JoinColumn(name = "user_id"),
	                inverseJoinColumns = @JoinColumn(name = "role_id"))
	    private Set<Role> roles = new HashSet<>();

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		
		public String getLastName() {
			return lastName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
		
		public String getPhoneNumber() {
			return phoneNumber;
		}

		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

//		public String getEmail() {
//			return email;
//		}
//
//		public void setEmail(String email) {
//			this.email = email;
//		}

		public Set<Role> getRoles() {
			return roles;
		}

		public void setRoles(Set<Role> roles) {
			this.roles = roles;
		}

		@Override
		public int hashCode() {
			// TODO Auto-generated method stub
			return super.hashCode();
		}

		@Override
		public boolean equals(Object obj) {
			// TODO Auto-generated method stub
			return super.equals(obj);
		}

}
