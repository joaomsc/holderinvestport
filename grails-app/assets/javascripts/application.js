// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.3.1.min
//= require bootstrap
//= require popper.min
//= require jquery-3.3.1.min
//= require dataTables.bootstrap4.min
//= require jquery.dataTables.min
//= require_self

$(document).ready(function () {

    $('#loginForm #username').focus();
    $('#registerForm #fullname').focus();

    $('.list-table').DataTable({
        searching: true,
        paging: false,
        lengthChange: false,
        info: false,
        language: {
            search: "",
            searchPlaceholder: "Buscar..."
        }

    });

    $('.portf-company-action').submit(function (event) {
        event.preventDefault();

        var submitBtn = $("input[type=submit]",this);
        console.log(submitBtn);

        $form = $(this);

        var submittedAction = $form.attr('action');

        var isRemoveAction = submittedAction.split("/")[2] === "remove";

        $.ajax({
            url: $form.attr('action'),
            type: $form.attr('method'),
            async: true,
            success: function (response) {
                if(response.id) {
                    if(isRemoveAction){
                        submitBtn.val("Adicionar na carteira");
                        $(submitBtn).removeClass("btn-danger");
                        $(submitBtn).addClass("btn-success");
                        $form.attr("action", submittedAction.replace("remove", "add"));
                    } else {
                        submitBtn.val("Remover da carteira");
                        $(submitBtn).removeClass("btn-success");
                        $(submitBtn).addClass("btn-danger");
                        $form.attr("action", submittedAction.replace("add", "remove"));
                    }
                }
            }
        });
    });

});

function passwordDisplayToggle() {
    var toggleCheckB = document.getElementById("passwordToggler");
    var passElem = document.getElementById("password");
    if (toggleCheckB.checked && passElem.type === "password") {
        passElem.type = "text";
    } else if (!toggleCheckB.checked && passElem.type === "text") {
        passElem.type = "password";
    }
}
