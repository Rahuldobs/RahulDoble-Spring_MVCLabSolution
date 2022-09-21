package com.rahproject.studentform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rahproject.studentform.entity.Student;
import com.rahproject.studentform.service.StudentService;

@Controller
@RequestMapping("/studentsdetails")
public class StudentController {

	@Autowired
	private StudentService studentService;

	// for all student records show list of students
	@RequestMapping("/list")
	public String listDetails(Model theModel) {
		List<Student> student = studentService.findAll();
		theModel.addAttribute("Student", student);
		return "Student-List";

	}

// for add new student 
	@RequestMapping("/showFormForAdd")
	public String showForAdd(Model theModel) {
		Student student = new Student();
		theModel.addAttribute("Student", student);
		return "Student-Form";

	}

	// for update existing student details
	@RequestMapping("/showFormForUpdate")
	public String showForUpdate(@RequestParam("studentId") int theId, Model theModel) {
		Student student = studentService.findById(theId);
		theModel.addAttribute("Student", student);
		return "Student-Form";

	}

	// for delete any student detail
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int theId) {
		studentService.deleteById(theId);
		return "redirect:/studentsdetails/list";

	}

	// for search of a student by student's name
	@RequestMapping("/search")
	public String search(@RequestParam("name") String name, Model theModel) {
		if (name.trim().isEmpty()) {
			return "redirect:/studentsdetails/list";
		} else {
			List<Student> student = studentService.searchBy(name);
			theModel.addAttribute("Student", student);
		}

		return "Student-List";

	}

	// for save entries into the list (update/new add)
	@RequestMapping("/save")
	public String save(@RequestParam("id") int theId, @RequestParam("name") String name,
			@RequestParam("department") String department, @RequestParam("country") String country) {
		System.out.println(theId);
		Student student;
		if (theId != 0) {
			student = studentService.findById(theId);
			student.setId(theId);
			student.setName(name);
			student.setDepartment(department);
			student.setCountry(country);
		} else
			student = new Student(name, department, country);
		studentService.save(student);
		return "redirect:/studentsdetails/list";

	}

}
