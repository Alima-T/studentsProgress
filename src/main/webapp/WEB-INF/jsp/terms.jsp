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
    <script type="text/javascript" src="../../resoures/js/function.js?v=3" charset="UTF-8"></script>
    <title>Terms</title>
</head>

<body>
<c:import url="common/header.jsp"/>

<div class="content">
    <div class="main inline">
        <h4>Выбрать семестр </h4>
        <div class="row">
            <form action="/terms" method="get">
                <%--            <div class="col-md-3">--%>
                <%--                <div class="submin_le">--%>
                <select name="selected" class="form-select term" aria-label="Default select example">
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
                <%--                </div>--%>
                <%--            </div>--%>
                <%--            <div class="col-md-3">--%>
                <%--                <div class="submin_le">--%>
                <div class="choose_input">
                    <input type="submit" value="Выбрать">
                </div>
                <%--                </div>--%>
                <%--            </div>--%>
            </form>
        </div>
    </div>

    <div class="container">
        <div class="left-side-bar">
            <h4>Список дисциплин в семестре </h4>
            <table>
                <tr>
                    <th>Название дисциплины</th>
                </tr>
                <c:forEach items="${disciplines}" var="d">
                    <tr>
                        <td>${d.discipline}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="right-side-bar">
            <%--            <div class="col-md-4">--%>
            <table>
                <c:if test="${role == 1}">

                    <%--                        <div class="col-md-4">--%>
                    <%--                            <div class="submin_le">--%>
                <form action="/terms-modify" method="get">
                    <input type="submit" value="Создать семестр">
                </form>
                <br>
                <input type="submit" onclick="modifyTerm()" value="Модифицировать выбранный семестр">
                <input type="hidden" id="hiddenModify" name="hiddenModify">
                    <%--                    <input type="hidden" value="${selectedTerm.id}" name="idModify">--%>
                </form>
                <br>
                <input type="submit" value="Удалить выбранный семестр">
                <form id="formDelete" action="/term-delete" method="post">
                    <input type="hidden" id="hiddenDelete" name="hiddenDelete">
                </form>
                </c:if>
            </table>
        </div>
    </div>
</div>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>
</html>
