package com.rahproject.studentform.service;

import java.util.List;

import com.rahproject.studentform.entity.Student;

public interface StudentService {

	// create
	// delete
	// read
	// update
	// search

	public List<Student> findAll();

	public Student findById(int theId);

	public void save(Student student);

	public void deleteById(int theId);

	public List<Student> searchBy(String name);

}
