package com.codingdojo.takotsubojobs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.takotsubojobs.models.Job;
import com.codingdojo.takotsubojobs.repositories.JobRepository;

@Service
public class JobService {
	
    private JobRepository jobRepository;
    public JobService(JobRepository jobRepository){
        this.jobRepository = jobRepository;
    }
    
    
    public Iterable<Job> allJobs(){
        return jobRepository.findAll();
    }
    public void addJob(Job job){
        jobRepository.save(job);
    }
    
    
    public void deleteJob(Long index){
            jobRepository.deleteById(index);

    }
    
    public Optional<Job> getJobByID(Long index){
        return jobRepository.findById(index);
    }
    
    public void editJob(Job job){
        jobRepository.save(job);
    }
    
    public List<Job> findByStatus(String string){
    	return jobRepository.findByCompletedStatus(string);
    }






}
