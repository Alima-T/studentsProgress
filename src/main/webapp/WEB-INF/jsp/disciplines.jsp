<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Disciplines</title>
    <link rel="stylesheet" href="../../resources/css/style.css?v=12"> <%--?v=12 - добавлено для обновления страницы--%>
    <script type="text/javascript" src="../../resources/js/function.js?v=12"charset="UTF-8"> </script>
</head>
<body>
<h1>Страницы с дисциплинами</h1>
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
<form action="/discipline-create"method="get">
    <input type="submit" value="Создать дисциплину">
</form>
<form>
    <input type="submit" onclick="modifyDiscipline()" value="Модифицировать выбранную дисциплину">
</form>
<form>
    <input type="submit" onclick="deleteDisciplines()" value="Удалить выбранные дисциплины">
</form>

<form id="formModify" action="/discipline-modify" method = "get">
    <input type ="hidden" id="hiddenModify" name= "hiddenModify">
</form>
<form id="formDelete" action="/disciplines-delete" method = "post">
    <input type ="hidden" id="hiddenDelete" name= "hiddenDelete">
</form>


</body>
</html>
