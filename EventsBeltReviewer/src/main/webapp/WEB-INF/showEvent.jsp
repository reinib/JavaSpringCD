<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body>
  <div class="left">
    <h1><c:out value="${event.name}"/></h1>
    <h4>Host: <c:out value="${event.creator}"/></h4>
    <h4>Host: <c:out value="${event.date}"/></h4>
    <h4>Host: <c:out value="${event.location}"/>, <c:out value="${event.state}"/></h4>
    <h4>Host: <c:out value="${event.creator}"/></h4>
    <h4>Host: <c:out value="${event.creator}"/></h4>
    <table>
      <thead>
        <th>Name</th>
        <th>Location</th>
      </thead>
      <c:forEach items="${events}" var="event">
      <tr>
          <td>${event.name}/></td>
          <td>${event.location}/></td>
      </tr>
      </c:forEach>      
    </table>    
  </div>
  <div class="right">
    <h1>Message Wall</h1>
    <ul>
      <c:forEach items="${messages}" var="message">
          <li>${message.message}</li>
      </c:forEach>  
    </ul>
    <form:form method="POST" action="/createMessage" modelAttribute="message">
        <p>
            <form:label path="message">Add Comment: </form:label>
            <textarea path="message" rows="8" cols="80"></textarea>
        </p>
        <input type="submit" value="Submit"/>
    </form:form>    
  </div>
  
</html>