<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>

<html>
<head>
    <title>term-modify</title>
</head>
<body>
<h1>Система управления студентами и их успеваемостью</h1>
<h3>Для модификации семестра отредактируйте данные и нажмите на кнопку "Применить" </h3>

<label>Длительность: </label>
<input type="text" value="${term.duration}">

<label>Дисциплины в семестре</label>
<select multiple class="multiple">
    <c:forEach items="${allDisciplines}" var = "disc">
          <c:if test="${disc.selected}">
              <option selected>${disc.discipline}</option>
          </c:if>
        <c:if test="${not disc.selected}">
            <option>${disc.discipline}</option>
        </c:if>
    </c:forEach>

</select>

</body>
</html>
