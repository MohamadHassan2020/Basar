let btnLogin = $('#btnLogin'),
    txtUserName = $('#txtUserName'),
    txtPassword = $('#txtPassword'),
    errorModalMsg = $('#errorModalMsg'),
    errorModalMsg2 = $('#errorModalMsg2'),
    partialView = $("#partialView"),
    successModalMsg = $('#successModalMsg');


$(function () {
    btnLogin.on("click", function () {
        sigIn();
    });

});

function sigIn() {

    $.ajax({
        url: getUrl() + '/token',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        type: 'POST', //if use jquery after 1.9  use alias method
        contentType: 'application/json; charset=utf-8',
        data: {
            UserName: txtUserName.val(),
            Password: txtPassword.val(),
            grant_type: 'password'
        },
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (response) {
            sessionStorage.setItem("loginInfo", JSON.stringify(response));
            msgSuccessProgressBar();
            window.location.href = "../Home/Index";
        },
        error: function (jqXHR) {
            //getMsg("#partialView", '../Home/ErrorMsg', '#errorModalMsg2', false);
            Swal.fire(
                'البصر العالمية؟',
                'تأكد من إسم المستخدم وكلمة المرور',
                'error'
            );
        }

    });
}





