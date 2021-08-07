<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="../../resources/js/function.js?v=13"charset="UTF-8"> </script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();
        } );
    </script>
    <title>Student-create</title>
</head>
<body>
<h1>Система управления студентами и их успеваемостью</h1>
<c:choose>
    <c:when test="${role ne null}">
        <a href="/logout">Logout</a>
    </c:when>
    <c:otherwise>
        <a href="/login">Login</a>
    </c:otherwise>
</c:choose>

<form method="post" action="student-create">
    <input type="text" id = "datepicker" name="date">
    <input type="submit" value="Создать">
    <
</form>


    <h3>Для создания новой записи студента введите данные и нажмите на кнопку "Создать"</h3>
</body>
</html>
