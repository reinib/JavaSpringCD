
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page import= "java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body>
	<h1>Welcome, <c:out value="${user.email}" /></h1><a href="/logout">Logout</a>
	<h5>Here are some o the events in your state:</h5>
  <div class="inState">
    <table>
      <thead>
      	<th>Name</th>
        <th>Date</th>
        <th>Location</th>
        <th>Host</th>
        <th>Action/Status</th>
      </thead>
      <c:forEach items="${instate}" var="event">
      <tr>
          <td><a href="/events/${event.id}">${event.name}</a></td>
          <td><fmt:formatDate pattern = "MM/dd/yyyy" value="${event.date}"></fmt:formatDate></td>
          <td>${event.location}, ${event.state}</td>
          <td>${event.creator.firstName} ${event.creator.lastName}</td>
          <c:choose>
              <c:when test="${event.creator == user}">
                  <td><a href="/events/${event.id}/edit">Edit</a> | <a href="events/${event.id}/delete">Delete</a></td>
              </c:when>
              <c:otherwise>
                  <c:set var = "attending" value= "${false}"/>
                  <c:forEach items="${event.getUsersAttending()}" var="attendee">
                      <c:if test="${attendee == user}">
                          <c:set var = "attending" value= "${true}"/>
                      </c:if>
                  </c:forEach>
                  <c:choose>
                      <c:when test="${attending == false}">
                          <td><a href="/events/${event.id}/join">Join</a></td>
                      </c:when>
                      <c:otherwise>
                          <td>Joining | <a href="events/${event.id}/leave">Cancel</a></td>
                      </c:otherwise>
                  </c:choose>
              </c:otherwise>
          </c:choose>
      </tr>
      </c:forEach>
    </table>
  </div>
	<div class="outState">
    <h5>Here are some of the events in other states</h5>
    <table>
      <thead>
        <th>Name</th>
        <th>Date</th>
        <th>Location</th>
        <th>State</th>
        <th>Host</th>
        <th>Action/Status</th>
      </thead>
      <c:forEach items="${outState}" var="event">
      <tr>
          <td><a href="/events/${event.id}">${event.name}</a></td>
          <td><fmt:formatDate pattern = "MM/dd/yyyy" value="${event.date}"></fmt:formatDate></td>
          <td>${event.location}</td>
          <td>${event.state}</td>
          <td>${event.creator.firstName} ${event.creator.lastName}</td>
          <c:choose>
                <c:when test="${event.creator == user}">
                    <td>Joining | <a href="/events/${event.id}/edit">Edit</a> | <a href="events/${event.id}/delete">Delete</a></td>
                </c:when>
                <c:otherwise>
                    <c:set var = "attending" value= "${false}"/>
                    <c:forEach items="${event.getUsersAttending()}" var="attendee">
                        <c:if test="${attendee == user}">
                            <c:set var = "attending" value= "${true}"/>
                        </c:if>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${attending == false}">
                            <td><a href="/events/${event.id}/join">Join</a></td>
                        </c:when>
                        <c:otherwise>
                            <td>Joining | <a href="events/${event.id}/leave">Cancel</a></td>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
    </table>
  </div>
  <div class="createEvent">
    <form:form method="POST" action="/createEvent" modelAttribute="event">
        <p>
            <form:label path="name">Name:</form:label>
            <form:input type="text" path="name"/>
        </p>
        <p>
			<form:label path="date">Date: </form:label>
			<form:input type="date" path="date" max="2020-12-31"/>
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
        <input type="submit" value="Create"/>
    </form:form>
	 <div><p><form:errors path="course.*"/></p></div>
  </div>
</body>
</html>
