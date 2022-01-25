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
    <script type="text/javascript" src="../../resources/js/function.js?v=12" charset="UTF-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>$(function () {
        $("#datepicker").datepicker();
    });</script>
    <title>Student-modify</title>
</head>

<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <div class="block__row">
            <div class="block__element_hidden"><a href="/home">На главную</a></div>
            <div class="block__element_hidden"><a href="/students">Назад</a></div>
        </div>
    </div>
    <div class="block__center">
        <h3>Для внесения изменения в запись студента заполните все поля и нажмите на кнопку "Применить"</h3>
        <label>Название</label>
        <form action="/student-modify" method="post"><br><br>
            <input name="id" type="hidden" value="${studentForJSP.id}">
            <input name="new_lastname" type="text" value="${studentForJSP.lastname}">
            <input name="new_name" type="text" value="${studentForJSP.name}">
            <input name="new_group" type="text" value="${studentForJSP.group}">
            <input name="new_date" type="text" id="datepicker" value="${studentForJSP.date}">
            <input type="submit" value="Применить">
        </form>
        <c:if test="${message eq 'error'}">
            <h5>Поле не должно быть пустым!</h5>
        </c:if>
    </div>
    </form>
</div>
<div class="block__left"></div>
</div>

</body>
</html>
