package com.codingdojo.takotsubojobs.controllers;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.takotsubojobs.models.Job;
import com.codingdojo.takotsubojobs.models.User;
import com.codingdojo.takotsubojobs.service.JobService;
import com.codingdojo.takotsubojobs.service.UserService;
import com.codingdojo.takotsubojobs.validator.UserValidator;


@Controller
public class JobsController {
    private final JobService jobService;
    private final UserService userService;
    private final UserValidator uV;

    public JobsController(JobService jobService, UserValidator uV, UserService userService){
        this.jobService = jobService;
        this.uV = uV;
        this.userService = userService;
    }

	
	@GetMapping("/")
	public String loginRegister(@ModelAttribute("userReg")User register,HttpSession session) {
		if(session.isNew()) {
			session.setAttribute("login", false);
		}
		return"logReg.jsp";
	}
	
	@PostMapping("/register")
	public String registerProcess(@Valid @ModelAttribute("userReg")User uReg,BindingResult result,RedirectAttributes rA) {
		uV.validate(uReg, result);
		if(result.hasErrors()) {
			return"logReg.jsp";
		}
		else {
			userService.registerUser(uReg);
			rA.addFlashAttribute("success","<p class=\"alert alert-success\" role=\"alert\"> Registration Successful! You may now Log in. </p>");
			return"redirect:/";
		}
	}
	
	@PostMapping("/Login")
	public String loginProcess(@RequestParam("email")String email,@RequestParam("password")String password,HttpSession session,RedirectAttributes rA) {
		if(userService.checkLogin(email, password) == false) {
			rA.addFlashAttribute("error","<p class=\"alert alert-danger text-center\" role=\"alert\"> Invalid Credentials </p>");
			return "redirect:/";
		}
		else {
			session.setAttribute("login", true);
			session.setAttribute("user",userService.findByEmail(email).getId());
			return"redirect:/jobs";
			
		}
	}
	

    @RequestMapping("/jobs")
    public String home(@ModelAttribute("job") Job job, HttpSession session, Model model){
        List<Job> jobsFalse = jobService.findByStatus("false");
        List<Job> jobsTrue = jobService.findByStatus("true");
        User user = userService.getUserById((Long) session.getAttribute("user"));
        model.addAttribute("user", user);
        model.addAttribute("jobsFalse", jobsFalse);
        model.addAttribute("jobsTrue", jobsTrue);
        return "/views/jobs.jsp";
    }
    
    
    
    @RequestMapping("/jobs/add")
    public String addJob(@ModelAttribute("job") Job job, Model model) {
    	return "/views/addJob.jsp";
    }
    
    @PostMapping("/adding")
    public String newJob(@Valid @ModelAttribute("job") Job job, BindingResult result){
        if(result.hasErrors()){
            return "/views/addJob.jsp";
        }else{
        	job.setCompletedStatus("false");
            jobService.addJob(job);
            return "redirect:/jobs";
        }
    }
    
    @RequestMapping("/jobs/delete/{id}")
    public String deleteJob(@PathVariable("id") Long id){
        jobService.deleteJob(id);
        return "redirect:/jobs";
    }
    
    @RequestMapping("/jobs/edit/{id}")
    public String editJob(@PathVariable("id") Long id, Model model){
        Optional<Job> job = jobService.getJobByID(id);
        model.addAttribute("job", job);
        model.addAttribute("id", id);
        return "views/editJob.jsp";
    }
    
    
    
    @PostMapping("/jobs/edit/{id}")
    public String updateJob(@PathVariable("id") int id, @Valid @ModelAttribute("job") Job job, BindingResult result){
        if(result.hasErrors()){
            return "/views/editJob.jsp";
        }else{
            jobService.editJob(job);
            return "redirect:/jobs";
        }
    }
    
    @RequestMapping("/jobs/completeedit/{id}")
    public String editJob2(@PathVariable("id") Long id, Model model){
        Optional<Job> job = jobService.getJobByID(id);
        model.addAttribute("job", job);
        model.addAttribute("id", id);
        return "views/editCompleted.jsp";
    }
    
    
    
    
    @PostMapping("/complete")
    public String orderComplete(@RequestParam("complete")String complete, @RequestParam("orderId")Long orderId) {
    	Job job = jobService.getJobByID(orderId).get();
    	job.setStatus(complete);
    	job.setCompletedStatus("true");
    	jobService.addJob(job);
    	System.out.println(complete);
    	
    	
    	return "redirect:/jobs";
    }
    

    

    
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return"redirect:/";
	}
    
    


}
