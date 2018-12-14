<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Creator</th>
                    <th scope="col">Version</th>
                    <th scope="col">action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${languages}" var="language">
                <tr>
                    <th scope="row"><c:out value="${language.id}"/></th>
                    <td><a href='/languages/<c:out value="${language.id}"/>'><c:out value="${language.name}"/></a></td>
                    <td><c:out value="${language.creator}"/></td>
                    <td><c:out value="${language.version}"/></td>
                    <td><a href="/languages/delete/${language.id}">delete</a>  |  <a href='/languages/edit/<c:out value="${language.id}"/>'>edit</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="form">
        <form:form action="/languages" method="post" modelAttribute="language">
           <p>
               <form:label path="name">Name</form:label>
               <form:errors path="name"/>
               <form:input path="name"/>
           </p>
           <p>
               <form:label path="creator">Creator</form:label>
               <form:errors path="creator"/>
               <form:input path="creator"/>
           </p>
           <p>
               <form:label path="version">Version</form:label>
               <form:errors path="version"/>
               <form:input path="version"/>
           </p>   
           <input type="submit" value="Submit"/>
        </form:form> 
    </div>
</body>
</html>