<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body>
	<h1>Welcome, <c:out value="${user.name}" /></h1> <a href="prioritySortHigh">Priority High - Low</a> <a href="prioritySortLow">Priority Low - High</a> <a href="/logout">Logout</a>
  <div class="table">
    <table class="table">
      <thead class="thead-dark">
      	<th>Task</th>
        <th>Creator</th>
        <th>Assignee</th>
        <th>Priority</th>
      </thead>
      <tbody>
          <c:forEach items="${tasks}" var="task">
          <tr>
              <td><a href="/tasks/${task.id}">${task.title}</a></td>
              <td>${task.creator.name}</td>
              <td>${task.assignee.name}</td>
              <td>${task.priority}</td>
          </tr>
          </c:forEach>
      </tbody>
    </table>
    <div>
      <form action="/tasks/new" method="post">
			  <input type="submit" value="Create Task">
		  </form> 
    </div>    
  </div>
</body>
</html>