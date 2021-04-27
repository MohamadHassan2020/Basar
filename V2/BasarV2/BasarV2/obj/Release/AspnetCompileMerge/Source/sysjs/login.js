{
    const app = {
        frmLogin: document.getElementById('frmLogin'),
        txtUserName: document.getElementById('txtUserName'),
        txtPassword: document.getElementById('txtPassword'),
        btnLogin: document.getElementById('btnLogin'),
        shared: new Shared('description', 'app.keywords', 'app.title'),
        init: () => document.addEventListener('DOMContentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {
            if (app.btnLogin) {
                app.btnLogin.addEventListener('click', app.login);
            }
        },
        login: () => {
            app.shared.login(app.txtUserName.value.trim(),
                app.txtPassword.value,
                succ => {
                    sessionStorage.setItem("loginInfo", JSON.stringify(succ));
                    window.location.href = "../Home/Index";
                },
                err => err
            );
        }
    };
    app.init();
}
