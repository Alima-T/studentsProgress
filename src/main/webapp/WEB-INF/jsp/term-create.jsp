<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Создание семестра</title>
</head>
<body>
<div class="main inline">
    <div class="left-block">
        <a class="nav-link active home" aria-current="page" href="../index.jsp">На главную</a>
        <a class="a-na-glavnuu" href="/terms">Назад</a>
    </div>

    <div class="content">
        <h1>Система управления студентами и их успеваемостью</h1>
        <div class="col-md-4">
            <h3>Для создания семестра заполните следующие данные и нажмите кнопку "Создать"</h3>
            <table class="under_main_table" style="font-family: cursive;">
                <tr>
                    <td width="210px">Длительность (в неделях)</td>
                    <td><input type="text" name="duration" class="text"
                               id="text" placeholder="24"></td>
                </tr>

                <tr>
                    <td style="padding-top: 30px" valign="top">Дисциплины в семестре</td>
                    <td style="padding-top: 30px">
                        <table>
                            <tr>
                                <td style="padding: 0"><select multiple size="8"
                                                               id="multi_list" multiple="multiple">

                                    <option>ЛФЫТВ</option>

                                </select></td>
                            </tr>

                            <tr>
                                <td style="padding-top: 20px">
                                    <form action="/term" method="post">
                                        <input type="submit" value="Создать" id="button">
                                    </form>
                                </td>
                            </tr>
                        </table>
                        <c:if test="${message eq 'error'}">
                            <h5>Поле не должно быть пустым!</h5>
                        </c:if>
                    </td>
                </tr>
            </table>
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
</div>

</body>
</html>
