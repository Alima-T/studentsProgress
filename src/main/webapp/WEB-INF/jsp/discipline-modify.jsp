<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Чтобы изменить новую дисциплину, заполните все поля и нажмите кнопку "Изменить"</h1>
<label>Название</label>
<form action="/discipline-modify" method="post">
    <input name="id" type="hidden" value="${disc.id}">
    <input name="disc" type="text" value="${disc.discipline}">
    <input type = "submit" value = "изменить">
</form>
<c:if test="${message eq 'error'}">
    <h5>Поле не должно быть пустым!</h5>
</c:if>


</body>
</html>

