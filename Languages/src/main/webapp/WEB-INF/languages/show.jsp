<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Language</title>
</head>
<body>
	<div class="form">
		<h3>
			<c:out value="${language.name}"/><br>
			<c:out value="${language.creator}"/><br>
			<c:out value="${language.version}"/><br>
			<a href="/languages/delete">delete</a><br>
			<a href="/languages/edit/${language.id}">edit</a>
		</h3>
	</div>
</body>
</html>