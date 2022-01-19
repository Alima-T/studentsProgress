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
    <title>Student-progress</title>
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
        <h3>Отображена успеваемость для следующего студента:</h3>
        <div class="col-md-4">
            <h4>Выбрать семестр </h4>
            <div class="row">
                <form action="/terms" method="get">
                    <div class="col-md-3">
                        <div class="submin_le">
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
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="submin_le">
                            <div class="choose_input">
                                <input type="submit" class="btn btn-primary apply" value="Выбрать">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <h4>Средняя оценка за семестр: 4,6 баллов</h4>
            <div class="col-md-5">
                <table class="table-main-info table-student-progress">
                    <tbody>
                    <tr>
                        <th class="table-active">Дисциплина</th>
                        <th>Оценка</th>
                    </tr>
                    <c:forEach items="${disciplines}" var="d">
                        <tr>
                            <td>${d.discipline}</td>
                            <td>${entry.value}</td>
                            --%>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${disciplinesAndMarkByTerm}" var="entry">
                        <tr>
                            <td>${entry.key.discipline}</td>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>
</html>
