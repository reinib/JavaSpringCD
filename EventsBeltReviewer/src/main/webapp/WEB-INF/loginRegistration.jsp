<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <meta charset="UTF-8">
    <title>Login and Register</title>
</head>
<body>
    <h1>Welcome</h1>
    <div class="box">
      <h1>Register!</h1>

      <p><form:errors path="user.*"/></p>

      <form:form method="POST" action="/registration" modelAttribute="user">
          <p>
              <form:label path="email">Email:</form:label>
              <form:input type="text" path="email"/>
          </p>
          <p>
              <form:label path="password">Password:</form:label>
              <form:password path="password"/>
          </p>
          <p>
              <form:label path="passwordConfirmation">Password Confirmation:</form:label>
              <form:password path="passwordConfirmation"/>
          </p>
          <input type="submit" value="Register!"/>
      </form:form>
    </div>
    <div class="box">
      <h1>Login</h1>
      <p><c:out value="${error}" /></p>
      <form method="post" action="/login">
          <p>
              <label type="email" for="email">Email</label>
              <input type="text" id="email" name="email"/>
          </p>
          <p>
              <label for="password">Password</label>
              <input type="password" id="password" name="password"/>
          </p>
          <input type="submit" value="Login!"/>
      </form>
    </div>
</body>
</html>