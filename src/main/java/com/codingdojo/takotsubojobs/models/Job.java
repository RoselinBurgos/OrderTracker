package com.codingdojo.takotsubojobs.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="job")
public class Job {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank
    private String customer_name;
    
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date_placed;
    
    @NotBlank
    private String order_description;
    
    @NotBlank
    private String job_type;
    
    @NotBlank
    private String material_status;
    
    @NotBlank
    private String status;
    
  
    private String completedStatus;
    
   
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date due_date;
    
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date_completed;
    
    
   
    @Column(updatable=false)
    private Date createdAt;
	private Date updatedAt;

	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
	}
    
    public Job() {
    	
    }
    
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public Date getDate_placed() {
		return date_placed;
	}
	public void setDate_placed(Date date_placed) {
		this.date_placed = date_placed;
	}
	public String getOrder_description() {
		return order_description;
	}
	public void setOrder_description(String order_description) {
		this.order_description = order_description;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getMaterial_status() {
		return material_status;
	}
	public void setMaterial_status(String material_status) {
		this.material_status = material_status;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDate_completed() {
		return date_completed;
	}
	public void setDate_completed(Date date_completed) {
		this.date_completed = date_completed;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	
	
	public String getCompletedStatus() {
		return completedStatus;
	}
	public void setCompletedStatus(String completed_status) {
		this.completedStatus = completed_status;
	}
	public Job(String completed_status, String customer_name, Date date_placed, String order_description, String job_type,
			String material_status, String status, Date due_date, Date date_completed) {
		this.customer_name = customer_name;
		this.date_placed = date_placed;
		this.order_description = order_description;
		this.job_type = job_type;
		this.material_status = material_status;
		this.status = status;
		this.due_date = due_date;
		this.date_completed = date_completed;
		this.completedStatus = completed_status;
	}
   

}