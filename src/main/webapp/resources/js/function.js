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