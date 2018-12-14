<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${event.name}</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  

</head>
<body>
    <div class="container">
        <a href="/events">Back</a>
        <h1>${event.name}</h1>
        <div class="col-md-6">
            <h4>Host: ${event.creator.firstName} ${event.creator.lastName}</h4>
            <h4>Date: <fmt:formatDate pattern = "MM/dd/yyyy" value="${event.date}"></fmt:formatDate></h4>
            <h4>Location: ${event.location}, ${event.state}</h4>
            <h4># People attending: ${event.Attendingusers.size()}</h4><br>
            <table class="table table-striped table-ruled">
                <tr>
                    <th>Name</th>
                    <th>Location</th>
                </tr>
                <c:forEach items="${users}" var="attendee">
                    <tr>
                        <td>${attendee.first} ${attendee.last}</td>
                        <td>${attendee.location}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>  
        <div class="col-md-6">
            <h3>Message Wall</h3>
            <div>
                <c:forEach items="${messages}" var="comment">
                    <p>${comment.user.first} says: ${comment.message}</p>
                </c:forEach>
            </div>
            <br>
            <form:form method="POST" action="/events/${event.id}/addmsg" modelAttribute="msg">
                <form:label path="message">Add Comment: </form:label><form:input path="message" type="textarea"/>
                <br>
                <input type="submit" value="Submit"/>
            </form:form>
            <br><p><form:errors path="msg.*"/></p>
        </div>
    </div>
</body>
</html>