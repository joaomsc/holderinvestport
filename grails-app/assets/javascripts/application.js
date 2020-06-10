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
