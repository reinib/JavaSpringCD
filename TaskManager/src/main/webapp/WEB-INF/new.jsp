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
<title>Create Task</title>
</head>
<body>
    <div class="new">
        <form:form action="/dashboard" method="post" modelAttribute="task">
          <div class="new" class="form-group">
            <p>
              <form:label path="title">Task</form:label>
              <form:errors path="title"/>
              <form:input class="form-control" type="text" path="title"/>
            </p>
            <p>
              <form:label path="assignee" class="mr-sm-2" for="inlineFormCustomSelect">Assignee</form:label>
              <form:errors path="assignee"/>
              <form:select path="assignee"  class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                <c:forEach items="${workers}" var="worker">
                  <form:option path="assignee" value="${worker}">${worker.name}</form:option>
                </c:forEach>
              </form:select >
            </p>
            <p>
              <form:label path="priority" class="mr-sm-2" for="inlineFormCustomSelect">Priority</form:label>
              <form:errors path="priority"/>
              <form:select path="priority"  class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                <form:option path="priority" value="low">Low</form:option>
                <form:option path="priority" value="medium">Medium</form:option>
                <form:option path="priority" value="high">High</form:option>
              </form:select >
            </p>
               <input type="submit" value="Create">
          	 <!--   <button type="submit" class="btn btn-primary">Create</button>    -->       
          </div>
        </form:form>
    </div>
</body>
</html>

</html>
