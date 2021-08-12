<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css?v=12">
    <title>Discipline-modify</title>
</head>

<body>
<section class="header">
    <div class="container">
        <div class="sheme_input">
            <ul class="nav nav-pills navbar">
                <li class="nav-item ">
                    <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
                    <a class="a-na-glavnuu" href="/disciplines">Назад</a>
                </li>
                <li class="nav-item ">
                    <c:choose>
                        <c:when test="${role ne null}">
                            <a href="/logout">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/login">Login</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
            <div></div>
            <h1>Система управления студентами и их успеваемостью</h1>
        </div>
    </div>
</section>
<h3>Для внесения изменения в дисциплину заполните все поля и нажмите на кнопку "Применить"</h3>
<label>Название</label>
<form action="/discipline-modify" method="post">
    <input name="id" type="hidden" value="${disc.id}">
    <input name="disc" type="text" value="${disc.discipline}">
    <input type = "submit" value = "Применить">
</form>
<c:if test="${message eq 'error'}">
    <h5>Поле не должно быть пустым!</h5>
</c:if>

</body>
</html>

