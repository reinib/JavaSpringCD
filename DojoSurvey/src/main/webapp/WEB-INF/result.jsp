<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<h1>Submitted Info</h1>
		<h4>Name: <c:out value="${name}"/></h4>
		<h4>Dojo Location: <c:out value="${location}"/></h4>
		<h4>Favorite Language: <c:out value="${language}"/></h4>
		<h4>Comment: <c:out value="${comment}"/></h4>
		<form action="/"><input type="submit" name="back" value="Go Back"></form>
	</div>

</body>
</html>