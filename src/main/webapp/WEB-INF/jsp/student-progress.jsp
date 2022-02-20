<%--
  Created by IntelliJ IDEA.
  User: Alina
  Date: 1/30/2022
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <div class="block__center">
        <h3>Отображена успеваемость для следующего студента:</h3>
        <table class="table-student-list">
            <tr>
                <th style="width: 10%">Выбрать</th>
                <th style="width: 30%">Фамилия</th>
                <th style="width: 30%">Имя</th>
                <th style="width: 15%">Группа</th>
                <th style="width: 15%">Дата поступления</th>
            </tr>
            <c:forEach items="${selectedStudent}"
                       var="selectedStudent">   <%--  allStudents - copypass из StudentsController req.setAttribute("allStudents", students);--%>
                <tr>
                    <td><input type="checkbox" value="${stud.id}"></td>
                    <td>${selectedStudent.lastname}</td>
                    <td>${selectedStudent.name}</td>
                    <td>${selectedStudent.group}</td>
                    <td><fmt:formatDate value="${selectedStudent.date}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="block__right"></div>
</div>
<div class="container">
    <div class="block">
        <table class="table__left">
            <br>
            <tr>
                <th style="width: 90%">Название дисциплины</th>
                <th style="width: 10%">Оценка</th>
            </tr>
            <c:forEach items="${namesOfDisciplines}"
                       var="disc"><%--namesOfDisciplines - copypass из req.setAttribute - DisciplinesController--%>
                <tr>
                    <td>${disc.discipline}</td>
                    <td>${mark}</td>
                        <%-- доработать как привязать оценку--%>
                </tr>
            </c:forEach>
        </table>
        <div class="block__row__column">
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
            </div>
            <br><br>
            <h4 style="float: left; padding-right: 10px">Средняя оценка за семестр: </h4>
            <c:forEach items="${terms}" var="t">
                <c:choose>
                    <c:when test="${t.id == selectedTerm.id}">
                        <div value="${t.id}">${t.mark}</div>
                    </c:when>
                </c:choose>
            </c:forEach>
            <br>
        </div>
    </div>
</div>

</body>
</html>
