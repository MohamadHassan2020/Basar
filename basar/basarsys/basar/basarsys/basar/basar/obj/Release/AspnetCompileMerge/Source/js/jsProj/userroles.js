
//#region start scope

{
    //#region vars
    const ddlUsers = $('#ddlUsers'),
        btnSave = document.getElementById('btnSave'),
        ddlRoleGroup = $('#ddlRoleGroup');
    //#endregion
    //#region page

    $(document).ready(function () {

        $('[data-toggle="tooltip"]').tooltip();

        getUsers(ddlUsers, true);
        getRoleGroup(ddlRoleGroup, true);

        ddlRoleGroup.on('change', function () {
            getRoleByRoleGroup($(this).val());
        });

        btnSave.addEventListener('click', function () {
            if ($.trim(ddlRoleGroup.val()) == '') {
                msgSuccess('مجموعة الصلاحيات', 'Missing Data', 'warning');
            }
            else if ($.trim(ddlUsers.val()) == '') {
                msgSuccess('إسم المستخدم', 'Missing Data', 'warning');
            }
            else {
                msgSaveOrCancel(addUserGroups);
            }
        });
    });

    //#endregion
    //#region function

    function addUserRoles(rolId) {
        var obj = {
            RoleId: rolId,
            UserId: $.trim(ddlUsers.val())
        };
        $.ajax({
            url: getUrl() + '/Basar/UserHelper/UserRole/New',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: obj,
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
            },
            error: function (jqXHR) {
            }
        });
    }
    function addUserGroups() {
        var obj = {
            RoleGroupId: $.trim(ddlRoleGroup.val()),
            UserId: $.trim(ddlUsers.val())
        };
        $.ajax({
            url: getUrl() + '/Basar/UserHelper/New',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: obj,
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
                const chkRoleOfDivider = $('#chkRolesContainer div.custom-checkbox input[type="checkbox"].custom-control-input');
                // Loop and push the checked CheckBox value in Array.
                for (var i = 0; i < chkRoleOfDivider.length; i++) {
                    if (chkRoleOfDivider[i].checked) {

                        addUserRoles($.trim(chkRoleOfDivider[i].value));
                    }
                }
            },
            success: function (data) {
               
                msgSuccess('تم ', 'الحفظ بنجاح', 'success');
                //if (typeof getData == 'function') {
                //    getData();
                //}

                //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
            },
            error: function (jqXHR) {
                
                msgSuccess('من فضلك', jqXHR.responseText, 'warning');
            }
        });
    }


    //#endregion
}

//#endregion end scope
