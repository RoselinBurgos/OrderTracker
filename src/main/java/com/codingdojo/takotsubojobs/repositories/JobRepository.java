package com.codingdojo.takotsubojobs.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.takotsubojobs.models.Job;



public interface JobRepository extends CrudRepository<Job, Long> {
List<Job> findByCompletedStatus(String string);
}
