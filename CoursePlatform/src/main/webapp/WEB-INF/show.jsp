<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>Courses</title>
	</head>
<body>
    <div class="header">
    	<a href="/dashboard">Dashboard</a>
    </div>
	<div class="show">
    <h1>Task: <c:out value="${course.title}"/></h1>
		<h3>
		  Instructor: <c:out value="${course.instructor}"/><br>
      	  Signups: <c:out value="${course.users.size()}"/><br>
		</h3>
    <div class="table">
        <table class="table">
          <thead class="thead-dark">
          	<th>Name</th>
            <th>Sign Up Date</th>
            <th>Action</th>
          </thead>
          <tbody>
              <c:forEach items="${students}" var="student">
              <tr>
                  <td>${student.studentName}</td>
                  <td><fmt:formatDate pattern = "MM/dd/yyyy" value="${date}"></fmt:formatDate></td>
                  <c:if test="${student == user}">
                  	<td><a href="/courses/${course.id}/leave">Remove</a></td>
                  </c:if>
              </tr>
              </c:forEach>
          </tbody>
        </table>
        <div>
		<a href="/courses/${course.id}/edit">Edit</a>
		<a href="/courses/${course.id}/delete">Delete</a>
	</div>
</body>
</html>
