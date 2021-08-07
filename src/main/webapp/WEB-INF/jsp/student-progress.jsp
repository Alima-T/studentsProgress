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
    <title>Student-progress</title>
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
<section class="general">
<div class="col-lg-8">
            <div class="margin-top">
                <div class="main-title-page">
                    Отображена успеваемость для следующего студента:
                </div>
            </div>
        </div>
 <div class="container">
    <div class="row">
        <div class="col-lg-12">
            <table class="table-main-info table-one-student">
                <input type="hidden" name="id" value="${id}">
                <tbody>

                <tr>
                    <th>Фамилия</th>
                    <th>Имя</th>
                    <th>Группа</th>
                    <th>Дата поступления</th>
                </tr>

                <tr>
                    <td>${student.lastname}</td>
                    <td>${student.name}</td>
                    <td>${student.id_group}</td>
                    <td>${student.date}</td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="display-flex start for-mobile-display-block">
                <div class="column-20"></div>
                <div>
                    <table class="table-main-info table-student-progress">
                        <tbody><tr>
                            <th>Дисциплина</th>
                            <th>Оценка</th>
                        </tr>

                        <c:forEach items="${disciplinesAndMarkByTerm}"  var="entry">
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
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
</body>

</html>
