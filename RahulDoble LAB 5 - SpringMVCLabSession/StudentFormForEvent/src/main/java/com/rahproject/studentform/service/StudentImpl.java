package com.rahproject.studentform.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.rahproject.studentform.entity.Student;

@Component
public class StudentImpl implements StudentService {

	private SessionFactory sessionFactory;
	private Session session;

	@Autowired
	public StudentImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

	}

	@Override
	@Transactional
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		Transaction tx = session.beginTransaction();
		List<Student> student = session.createQuery("from Student").list();
		tx.commit();
		return student;
	}

	@Override
	@Transactional
	public Student findById(int theId) {
		// TODO Auto-generated method stub
		Student student = new Student();
		Transaction tx = session.beginTransaction();
		student = session.get(Student.class, theId);
		tx.commit();
		return student;
	}

	@Override
	@Transactional
	public void save(Student student) {
		// TODO Auto-generated method stub
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(student);
		tx.commit();
	}

	@Override
	@Transactional
	public void deleteById(int theId) {
		// TODO Auto-generated method stub

		Transaction tx = session.beginTransaction();
		Student student = session.get(Student.class, theId);
		session.delete(student);
		tx.commit();
	}

	@Transactional
	public void print(List<Student> student) {
		for (Student st : student) {
			System.out.println(st);
		}
	}

	@Override
	@Transactional
	public List<Student> searchBy(String name) {
		// TODO Auto-generated method stub
		Transaction tx = session.beginTransaction();
		String query = "";
		if (name.length() != 0) {
			query = "from Student where name LIKE '%" + name + "%'";
		} else
			System.out.println("Input is Invalid");
		List<Student> student = session.createQuery(query).list();
		tx.commit();
		return student;
	}

}
