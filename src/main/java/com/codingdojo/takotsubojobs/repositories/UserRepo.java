package com.codingdojo.takotsubojobs.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.takotsubojobs.models.User;

@Repository
public interface UserRepo extends CrudRepository<User,Long> {
	User findByEmail(String email);
}

