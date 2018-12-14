<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
<meta charset="UTF-8">
<title>New Category</title>
</head>
<body>
	<h1>New Category</h1>
	    <form:form action="/create/category" method="post" modelAttribute="category">
        <p>
            <form:label path="name">Name: </form:label>
            <form:errors path="name"/>
            <form:input path="name"/>
        </p>
        <input type="submit" value="Create"/>
        </form:form> 
</body>
</html>