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
<c:import url="common/header.jsp" />
<div class="main inline">
    <div class="content">
        <c:if test="${role == 1}">
            <form action="/discipline-create" method="get">
                <input type="submit" value="Создать дисциплину">
            </form>
            <br>
            <br>
            <input type="submit" onclick="modifyDiscipline()" value="Изменить выбранную дисциплину">
            <br>
            <br>
            <input type="submit" onclick="deleteDisciplines()" value="Удалить выбранные дисциплины">
        <form id="formModify" action="/discipline-modify" method="get">
            <input type="hidden" id="hiddenModify" name="hiddenModify">
        </form>
        <form id="formDelete" action="/disciplines-delete" method="post">
            <input type="hidden" id="hiddenDelete" name="hiddenDelete">
        </form>
        </c:if>
      <div>
        <h4>Список дисциплин</h4>
            <table>
                <tr>
                    <th></th>
                    <th>Название дисциплины</th>
                </tr>
                <c:forEach items="${namesOfDisciplines}"
                           var="disc"><%--namesOfDisciplines - copypass из req.setAttribute - DisciplinesController--%>
                    <tr>
                        <td><input type="checkbox" value="${disc.id}"></td>
                        <td>${disc.discipline}</td>
                    </tr>
                </c:forEach>
            </table
        </div>
    </div>
</div>

</body>
</html>