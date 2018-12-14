<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Dojo Survey</title>
</head>
<body>
    <div class="main">
        <h3>
        	<h1>Dojo Survey</h1><br><br>
            <form action="/result" method="POST">
                <label >Your Name: <input type="text" name="name"></label><br>
                <label >Dojo Location: 
                        <select name="location">
                            <option value="seattle">Seattle</option>
                            <option value="sanjose">San Jose</option>
                            <option value="burbank">Burbank</option>
                            <option value="dallas">Dallas</option>
                            <option value="newyork">New York</option>
                        </select>
                    </label><br>
                <label >Favorite language: 
                    <select name="language">
                        <option value="javascript">JavaScript</option>
                        <option value="python">Python</option>
                        <option value="java">Java</option>
                        <option value="mean">Mean</option>
                        <option value="csharp">C sharp</option>
                    </select>
                </label><br><br>
                Comment (optional): <br><textarea name="comment" id="" cols="30" rows="5"></textarea><br>
                <input type="submit"  name="submit" value="Button">
            </form>
        </h3>
    </div>
</body>
</html>