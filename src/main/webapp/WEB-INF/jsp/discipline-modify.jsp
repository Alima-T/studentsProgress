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
    <title>Discipline-modify</title>
</head>

<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="left-block">
        <a href="../index.jsp">На главную</a>
        <a href="/disciplines">Назад</a>
    </div>
    <div class="center-block">
        <h4>Для внесения изменения в дисциплину заполните все поля и нажмите на кнопку "Применить"</h4>
    </div>
</div>
<div class="content">
    <label>Название</label>
    <form action="/discipline-modify" method="post">
        <input name="id" type="hidden" value="${disc.id}">
        <input name="disc" type="text" value="${disc.discipline}">
        <input type="submit" value="Применить">
    </form>
    <c:if test="${message eq 'error'}">
        <h5>Поле не должно быть пустым!</h5>
    </c:if>
</div>
</body>
</html>

