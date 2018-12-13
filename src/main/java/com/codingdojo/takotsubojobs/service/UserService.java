package com.codingdojo.takotsubojobs.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import com.codingdojo.takotsubojobs.models.User;
import com.codingdojo.takotsubojobs.repositories.UserRepo;

@Service
public class UserService {
	private final UserRepo uR;
	
	public UserService(UserRepo uR) {
		this.uR = uR;

	}
	
	public User findByEmail(String email) {
		return uR.findByEmail(email);
	}
	
	public User registerUser(User user) {
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hash);
		return uR.save(user);
	}
	
	public boolean checkLogin(String email,String password) {
		User user = uR.findByEmail(email);
		if(user == null) {
			return false;
		}
		else {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
	}
	
	public User getUserById(Long id) {
		return uR.findById(id).get();
	}
	

}
