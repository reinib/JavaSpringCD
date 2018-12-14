<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
<meta charset="UTF-8">
<title>Create a new Ninja</title>
</head>
  <body>
  	<h1>New Ninja</h1>
  	    <form:form action="/create/ninja" method="post" modelAttribute="ninja">
          <p>
              <form:label path="dojo">Dojo: </form:label>
              <form:errors path="dojo"/>
              <form:select path="dojo">
                  <c:forEach items="${dojos}" var="dojo">
                  <form:option value="${dojo.id}">${dojo.name}</form:option>
                  </c:forEach>
              </form:select>
          </p>
          <p>
              <form:label path="firstName">First Name: </form:label>
              <form:errors path="firstName"/>
              <form:input path="firstName"/>
          </p>
          <p>
              <form:label path="lastName">Last Name: </form:label>
              <form:errors path="lastName"/>
              <form:input path="lastName"/>
          </p>
          <p>
              <form:label path="age">Age: </form:label>
              <form:errors path="age"/>
              <form:input path="age"/>          	  
          </p>
          <input type="submit" value="create"/>
          </form:form>
  </body>
</html>