<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>

<html>
<head>
    <title>Students</title>
    <link rel="stylesheet" href="../../resources/css/style.css">
</head>
<body>
<h1>Страница со студентами</h1>
</table>
<form action="/students-progress" method="get">
    <input type="submit" value="Просмотр успеваемости выбранного студента">
</form>
<form action = "/student-create" method="get">
    <input type="submit" value="Создать запись студента">
</form>
<form action="/student-modify" method="get">
    <input type="submit" value="Модернизировать запись студента">
</form>
<form action="/students-delete" method="get">
    <input type="submit" value="Удалить запись студента">
</form>
<table>
    <tr>
        <td></td>
        <td>Список студентов</td>
    </tr>
    <c:forEach items="${allStudents}" var="stud">  <%--ctrl+shift+/ comment Lesson 4 - 46 min / чтобы отобразить java-code в jsp требуется библиотека jstl java,
    необходимо задекларировать набор тегов Core Tags в шапку файла <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> (ссылка https://betacode.net/10429/java-jsp-standard-tag-library)
    + обязательно декларируем в dependencies в pom.xml зависимость из Maven
    префикс с: - указывает на библиотеку тегов Core Tags, c:forEach enter, далее нужно добавить обязательный атрибут items= и вставляем в скобки "все элементы по которым мы проходимся"
    "${javaVariable}" - значок ${body} - указывает на java "${nameOfDisciplines}"- название берем из DisciplinesController из посылки req.setAttribute("nameOfDisciplines", disciplines),
    где "nameOfDisciplines" - это название атрибута, а disciplines - это сам объект (переменная в DisciplinesController)
    var "stud" - название текущей дисциплины, которую мы взяли из всех дисциплин, название сами придумываем stud - далее рассматривается как объект java--%>
    <tr>
        <td><input type="checkbox"></td> <%--создает ячейки для выбора--%>
        <td>${stud.student}</td><%--disc.discipline - disc это объект java, если оставить просто disc, то отработает метод toString  и выведется полностью все поля класса,
        т.к. в классе несколько полей,то мы добавляем нужное нам поле после точки .discipline.--%>
    </tr>
    </c:forEach>
</body>
</html>
