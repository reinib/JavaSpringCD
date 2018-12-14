<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
<body>
    <div class="header">
    	<a href="/dashboard">Dashboard</a>  
    </div> 
	<div class="show">
    <h1>Task: <c:out value="${task.title}"/></h1>
		<h3>
			Creator: <c:out value="${task.creator.name}"/><br>
      		Assignee: <c:out value="${task.assignee.name}"/><br>
			Priority: <c:out value="${task.priority}"/><br>
		</h3>
		<a href="/tasks/${task.id}/edit">Edit</a>
		<a href="/tasks/${task.id}/delete">Delete</a>
	</div>
</body>
</html>