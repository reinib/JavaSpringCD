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
	<title>Edit Task</title>
	</head>
<body>
	<h1>Edit <c:out value="${task.title}"/></h1>
    <div class="form">
        <form:form action="/editTask/${task.id}" method="post" modelAttribute="editTask">
        <p>
            <form:label path="title">Task</form:label>
            <form:errors path="title"/>
            <form:input path="title"/>
            <form:input path="creator" type="hidden" value="${task.creator}"/>
        </p>
        <p>
            <form:label path="assignee" class="mr-sm-2" for="inlineFormCustomSelect">Assignee</form:label>
            <form:errors path="assignee"/>
            <form:select path="assignee"  class="custom-select mr-sm-2" id="inlineFormCustomSelect">
              <c:forEach items="${workers}" var="worker">
                <form:option path="assignee" value="${worker}">"${worker.name}"</form:option>
              </c:forEach>
            </form:select >
        </p>
        <p>
            <form:label path="priority" class="mr-sm-2" for="inlineFormCustomSelect">Priority</form:label>
            <form:errors path="priority"/>
            <form:select path="priority"  class="custom-select mr-sm-2" id="inlineFormCustomSelect">
              <form:option path="priority" value="low">Low</form:option>
              <form:option path="priority" value="medium">Medium</form:option>
              <form:option path="priority" value="high">High</form:option>
            </form:select >
        </p>
        	
        <input type="submit" value="Edit"/>
        </form:form>
    </div>
</body>
</html>
