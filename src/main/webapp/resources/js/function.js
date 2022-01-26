$(function () {
    $("#datepicker").datepicker();
});
// для того чтобы чек-бокс и кнопка вошли в один тег <form> используем js, форму в форму не можем, без js невозможно отработать некоторые функции, т.к. js является проводником между front - back
function modifyDiscipline() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');//проверяет выбран ли чек-бокс/ в var может быть любая переменная или массив
    if (checkedBoxes.length == 0) {
        alert("Please choose one discipline")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Please choose only one discipline")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value");
    var hidden = document.getElementById("hiddenModify")
    hidden.setAttribute("value", id);
    var form = document.getElementById("formModify");
    form.submit();
}

function deleteDisciplines() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну дисциплину")
        return;
    }
    var discIds = ""; // 1-3-7-
    for (var i = 0; i < checkedBoxes.length; i++) {
        discIds = discIds + checkedBoxes[i].getAttribute("value") + "-"
    }
    var hidden = document.getElementById("hiddenDeleteDisc")
    hidden.setAttribute("value", discIds);
    var form = document.getElementById("formDelete");
    form.submit();
}
function modifyStudent() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Please choose one student")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Please choose only one student")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value")
    var hidden = document.getElementById("hiddenModify")
    hidden.setAttribute("value", id)
    var form = document.getElementById("formModify")
    form.submit();
}
function modifyTerm() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');//проверяет выбран ли чек-бокс/ в var может быть любая переменная или массив
    if (checkedBoxes.length == 0) {
        alert("Please choose one term")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Please choose only one term")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value");
    var hidden = document.getElementById("hiddenModify")
    hidden.setAttribute("value", id);
    var form = document.getElementById("formModify");
    form.submit();
}
function deleteStudents() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну запись студента для удаления")
        return;
    }
    var studIds = ""; // 1-3-7-
    for (var i = 0; i < checkedBoxes.length; i++) {
        studIds = studIds + checkedBoxes[i].getAttribute("value") + "-"
    }
    var hidden = document.getElementById("hiddenDeleteStud")
    hidden.setAttribute("value", studIds);
    var form = document.getElementById("formDelete");
    form.submit();
}

function studentProgress() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Пожалуйста, выберите хотя бы одного студента")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Пожалуйста, выберите только одного студента ")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value")
    var hidden = document.getElementById("hiddenStudentProgress")
    hidden.setAttribute("value", id)
    var form = document.getElementById("formStudentProgress")
    form.submit();
}

function perfomanceStudent() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Выберите одного студента");
        return;
    }
    if (items.length > 1) {
        alert("Выберите только одого студента");
        return;
    }


    var ids;

    for (var i = 0; i < items.length; i++) {
        if (ids == null) {
            ids = "'" + $(items[i]).attr("value");
        } else {
            ids = ids + "','" + $(items[i]).attr("value");
        }
        if (i == items.length - 1) {
            ids = ids + "'"
        }
    }

    $('#perfomanceStudHidden').val(ids);
    $('#perfomanceStudForm').submit();
}
function createTerm() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Пожалуйста, выберите одну дисциплину")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Пожалуйста, выберите только одну дисциплину")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value");
    var hidden = document.getElementById("hiddenModify")
    hidden.setAttribute("value", id);
    var form = document.getElementById("formModify");
    form.submit();
}

function deleteTerm() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    var ids = ""; // 1-3-7-
    for (var i = 0; i < checkedBoxes.length; i++) {
        ids = ids + checkedBoxes[i].getAttribute("value") + "-"
    }
    var hidden = document.getElementById("hiddenDelete")
    hidden.setAttribute("value", ids);
    var form = document.getElementById("formDelete");
    form.submit();
}

