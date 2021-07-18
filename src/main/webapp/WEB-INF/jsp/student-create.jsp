<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <title>Students list</title>
</head>

<body>
<div class="container">
    <input type="button" onclick="history.back();" value="Главная" />
    <input type="button" onclick="history.back();" value="Назад" />
    <input type="button" onclick="history.back();" value="Выход" />

</div>
<div class="container">
    <h3>Система управления студентами и их успеваемостью</h3>
    <br>
    <h5>Для создания новой записи студента введите данные и нажмите на кнопку "Создать"</h5>
</div>


<div class="container">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Фамилия</span>
        <input type="text" class="form-control" placeholder="Lastname" aria-label="Lastname" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Имя</span>
        <input type="text" class="form-control" placeholder="Name" aria-label="Name" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon3">Group</span>
        <input type="text" class="form-control" placeholder="Group" aria-label="Group" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon4">Date</span>
        <input type="text" class="form-control" placeholder="Date" aria-label="Date" aria-describedby="basic-addon1">
    </div>

    <div class="d-grid gap-2 col-6 mx-auto">
        <button class="btn btn-primary1" type="button">Создать</button>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>

</html>
