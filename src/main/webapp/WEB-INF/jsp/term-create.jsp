<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%--декларация о том, что это код java--%>
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
            <div class="block__element_hidden"><a href="../index.jsp">На главную</a></div>
            <div class="block__element_hidden"><a href="/terms">Назад</a></div>
        </div>
    </div>
    <div class="block__center">
        <h3>Для создания семестра заполните следующие данные и нажмите кнопку "Создать"</h3>
        <table>
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
</div>

</body>
</html>
