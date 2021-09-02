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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="/JavaScript/function.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
    <title>Student-modify</title>
</head>

<body>
<div class="main inline">
    <div class="left-block">
        <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
    </div>

    <div class="content">
        <h1>Система управления студентами и их успеваемостью</h1>
        <div class="col-md-4">
            <h3>Для внесения изменения в запись студента заполните все поля и нажмите на кнопку "Применить"</h3>
            <label>Название</label>
            <form action="/student-modify" method="post">
                <div CLASS="div-for-student-modifing">
                    <input type="hidden" name="id" value="${id}">
                    <div class="display-flex"><label>Фамилия</label>
                        <input type="text" name="modifiedLastname"value="${selectedStudent.lastname}"></div>
                    <div class="display-flex"><label>Имя</label>
                        <input type="text" name="modifiedName"value="${selectedStudent.name}"></div>
                    <div class="display-flex"><label>Группа</label>
                        <input type="text" name="modifiedGroup"value="${selectedStudent.id_group}"></div>
                    <div class="display-flex"><label>Дата поступления</label>
                        <input name="modifiedDate" type="text" id="datepicker"
                               autocomplete="off"value="${selectedStudent.date}"></div>
                    <div class="display-flex"><input type="submit" value="Применить"></div>
                </div>
            </form>
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



</body>

</html>
