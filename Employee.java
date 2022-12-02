package com.employeeskills.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "EMP_SKILL_INFO1")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "EMP_NO")
    private int employeeID;

    @Column(name = "NAME")
    private String empname;

    @Column(name = "DEPARTMENT")
    private String department;

    @Column(name = "EXP_YEARS")
    private int yearsofexperience;

    @Column(name = "QUALIFICATIONS")
    private String qualification;

    @Column(name = "CERTIFICATIONS")
    private String certification;

    @Column(name = "TECH_SKILLS")
    private String technicalskills;
}
