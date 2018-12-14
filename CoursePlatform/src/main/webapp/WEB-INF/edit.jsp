<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
	<meta charset="UTF-8">
	<title>Edit Course</title>
	</head>
<body>
	<h1>Edit <c:out value="${course.title}"/></h1>
    <div class="form">
        <form:form action="/editCourse/${course.id}" method="post" modelAttribute="editCourse">
        <p>
            <form:label path="title">Name: </form:label>
            <form:errors path="title"/>
            <form:input path="title"/>
        </p>
        <p>
            <form:label path="instructor" class="mr-sm-2" for="inlineFormCustomSelect">Instructor: </form:label>
            <form:errors path="instructor"/>
			<form:input class="form-control" type="text" path="instructor"/>
        </p>
        <p>
          <form:label path="capacity" class="mr-sm-2" for="inlineFormCustomSelect">Capacity: </form:label>
          <form:errors path="capacity"/>
          <form:input class="form-control" type="text" path="capacity"/>
        </p>
        	
        <input type="submit" value="Update"/>
        </form:form>
    </div>
</body>
</html>
