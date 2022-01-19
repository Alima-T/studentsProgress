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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>$(function () {
        $("#datepicker").datepicker();
    });</script>
    <title>Student-create</title>
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
    <div class="center-block">
        <h3>Для создания новой записи студента введите данные и нажмите на кнопку "Создать"</h3>
        <%-- оборачиваем в form, иначе не работают кнопки.
        action передает данные на контроллер по urlPatterns = "/student-create"--%>
        <form action="/student-create" method="post">
            <input type="text" placeholder="Фамилия" lastname="createStudLastname" maxlength="50" size="35" class="text"value="${student.lastname}"><br><br>
            <input type="text" placeholder="Имя" name="createStudName" maxlength="50" size="35" class="text" value="${student.name}"><br><br>
            <input type="text" placeholder="Группа" group="createStudGroup" maxlength="5" size="5" class="text" value="${student.id_group}"><br><br>
            <input type="text" placeholder="Дата поступления" id="datepicker" name="date" maxlength="10" size="10" class="text"value="${student.date}"><br><br>
<%--            <input type="text" placeholder="Статус" name="createStatus" maxlength="5" size="5" class="text" value="${student.status}"><br><br>--%>
            <input type="submit" value="Создать">
        </form>
        <c:if test="${message eq 'error'}">
            <h5>Поле не должно быть пустым!</h5>
        </c:if>
    </div>
</div>
</body>
</html>
