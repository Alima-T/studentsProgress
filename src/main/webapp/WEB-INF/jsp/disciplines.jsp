<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %> <%--После развертывания проекта JSF страница не может проанализировать выражения--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css?v=12">
    <link rel="stylesheet" href="../../resources/css/font.css?v=12">
    <script type="text/javascript" src="../../resources/js/function.js?v=12" charset="UTF-8"></script>
    <title>Disciplines</title>
</head>
<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <a href="../index.jsp">На главную</a>
    </div>
    <div class="block__center">
        <h4>Список дисциплин</h4>
    </div>
    <div class="block__right"></div>
</div>
<div class="container">
    <div class="block">
        <table class="table__left">
            <br>
            <tr>
                <th style="width: 10%"></th>
                <th style="width: 90%">Название дисциплины</th>
            </tr>
            <c:forEach items="${namesOfDisciplines}"
                       var="disc"><%--namesOfDisciplines - copypass из req.setAttribute - DisciplinesController--%>
                <tr>
                    <td><input type="checkbox" value="${disc.id}"></td>
                    <td>${disc.discipline}</td>
                </tr>
            </c:forEach>
        </table>
<%--        <c:if test="${role == 1}">--%>
        <div class="block__row__column">
            <div class="block__form3 block__element_2">
                <form action="/discipline-create" method="get">
                    <input class="inblock" type="submit" value="Создать дисциплину">
                </form>
            </div>
            <div class="block__form3 block__element_2">
                <form action="/discipline-modify" method="get">
                    <input class="inblock" type="submit" onclick="modifyDiscipline()" value="Изменить выбранную дисциплину">
                </form>
                <form id="formModify" action="/discipline-modify" method="get">
                    <input type="hidden" id="hiddenModify" name="hiddenModify">
                </form>
            </div>
            <div class="block__form3 block__element_2">
                <input class="inblock" type="submit" onclick="deleteDisciplines()" value="Удалить выбранные дисциплины">
                <form id="formDelete" action="/disciplines-delete" method="post">
                    <input type="hidden" id="hiddenDelete" name="hiddenDelete">
                </form>
            </div>
<%--            </c:if>--%>
        </div>
    </div>
</div>
</div>


<%--<div class="container">--%>
<%--    <div class="block__center left">--%>
<%--        <h4>Список дисциплин</h4>--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <th></th>--%>
<%--                <th>Название дисциплины</th>--%>
<%--            </tr>--%>
<%--            <c:forEach items="${namesOfDisciplines}"--%>
<%--                       var="disc">&lt;%&ndash;namesOfDisciplines - copypass из req.setAttribute - DisciplinesController&ndash;%&gt;--%>
<%--                <tr>--%>
<%--                    <td><input type="checkbox" value="${disc.id}"></td>--%>
<%--                    <td>${disc.discipline}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </table--%>
<%--    </div>--%>
<%--    <div class="block__center right">--%>
<%--        <div class="container">--%>
<%--        <div class="block__row__column">--%>
<%--            <div class="block__form3 block__element_2">--%>
<%--                <form action="/discipline-create" method="get">--%>
<%--                    <input type="submit" value="Создать дисциплину">--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <c:if test="${role == 1}">--%>
<%--                <div class="block__form3 block__element_2">--%>
<%--                    <form action="/discipline-modify" method="get">--%>
<%--                        <input type="submit" onclick="modifyDiscipline()" value="Изменить выбранную дисциплину">--%>
<%--                    </form>--%>
<%--                    <form id="formModify" action="/discipline-modify" method="get">--%>
<%--                        <input type="hidden" id="hiddenModify" name="hiddenModify">--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--                <div class="block__form3 block__element_2">--%>
<%--                    <input type="submit" onclick="deleteDisciplines()" value="Удалить выбранные дисциплины">--%>
<%--                    <form id="formDelete" action="/disciplines-delete" method="post">--%>
<%--                        <input type="hidden" id="hiddenDelete" name="hiddenDelete">--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </c:if>--%>
<%--        </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--        <div class="content">--%>

<%--            <h4>Список дисциплин</h4>--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <th></th>--%>
<%--                    <th>Название дисциплины</th>--%>
<%--                </tr>--%>
<%--                <c:forEach items="${namesOfDisciplines}"--%>
<%--                           var="disc">&lt;%&ndash;namesOfDisciplines - copypass из req.setAttribute - DisciplinesController&ndash;%&gt;--%>
<%--                    <tr>--%>
<%--                        <td><input type="checkbox" value="${disc.id}"></td>--%>
<%--                        <td>${disc.discipline}</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </table--%>

</body>
</html>