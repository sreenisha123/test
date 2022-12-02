package com.employeeskills.Repository;


import com.employeeskills.Model.Employee;
import org.springframework.data.repository.CrudRepository;

// interface extending crud repository
public interface EmployeeRepository extends CrudRepository<Employee, Integer> {

}
