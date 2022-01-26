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
    <link rel="stylesheet" href="../../resources/css/font.css?v=12">
    <title>Discipline-create</title>
</head>

<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <div class="block__row">
            <div class="block__element_hidden"><a href="/home">На главную</a></div>
            <div class="block__element_hidden"><a href="/disciplines">Назад</a></div>
        </div>
    </div>
    <div class="block__center">
        <h4>Для создания новой дисциплины, заполните все поля и нажмите кнопку "Создать"</h4>
        <br>
        <label>Название</label>
        <form action="/discipline-create" method="post">
            <input type="text" name="newDisc">
            <input type="submit" value="Cоздать">
        </form>
        <c:if test="${message eq 'error'}">
            <h5 style="color: red">Поле не должно быть пустым!</h5>
        </c:if>
    </div>
    <div class="block__right"></div>
</div>
</body>
</html>
