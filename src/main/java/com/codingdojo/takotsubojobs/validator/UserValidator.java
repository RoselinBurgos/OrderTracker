package com.codingdojo.takotsubojobs.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.takotsubojobs.models.User;
import com.codingdojo.takotsubojobs.service.UserService;

@Component
public class UserValidator implements Validator {
	private UserService uS;
	
	

	public UserValidator(UserService uS) {
	
		this.uS = uS;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		
		
		if(!user.getPasswordConfirmation().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
		
		if(uS.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "Registered");
			
		}
		
		
	}


		
}

