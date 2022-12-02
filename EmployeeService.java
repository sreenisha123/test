package com.employeeskills.Service;

import com.employeeskills.Model.Employee;
import com.employeeskills.Repository.EmployeeRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

// employee service class
@Service
@Slf4j
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    // fetching all employees
    public List<Employee> getAllEmployees() {
        return (List<Employee>) employeeRepository.findAll();
    }

    // fetching employee by id
    public Optional<Employee> getEmployee(int id) {
        return employeeRepository.findById(id);
    }

    // inserting employee
    public Employee addEmployee(Employee e) {
        log.info("Successfully saved employee data into DB");
        return employeeRepository.save(e);
    }

    // updating employee by id
    public void updateEmployee(Employee emp, int id) {
        if (id == emp.getEmployeeID()) {
            employeeRepository.save(emp);
        } else {
            log.error("Employee details not matching");
        }
    }

    // deleting employee by id
    public void deleteEmployeeByID(int id) {
        employeeRepository.deleteById(id);
    }

}
