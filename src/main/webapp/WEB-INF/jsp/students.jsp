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
    <title>Students</title>
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
        <div class="block__row">
            <div class="block__form4 block__element_2">
                <form action="/student-progress" method="get">
                    <input type="hidden" name="idStudent" id="progressId">
                    <input class="inblock" type="submit" onclick="studentProgress()"
                           value="Посмотреть успеваемость выбранных студентов">
                </form>
            </div>
<%--            <c:if test="${role == 1}">--%>
                <div class="block__form4 block__element_2">
                    <form action="/student-create" method="get">
                        <input class="inblock" type="submit" value="Создать студента">
                    </form>
                </div>
                <div class="block__form4 block__element_2">
                    <form id="formModify" action="/student-modify" method="get">
                        <input class="inblock" type="submit" onclick="modifyStudent()"
                               value="Изменить запись выбранного студента">
                        <input type="hidden" id="hiddenModify" name="hiddenModify">
                    </form>
                </div>
                <div class="block__form4 block__element_2">
                    <form id="formDelete" action="/students-delete" method="post">
                        <input class="inblock" type="submit" onclick="deleteStudents()"
                               value="Удалить записи выбранных студентов">
                        <input type="hidden" id="hiddenDeleteStud" name="hiddenDeleteStud">
                    </form>
                </div>
<%--            </c:if>--%>
        </div>
    </div>
    <br>
    <h4>Список студентов</h4>
    <table class="table-student-list">
        <tr>
<%--            <c:if test="${role == 1}">--%>
            <th style="width: 10%">Выбрать</th>
<%--            </c:if>--%>
            <th style="width: 30%">Фамилия</th>
            <th style="width: 30%">Имя</th>
            <th style="width: 15%">Группа</th>
            <th style="width: 15%">Дата поступления</th>
        </tr>
        <c:forEach items="${allStudents}"
                   var="stud">   <%--  allStudents - copypass из StudentsController req.setAttribute("allStudents", students);--%>
            <tr>
<%--                <c:if test="${role == 1}">--%>
                <td><input type="checkbox" value="${stud.id}"></td>
<%--                </c:if>--%>
                <td>${stud.lastname}</td>
                <td>${stud.name}</td>
                <td>${stud.group}</td>
                <td><fmt:formatDate value="${stud.date}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>