<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>The Code</title>
</head>
<body>
	<div class="main">
		<h1>
			<p><c:out value="${error}"/></p>
			<form method="POST" action="/validate">
			    <label>What is the code?</label><br>
			    <input type="text" name="codeWord"><br>
			    <button>Try Code</button>
			</form>
		</h1>
	</div>
</body>
</html>