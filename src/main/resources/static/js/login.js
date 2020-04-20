$(".toggle-password").click(function () {

    $(this).toggleClass("fa-eye fa-eye-slash");
    var input = $($(this).attr("toggle"));
    if (input.attr("type") === "password") {
        input.attr("type", "text");
    } else {
        input.attr("type", "password");
    }
});


const rmCheck = document.getElementById("rememberMe"),
        username = document.getElementById("username");



if (localStorage.checkbox && localStorage.checkbox !== "") {
    rmCheck.setAttribute("checked", "checked");
    username.value = localStorage.username;
} else {
    rmCheck.removeAttribute("checked");
    username.value = "";
}

function lsRememberMe() {
    if (rmCheck.checked && username.value !== "") {
        localStorage.username = username.value;
        localStorage.checkbox = rmCheck.value;
    } else {
        localStorage.username = "";
        localStorage.checkbox = "";
    }
}

