<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body>
	<h1>Welcome, <c:out value="${user.studentName}" /></h1> <a href="prioritySortHigh">Priority High - Low</a> <a href="prioritySortLow">Priority Low - High</a> <a href="/logout">Logout</a>
  <div class="table">
    <table class="table">
      <thead class="thead-dark">
      	<th>Course</th>
        <th>Instructor</th>
        <th>Signups</th>
        <th>Actions</th>
      </thead>
      <tbody>
          <c:forEach items="${courses}" var="course">
          <tr>
              <td><a href="/courses/${course.id}">${course.title}</a></td>
              <td>${course.instructor}</td>
              <td>${course.users.size()}/${course.capacity}</td>
              <c:choose>
              <c:when test="${course.users.size() >= course.capacity}">
                  <td>Full</td>
              </c:when>
                <c:otherwise>
                    <c:set var = "attending" value= "${false}"/>
                    <c:forEach items="${course.getUsers()}" var="attendee">
                        <c:if test="${attendee == user}">
                            <c:set var = "attending" value= "${true}"/>
                        </c:if>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${attending == false}">
                            <td><a href="/courses/${course.id}/join">Add</a></td>
                        </c:when>
                        <c:otherwise>
                            <td>Already Added</td>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
              </c:choose>
          </tr>
          </c:forEach>
      </tbody>
    </table>
    <div>
      <form action="/courses/new" method="post">
			  <input type="submit" value="Add Course">
		  </form>
    </div>
  </div>
</body>
</html>