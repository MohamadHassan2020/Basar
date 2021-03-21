let btnNewUser = $('#btnNewUser'),
    txtUserName = $('#txtUserName'),
    txtEmail = $('#txtEmail'),
    txtPassword = $('#txtPassword'),
    txtConfirmPassword = $('#txtConfirmPassword');

$(function () {
    btnNewUser.on('click', function () {
        let user = {
            UserName: txtUserName.val(),
            Email: txtEmail.val(),
            Password: txtPassword.val(),
            ConfirmPassword: txtConfirmPassword.val()
        };
        newUser(user);
    });
});



function newUser(user) {

    $.ajax({
        url: getUrl() + '/api/account/register',
        type: 'POST',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        //dataType: "json",         
        'Content-Type': 'application/json; charset=utf-8',
        data: user,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function () {

            console.log(user.UserName);//IdentityResult
        },
        error: function (jqXHR) {
            console.log(jqXHR.responseText);//IdentityResult
        }
    });
}
