<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit</title>
</head>
<body>
  <h1><c:out value="${event.name}"/></h1>
  <form:form method="POST" action="/editEvent" modelAttribute="event">
      <p>
          <form:label path="name">Name:</form:label>
          <form:input type="text" path="name"/>
      </p>
      <p>
          <form:label path="date">Date:</form:label>
          <form:password path="date"/>
      </p>
      <p>
          <form:label path="location">Location:</form:label>
          <form:password path="location"/>
      </p>
      <p>
          <form:label path="state">State:</form:label>
          <form:select path="state">
              <form:option path="state" value="WA">WA</form:option>
              <form:option path="state" value="CA">CA</form:option>
              <form:option path="state" value="TX">TX</form:option>
              <form:option path="state" value="OK">OK</form:option>
              <form:option path="state" value="NY">NY</form:option>
              <form:option path="state" value="AZ">AZ</form:option>
              <form:option path="state" value="AK">AK</form:option>
              <form:option path="state" value="OR">OR</form:option>
              <form:option path="state" value="FL">FL</form:option>
              <form:option path="state" value="CO">CO</form:option>
            </form:select >
      </p>
      <input type="submit" value="Edit"/>
  </form:form>  
  
</html>