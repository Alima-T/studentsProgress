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
    <title>Students</title>
</head>

<body>
<div class="main inline">
    <div class="left-block">
        <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
    </div>

    <div class="content">
        <h1>Система управления студентами и их успеваемостью</h1>
        <div class="col-md-4">
            <form action="/student-progress" method="get">
                <input type="hidden" name="idStudent" id="progressId"><%--  name передаем в контроллер StudentProgressController--%>
                <input class="black-button big-button" type="submit"
                       value="Посмотреть успеваемость выбранных студентов" onclick="studentProgress()">
            </form>
            <h4>Список студентов</h4>
            <section class="general">
                <div class="container">
                    <div class="container">
                        <table>
                            <tr>
                                <th>Выбрать</th>
                                <th>Фамилия</th>
                                <th>Имя</th>
                                <th>Группа</th>
                                <th>Дата поступления</th>
                            </tr>
                            <c:forEach items="${allStudents}"
                                       var="stud">   <%--  allStudents - copypass из StudentsController req.setAttribute("allStudents", students);--%>
                                <tr>
                                    <td><input type="checkbox" value="${stud.id}"></td>
                                    <td>${stud.lastname}</td>
                                    <td>${stud.name}</td>
                                    <td>${stud.id_group}</td>
                                    <td><fmt:formatDate value="${stud.date}" pattern="yyyy/MM/dd"></fmt:formatDate></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </section>
        </div>
        <div class="col-md-4">
            <section class="role-1">
                <div class="submin">
                    <div class="row">
                        <div class="col-md-6">
                            <c:if test="${role == 1}">
                                <form action="/student-create" method="get">
                                    <input type="submit" value="Создать студента">
                                </form>
                                <br>
                                <input type="submit" onclick="modifyStudent()"
                                       value="Изменить запись выбранного студента">
                                <br>
                                <br>
                                <input type="submit" onclick="deleteStudents()"
                                       value="Удалить записи выбранных студентов">
                            </c:if>
                            <form id="formModify" action="/student-modify" method="get">
                                <input type="hidden" id="hiddenModify" name="hiddenModify">
                            </form>
                            <form id="formDelete" action="/student-delete" method="post">
                                <input type="hidden" id="hiddenDelete" name="hiddenDelete">
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <div class="right-block">
        <c:choose>
            <c:when test="${role ne null}">
                <a href="/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="/login">Login</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

</body>
</html>