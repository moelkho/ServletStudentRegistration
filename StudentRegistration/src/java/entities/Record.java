/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author admin
 */
public class Record {
    
    private int studentId;
    private String studentName;
    private String studentCourse;
    private double studentfees;

    public Record(String studentName, String studentCourse, double studentfees) {
        this.studentName = studentName;
        this.studentCourse = studentCourse;
        this.studentfees = studentfees;
    }
    
     public Record(int studentId, String studentName, String studentCourse, double studentfees) {
        this.studentId = studentId;
         this.studentName = studentName;
        this.studentCourse = studentCourse;
        this.studentfees = studentfees;
    }

    public Record() {
        
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentCourse() {
        return studentCourse;
    }

    public void setStudentCourse(String studentCourse) {
        this.studentCourse = studentCourse;
    }

    public double getStudentfees() {
        return studentfees;
    }

    public void setStudentfees(double studentfees) {
        this.studentfees = studentfees;
    }
    
    
    
}
