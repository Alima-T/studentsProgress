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
        $( function() {
            $( "#datepicker" ).datepicker();
            $( "#format" ).on( "change", function() {
                $( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );
            });
        } );
    </script>
    <title>Student-modify</title>
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

<h3>Для внесения изменения в запись студента заполните все поля и нажмите на кнопку "Применить"</h3>
<label>Название</label>
<form action="/student-modify" method="post">
    <div CLASS="div-for-student-modifing">
        <input type="hidden" name="id" value="${id}">
        <div class="display-flex"><label>Фамилия</label><input type="text" name="modifiedLastname" value="${selectedStudent.lastname}"></div>
        <div class="display-flex"><label>Имя</label><input type="text" name="modifiedName" value="${selectedStudent.name}"></div>
        <div class="display-flex"><label>Группа</label><input type="text" name="modifiedGroup" value="${selectedStudent.id_group}"></div>
        <div CLASS="display-flex"><label>Дата поступления</label><input name="modifiedDate" type="text" id="datepicker" autocomplete="off" value="${selectedStudent.date}"></div>
        <div class="display-flex"><input type="submit" value="Применить"></div>
    </div>
</form>

<c:if test="${message eq 'error'}">
    <h5>Поле не должно быть пустым!</h5>
</c:if>
</body>

</html>
