package com.employeeskills;

import com.employeeskills.Model.Employee;
import com.employeeskills.Repository.EmployeeRepository;
import com.employeeskills.Service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class EmployeeSkillApplicationTests {
    @Mock
    private EmployeeRepository employeeRepository;
    @InjectMocks
    private EmployeeService employeeService;

    @Test
    public void whenSaveUser_shouldReturnUser() {
        Employee emp = new Employee();
        emp.setEmpname("Test Name");
        when(employeeRepository.save(ArgumentMatchers.any(Employee.class))).thenReturn(emp);
        Employee created = employeeService.addEmployee(emp);
        assertThat(created.getEmpname()).isSameAs(emp.getEmpname());
        verify(employeeRepository).save(emp);
    }

    @Test
    public void shouldReturnAllUsers() {
        List<Employee> employees = new ArrayList();
        Employee emp = new Employee();
        emp.setEmpname("Test Name");
        employees.add(new Employee());
        given(employeeRepository.findAll()).willReturn(employees);
        List<Employee> expected = employeeService.getAllEmployees();
        assertEquals(expected, employees);
        assertTrue(expected.size() > 0);
        verify(employeeRepository).findAll();
    }

    @Test
    public void whenUpdateUser_shouldReturnUser() {
        Employee emp = new Employee();
        emp.setEmpname("Test Name");
        emp.setEmployeeID(1);
        when(employeeRepository.save(ArgumentMatchers.any(Employee.class))).thenReturn(emp);
        employeeService.updateEmployee(emp, 1);
        assertThat(emp.getEmployeeID()).isSameAs(1);
        verify(employeeRepository).save(emp);
    }

    @Test
    public void whenDeleteUserSuccess() {
        Employee emp = new Employee();
        emp.setEmpname("Test Name");
        emp.setEmployeeID(1);
        doNothing().when(employeeRepository).deleteById(1);
        employeeService.deleteEmployeeByID(1);
        verify(employeeRepository).deleteById(1);
    }

}