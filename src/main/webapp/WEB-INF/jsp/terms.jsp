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
    <title>Terms</title>
</head>

<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <a href="/home">На главную</a>
    </div>
    <div class="block__center"></div>
    <div class="block__right"></div>
</div>
<div class="container">
    <div class="block">
        <div class="row">
            <h4>Выбрать семестр</h4>
            <form action="/terms" method="get">
                <select name="selected" style="padding: 2px 150px 2px 5px">
                    <c:forEach items="${terms}" var="t">
                        <c:choose>
                            <c:when test="${t.id == selectedTerm.id}">
                                <option selected value="${t.id}">${t.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${t.id}">${t.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <input type="submit" value="Выбрать">
            </form>
        </div>
        <br><br>
        <h4 style="float: left; padding-right: 10px">Длительность семестра: </h4>
            <c:forEach items="${terms}" var="t">
                <c:choose>
                    <c:when test="${t.id == selectedTerm.id}">
                        <div value="${t.id}">${t.duration}</div>
                    </c:when>
                </c:choose>
            </c:forEach>
        <br>
        <h4>Список дисциплин семестра </h4>
        <br>
        <table class="table__left">
            <tr>
                <th>Название дисциплины</th>
            </tr>
            <c:forEach items="${disciplines}" var="d">
                <tr>
                    <td>${d.discipline}</td>
                </tr>
            </c:forEach>
        </table>
        <%--        <c:if test="${role == 1}">--%>
        <div class="block__row__column">
            <div class="block__form3 block__element_2">
                <form action="/term-create" method="get">
                    <input class="inblock" type="submit" value="Создать семестр">
                </form>
            </div>
            <div class="block__form3 block__element_2">
                <form action="/term-modify" method="get">
                    <input class="inblock" type="submit" onclick="modifyTerm()"
                           value="Модифицировать выбранный семестр">
                                        <input type="hidden" id="hiddenModify" name="hiddenModify">
                    <input type="hidden" value="${selectedTerm.id}" name="idModify">
                </form>
            </div>
            <div class="block__form3 block__element_2">
                <input class="inblock" type="submit" value="Удалить выбранный семестр">
                <form id="formDelete" action="/term-delete" method="post">
                    <input type="hidden" id="hiddenDelete"
                           name="hiddenDelete"> <%--найти переименован из hiddenDelete--%>
                </form>
                <%--                </c:if>--%>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>
</html>
