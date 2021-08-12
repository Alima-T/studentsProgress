function modifyDiscipline() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if(checkedBoxes.length == 0){
        alert("Пожалуйста, выберите одну дисциплину")
        return;
    }
    if(checkedBoxes.length > 1){
        alert("Пожалуйста, выберите только одну дисциплину")
        return;
    }
var id =checkedBoxes[0].getAttribute("value");
    var hidden = document.getElementById("hiddenModify")
    hidden.setAttribute("value", id);
    var form = document.getElementById("formModify");
    form.submit();
}

function deleteDisciplines() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if(checkedBoxes.length == 0){
        alert("Пожалуйста, выберите хотя бы одну дисциплину")
        return;
    }
    var ids=""; // 1-3-7-
    for(var i=0;i<checkedBoxes.length; i++){
        ids = ids+checkedBoxes[i].getAttribute("value")+"-"
    }
    var hidden = document.getElementById("hiddenDelete")
    hidden.setAttribute("value", ids);
    var form = document.getElementById("formDelete");
    form.submit();
}

function modifyStudent() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Пожалуйста выберите хотя бы одного студента")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Пожалуйста выберите только одного студента ")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value")
    var hidden = document.getElementById("hiddenStudModify")
    hidden.setAttribute("value", id)
    var form = document.getElementById("formStudModify")
    form.submit();
}

function deleteStudents() {
    var cekedVBoxes = document.querySelectorAll('input[type=checkbox]:checked')
    if (cekedVBoxes.length == 0) {
        alert("Пожалуйста выберите хотя бы однго студента")
        return;
    }
    var ids = "";
    for (var i = 0; i < cekedVBoxes.length; i++) {
        ids = ids + cekedVBoxes[i].getAttribute("value") + "-";
    }
    var hidden = document.getElementById("hiddenStudDelete")
    hidden.setAttribute("value", ids)
    var form = document.getElementById("formStudDelete");
    form.submit();
}
function studentProgress() {
    var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
    if (checkedBoxes.length == 0) {
        alert("Пожалуйста выберите хотябы одного студента")
        return;
    }
    if (checkedBoxes.length > 1) {
        alert("Пожалуйста выберите только одного студента ")
        return;
    }
    var id = checkedBoxes[0].getAttribute("value")
    var hidden = document.getElementById("hiddenStudentProgress")
    hidden.setAttribute("value", id)
    var form = document.getElementById("formStudentProgress")
    form.submit();
}