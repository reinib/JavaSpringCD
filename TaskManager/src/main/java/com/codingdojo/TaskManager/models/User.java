package com.codingdojo.TaskManager.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Size(min=1, message="Name must be present")
    private String name;
    @Email(message="Email must be valid")
    private String email;
    @Size(min=5, message="Password must be greater than 8 characters")
    private String password;
    @Transient
    private String passwordConfirmation;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
//    created tasks
    @OneToMany(mappedBy="creator", fetch = FetchType.LAZY)
    private List<Task> createdTasks;
    
//    assigned tasks
    @OneToMany(mappedBy="assignee", fetch = FetchType.LAZY)
    private List<Task> assigned;
    
    
    public User() {
    }



	public User(String name, String email, String password, String passwordConfirmation, List<Task> createdTasks, List<Task> assigned) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.passwordConfirmation = passwordConfirmation;
		this.createdTasks = createdTasks;
		this.assigned = assigned;
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}



	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
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



	public List<Task> getCreatedTasks() {
		return createdTasks;
	}



	public void setCreatedTasks(List<Task> createdTasks) {
		this.createdTasks = createdTasks;
	}


	public List<Task> getAssigned() {
		return assigned;
	}



	public void setAssigned(List<Task> assigned) {
		this.assigned = assigned;
	}



	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
