<%--
  Created by IntelliJ IDEA.
  User: Alina
  Date: 11/28/2021
  Time: 4:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css?v=12">
    <link rel="stylesheet" href="../../resources/css/font.css?v=12">
    <title>Header</title>
</head>
<body>
<br>
<div class="main inline">
    <div class="block__left">
        <p></p>
    </div>
    <div class="block__center">
        <p class="title_all_pages">Система управления студентами и их успеваемостью</p>
    </div>
    <div class="block__right">
        <c:choose>
            <c:when test="${role ne null}">
                <a href="/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="/login">Login</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>

</html>
