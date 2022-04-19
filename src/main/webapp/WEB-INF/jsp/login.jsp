<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="../../resources/css/font.css?v=12">
    <title>login</title>
</head>
<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <a href="/home">На главную</a>
    </div>
    <div class="block__center">
        <form action="/login" method="post">
            <label>Введите логин:</label>
            <input type="text" name="login">
            <label>Введите пароль:</label>
            <input type="text" name="password">
            <label>Выбрать роль:</label>
            <select name="role">
                <option value="1">Администратор</option>
                <option value="2">Учитель</option>
                <option value="3">Студент</option>
            </select>
            <input type="submit" value="Войти">
            <c:if test="${message ==1}">
                <h3>Такой пользователь не найден</h3>
            </c:if>
        </form>
    </div>
    <div class="block__right"></div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
</body>
</html>
