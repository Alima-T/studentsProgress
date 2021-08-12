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
<section class="header">
    <div class="container">
        <div class="sheme_input">
            <ul class="nav nav-pills navbar">
                <li class="nav-item ">
                    <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
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
<section class="role-1">
    <div class="submin">
        <div class="row">
            <div class="col-md-6">
                <form action="/student-progress" method="get">
                    <input type="hidden" name="idStudent" id="progressId"><%--  name передаем в контроллер StudentProgressController--%>
                    <input class="black-button big-button" type="submit"
                           value="Посмотреть успеваемость выбранных студентов" onclick="studentProgress()">
                </form>
            </div>
            <c:if test="${role == 1}">
                    <form action="/student-create"method="get">
                        <input type="submit" value="Создать студента">
                    </form>
                    <input type="submit" onclick="modifyStudent()" value="Изменить запись выбранного студента">
                    <input type="submit" onclick="deleteStudents()" value="Удалить записи выбранных студентов">

                    <form id="formModify" action="/student-modify" method = "get">
                    <input type ="hidden" id="hiddenModifyId" name= "hiddenModify">
                </form>
                <form id="formDelete" action="/students-delete" method = "post">
                    <input type ="hidden" id="hiddenDelete" name= "hiddenDelete">
                </form>
          </c:if>
        </div>
    </div>
</section>
<section class="general">
    <div class="container">
        <div class="container">
            <table class="table table-striped">
                  <tr>
                    <td>Выбрать</td>
                    <td>Фамилия</td>
                    <td>Имя</td>
                    <td>Группа</td>
                    <td>Дата поступления</td>
                </tr>
                <c:forEach items="${allStudents}" var="stud">   <%--  allStudents - copypass из req.setAttribute - DisciplinesController&ndash;%&gt;--%>
                <tr>
                    <td><input type="checkbox" value="${stud.id}"></td>
                    <td>${stud.lastname}</td>
                    <td>${stud.name}</td>
                    <td>${stud.id_group}</td>
                    <td><fmt:formatDate value = "${stud.date}" pattern="dd/mm/yyyy"></fmt:formatDate></td>
                </tr>
                </c:forEach>

            </table>
            </table>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

</body>
</html>