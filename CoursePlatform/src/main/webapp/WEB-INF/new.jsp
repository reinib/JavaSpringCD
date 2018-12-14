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
<title>Create a new course</title>
</head>
<body>
    <div class="new">
        <form:form action="/dashboard" method="post" modelAttribute="course">
          <div class="new" class="form-group">
            <p>
              <form:label path="title" class="mr-sm-2" for="inlineFormCustomSelect">Name: </form:label>
              <form:errors path="title"/>
              <form:input class="form-control" type="text" path="title"/>
            </p>
            <p>
              <form:label path="instructor" class="mr-sm-2" for="inlineFormCustomSelect">Instructor: </form:label>
              <form:errors path="instructor"/>
			   <form:input class="form-control" type="text" path="instructor"/>
            </p>
            <p>
              <form:label path="capacity" class="mr-sm-2" for="inlineFormCustomSelect">Capacity: </form:label>
              <form:errors path="capacity"/>
               <form:input class="form-control" type="text" path="capacity"/>
            </p>
               <input type="submit" value="Create">
          	 <!--   <button type="submit" class="btn btn-primary">Create</button>    -->       
          </div>
        </form:form>
    </div>
</body>
</html>

</html>
