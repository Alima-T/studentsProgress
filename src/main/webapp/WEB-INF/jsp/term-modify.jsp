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
    <link rel="stylesheet" href="../../resources/css/style.css">
    <link rel="stylesheet" href="../../resources/css/font.css?v=12">
    <title>term-modify</title>
</head>
<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <div class="block__row">
            <div class="block__element_hidden"><a href="/home">На главную</a></div>
            <div class="block__element_hidden"><a href="/terms">Назад</a></div>
        </div>
    </div>
    <div class="block__center">
        <h3>Для модификации семестра отредактируйте данные и нажмите на кнопку "Применить" </h3>
    <section>
        <br>
        <form action="/term-modify" method="post">
        <label style="vertical-align: top">Длительность в неделях: </label>
        <input style="width: 300px" type="text" value="${term.duration}">

        <br>

        <label style="vertical-align: top">Дисциплины в семестре: </label>

        <select multiple class="multiple">
            <c:forEach items="${allDisciplines}" var="disc">
                <c:if test="${disc.selected}">
                    <option selected>${disc.discipline}</option>
                </c:if>
                <c:if test="${not disc.selected}">
                    <option>${disc.discipline}</option>
                </c:if>
            </c:forEach>
            <input style="margin-left: 10px" type="submit" value="Применить">
        </select>
        </form>
    </section>
    </div>
    <div class="block__right"></div>
</div>

</body>
</html>
