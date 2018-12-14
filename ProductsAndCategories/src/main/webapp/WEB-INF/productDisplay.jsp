<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.name}</title>
</head>
  <body>
      <h1>${product.name}</h1>
      <div>
          <h3>Categories:</h3>
          <ul>
      			<c:forEach items="${product.categories}" var="category">
      				<li><c:out value="${category.name}"/></li>
      			</c:forEach>
      		</ul>
          <c:if test="${!empty categories}">
      		<h3>Add a Category</h3>
      		<form action="/products/${product.id}" method="POST">
      			<div>
      				<label for="category">Category: </label>
      				<select name="category">
      					<c:forEach items="${categories}" var="category">
              					<option value="${category.id}"><c:out value="${category.name}"/></option>
         					</c:forEach>
      				</select>
      			</div>
      			<input type="submit" value="Add Category">
      		</form>
      		</c:if>
      </div>
  </body>
</html>