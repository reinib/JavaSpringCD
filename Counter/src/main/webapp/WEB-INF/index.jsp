<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Counter</title>
</head>
<body>
    <div class="main">
        <h1>
            Welcome User!
            <h4><a href="/counter">Display counts</a></h4>
            <%
            	Integer i = (Integer)session.getAttribute("count");
            	
            	if(i==null || i==0){
            		i=1;
            	}
            	else{
            		i++;
            	}
            	session.setAttribute("count", i);
            %>
        </h1>
    </div> 
</body>
</html>