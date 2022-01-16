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
    <title>Home page</title>
</head>
<body>
<br>
<div class="main inline">
    <div class="block__left">
        <p></p>
    </div>
    <div class="block__center">
        <p class="title_all_pages">Система управления студентами и их успеваемостью</p>
    </div>
    <div class="block__right">
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
<br>
<div class="container">
    <div class="block">
        <div class="block__row"><!--  flex-container  -->
            <div class="block__element block__element_1"> <!--  flex-element  -->
                <div class="block__content"><a href="/students">Студенты</a></div><!--  content  -->
            </div>
            <div class="block__element block__element_2">
                <div class="block__content"><a href="/disciplines">Дисциплины</a></div>
            </div>
            <div class="block__element block__element_3">
                <div class="block__content"><a href="/terms">Семестры</a></div>
            </div>
        </div>
    </div>
</div>

<%--<div class="main inline">--%>
<%--    <div class="left-block"></div>--%>
<%--    <div class="center-block">--%>
<%--        <center>--%>
<%--            <p class="title_all_pages">Система управления студентами и их успеваемостью</p>--%>
<%--        </center>--%>

<%--    <h3>--%>
<%--        <a href="/students">Студенты</a>--%>
<%--        <a href="/disciplines">Дисциплины</a>--%>
<%--        <a href="/terms">Семестры</a>--%>
<%--    </h3>--%>
<%--</div>--%>
<%--<div class="right-block">--%>
<%--    <c:choose>--%>
<%--        <c:when test="${role ne null}">--%>
<%--            <a href="/logout">Logout</a>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <a href="/login">Login</a>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
<%--</div>--%>

</body>
</html>