<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css?v=12">
    <link rel="stylesheet" href="../../resources/css/font.css?v=12">
    <title>Students</title>
</head>

<body>
<c:import url="common/header.jsp"/>
<div class="main inline">
    <div class="block__left">
        <div class="block__row">
            <div class="block__element_hidden"><a href="/home">На главную</a></div>
            <div class="block__element_hidden"><a href="/terms">Назад</a></div>
        </div>
    </div>
<%--    <div class="block__center">--%>
<%--        <h3>Для создания новой записи студента введите данные и нажмите на кнопку "Создать"</h3>--%>
<%--        &lt;%&ndash; оборачиваем в form, иначе не работают кнопки / action передает данные на контроллер по urlPatterns = "/student-create"&ndash;%&gt;--%>
<%--        <form action="/student-create" method="post"><br><br>--%>
<%--            <input type="text" placeholder="Фамилия" maxlength="50" size="35" class="text" name="lastname"><br><br>--%>
<%--            <input type="text" placeholder="Имя" maxlength="50" size="35" class="text" name="name"><br><br>--%>
<%--            <input type="text" placeholder="Группа" maxlength="5" size="5" class="text" name="group"><br><br>--%>
<%--            <input type="text" placeholder="Дата поступления" id="datepicker" maxlength="10" size="10" class="text"--%>
<%--                   name="date"><br><br>--%>
<%--            <input type="submit" value="Создать"><br><br>--%>
<%--        </form>--%>
<%--        <c:if test="${message eq 'error'}">--%>
<%--            <div style="width: 600px; padding-left: 100px"><h5 style="color: red">Поля не должны быть пустыми!</h5>--%>
<%--            </div>--%>
<%--        </c:if>--%>
<%--    </div>--%>

        <div class="block__center">
            <h3>Для создания семестра заполните следующие данные и нажмите кнопку "Создать" </h3>
            <section>
                <br>
                <label style="vertical-align: top">Длительность в неделях: </label>
                <input style="width: 300px" type="text" value="${term.duration}">
            </section>
            <br>
            <section>
                <label style="vertical-align: top">Дисциплины в семестре: </label>
                <select multiple class="multiple">
                    <c:forEach items="${allDisciplines}" var="disc">
                        <c:if test="${disc.selected}">
                            <option selected>${disc.discipline}</option>
                        </c:if>
                        <c:if test="${not disc.selected}">
                            <option>${disc.discipline}</option>
                        </c:if>
                    </c:forEach>
                    <input style="margin-left: 10px" type="submit" value="Создать">
                </select>
            </section>
        </div>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td style="padding: 0"><select multiple size="8"--%>
<%--                                               id="multi_list" multiple="multiple">--%>
<%--                </select></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td style="padding-top: 20px">--%>
<%--                    <form action="/term" method="post">--%>
<%--                        <input type="submit" value="Создать" id="button">--%>
<%--                    </form>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--        <c:if test="${message eq 'error'}">--%>
<%--            <h5>Поле не должно быть пустым!</h5>--%>
<%--        </c:if>--%>
<%--        </td>--%>
<%--        </tr>--%>
<%--        </table>--%>
    </div>
</div>

</body>
</html>
