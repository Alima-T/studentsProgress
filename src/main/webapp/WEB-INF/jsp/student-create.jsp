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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
    <title>Student-create</title>
</head>
<body>
<section class="header">
    <div class="container">
        <div class="sheme_input">
            <ul class="nav nav-pills navbar">
                <li class="nav-item ">
                    <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
                    <a class="a-na-glavnuu" href="/students">Назад</a>
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

<h3>Для создания новой записи студента введите данные и нажмите на кнопку "Создать"</h3>

<form action="/student-create" method="post">

    <label>Фамилия</label>
    <input type="text" lastname="creatStudLastname">

    <label>Имя</label>
    <input type="text" name="creatStudName">

    <label>Группа</label>
    <input type="text" group="creatStudGroup">

    <label>Дата</label>
    <input type="text" id="datepicker" name="date">

    <input type="submit" value="Создать">
</form>

<c:if test="${message eq 'error'}">
    <h5>Поле не должно быть пустым!</h5>
</c:if>


</body>
</html>
