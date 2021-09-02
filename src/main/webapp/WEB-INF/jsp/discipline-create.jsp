<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css?v=12">
    <title>Discipline-create</title>
</head>

<body>
<div class="main inline">
    <div class="left-block">
        <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
        <a class="a-na-glavnuu" href="/disciplines">Назад</a>
    </div>

    <div class="content">
        <h1>Система управления студентами и их успеваемостью</h1>
        <div class="col-md-4">
            <h3>Для создания новой дисциплины, заполните все поля и нажмите кнопку "Создать"</h3>
            <label>Название</label>
            <form action="/discipline-create" method="post">
                <input type="text" name="newDisc">
                <input type="submit" value="Cоздать">
            </form>
            <c:if test="${message eq 'error'}">
                <h5>Поле не должно быть пустым!</h5>
            </c:if>
        </div>
    </div>
    <div class="right-block">
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
