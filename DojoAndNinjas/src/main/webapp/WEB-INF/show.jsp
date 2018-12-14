<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
<meta charset="UTF-8">
<title>${dojo.name} Ninjas</title>
</head>
  <body>
      <div>
        <h1>${dojo.name} Location Ninjas</h1>
      </div>
      <div>
          <table >
              <thead>
                  <tr>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Age</th>
                  </tr>
              </thead>
              <tbody>
                  <c:forEach items="${ninjas}" var="ninja">
                  <tr>
                      <td><c:out value="${ninja.firstName}"/></td>
                      <td><c:out value="${ninja.lastName}"/></td>
                      <td><c:out value="${ninja.age}"/></td>
                  </tr>
                  </c:forEach>
              </tbody>
          </table>
      </div>
  </body>
</html>