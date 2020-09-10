
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    
    <body>
        <%@include file="header-file.html" %>
        <br/>
        <br/>
        <br/>
        
        <div class="row">
           <!-- registration form-->
            <div class="col-sm-3">
                
                <c:choose>
                    <c:when test="${empty list}">
                <form  method="POST" action="StudentRecordServlet">
                    <div align="left">
                        <label class="form-label"> Student Name </label>
                        
                        <input type="text" class="form-control" placeholder="Student Name" name="studentname" id="studentname" required>
                        
                    </div>
                    
                    <div align="left">
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="studentcourse" id="studentcourse" required>
                        
                    </div>
                    
                    <div align="left">
                        <label class="form-label"> Fees </label>
                        <input type="text" class="form-control" placeholder="Fees" name="studentfees" id="studentfees" required>
                        
                    </div>
                    
                     <div align="right">
                       
                        <input type="submit" name="submit" id="submit" value="submit" class="btn btn-info">
                        <input type="reset" name="reset" id="reset" value="reset" class="btn btn-warning">
                    </div>
                </form>
                
                </c:when>
                    <c:otherwise>
                        
                       
                        <form  method="POST" action="EditStudentServlet">
                    <div align="left">
                        
                        <label class="form-label"> Student Name </label>
                        
                        <input type="hidden" class="form-control" placeholder="Student Id" name="id" id="id"  value="${list.studentId}">
                        <input type="text" class="form-control" placeholder="Student Name" name="studentname" id="studentname"  value="${list.studentName}"required>
                        
                    </div>
                    
                    <div align="left">
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="studentcourse" id="studentcourse" value="${list.studentCourse}" required>
                        
                    </div>
                    
                    <div align="left">
                        <label class="form-label"> Fees </label>
                        <input type="text" class="form-control" placeholder="Fees" name="studentfees" id="studentfees" value="${list.studentfees}"required>
                        
                    </div>
                    
                     <div align="right">
                       
                        <input type="submit" name="submit" id="submit" value="submit" class="btn btn-info">
                        <input type="reset" name="reset" id="reset" value="reset" class="btn btn-warning">
                    </div>
                       
                </form>
                        
                    </c:otherwise>
                
                 </c:choose>
              
                
            </div>
            <!-- informations table-->
            <div class="col-sm-6">
                <div class="panel-body">
                    
                
                    <table id="table-student" class="table table-responsive   table-bordered" cellpadding="0" width="100%"  style="overflow-y: scroll;">
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                
                            </tr>
                            </thead>
                            
                            
                            
                               
                
            
                            <c:choose>
                           
                                <c:when test="${empty records}">
                                    
                                    <td colspan="6"> <p align="center">No records yet</p></td>
                            
                            </c:when>
                              <c:otherwise>
                                  
                                  <c:forEach items="${records}" var="record"> 
                                
                            
                            <tr>
                                <td><c:out value="${record.studentId}"/></td>
                                <td><c:out value="${record.studentName}"/></td>
                                <td><c:out value="${record.studentCourse}"/></td>
                                <td><c:out value="${record.studentfees}"/></td>
                                <td> 
                                    <a href="GetOneStudentServlet?id=${record.studentId}"><i class="fa fa-pencil fa-lg"
                                    aria-hidden="true"></i></a>
                                </td>
                                <td>
                                    <a href="deleteStudentServlet?id=${record.studentId}"
                                onclick="return confirm('Voulez vous supprimer cet item ?');"><i
                                    class="fa fa-trash fa-lg" aria-hidden="true"></i></a>
                                    
                                </td>
                            </tr>
                            
                            </c:forEach>
                                  

                                </c:otherwise>
                        
                            </c:choose>
                    </table>
                
                </div>
            </div>
            
            <div class="col-sm3">
                <div class="panel-body">
                    <form  method="POST" action="GetStudentByNameServlet">
                  <label class="form-label"> Search a student</label>
                        
                        <input type="text" class="form-control" placeholder="Student Name" name="studentname" id="studentname" required>
                        
                         
                    
                <div align="right">
                       
                        <input type="submit" name="submit" id="submit" value="submit" class="btn btn-info">
                        <input type="reset" name="reset" id="reset" value="reset" class="btn btn-warning">
                
                </div>
                </form>
                    </div>
            </div>
        </div>
    </body>
</html>
