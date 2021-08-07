<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %> <%--После развертывания проекта JSF страница не может проанализировать выражения--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css?v=12">
    <script type="text/javascript" src="../../resources/js/function.js?v=12"charset="UTF-8"> </script>
    <title>Disciplines</title>
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
<table>
    <tr>
        <td></td>
        <td>Название дисциплины</td>
    </tr>
    <c:forEach items="${namesOfDisciplines}" var="disc"><%--namesOfDisciplines - copypass из req.setAttribute - DisciplinesController--%>
    <tr>
        <td><input type="checkbox" value ="${disc.id}"></td>
        <td>${disc.discipline}</td>
    </tr>
    </c:forEach>
</table>
<c:if test="${role == 1}">
<form action="/discipline-create"method="get">
    <input type="submit" value="Создать дисциплину">
</form>
    <input type="submit" onclick="modifyDiscipline()" value="Изменить выбранную дисциплину">
    <input type="submit" onclick="deleteDisciplines()" value="Удалить выбранные дисциплины">
</c:if>
<form id="formModify" action="/discipline-modify" method = "get">
    <input type ="hidden" id="hiddenModify" name= "hiddenModify">
</form>
<form id="formDelete" action="/disciplines-delete" method = "post">
    <input type ="hidden" id="hiddenDelete" name= "hiddenDelete">
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>

</html>