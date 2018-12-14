<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Counter</title>
</head>
<body>
    <div class="main">

        <h1>
            You have visited <a href="/">localhost:8080</a> <c:out value="${count}"/> times <a href="/">Test another visit?</a>
        </h1>
    </div> 
</body>
</html>