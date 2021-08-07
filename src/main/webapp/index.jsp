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
    <title>Home page</title>
<h1>Система управления студентами и их успеваемостью</h1>
<c:choose>
    <c:when test="${role ne null}">
        <a href="/logout">Logout</a>
    </c:when>
    <c:otherwise>
        <a href="/login">Login</a>
    </c:otherwise>
</c:choose>
<a href="/students">Студенты</a>
<a href="/terms">Семестры</a>
<a href="/disciplines">Дисциплины</a>
<a href="/marks">Оценки</a>
</html>