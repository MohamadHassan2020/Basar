//#region vars
var loadingDiv = $("#loading"),
    txtRoleName = $("#txtRoleName"),
    txtRoleDescAR = $("#txtRoleDescAR"),
    txtRoleDescEN = $("#txtRoleDescEN"),
    tblDataExists = $('#tblDataExists'),
    ddlRoleDivider = $('#ddlRoleDivider'),
    modalTable = $('#modalTable'),
    btnSearch = document.getElementById('btnSearch'),
    btnSave = document.getElementById('btnSave');

//#endregion

//#region page

$(document).ready(function () {


    getRoleDivider(ddlRoleDivider,true);
    getAllRoles();

    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    btnSave.addEventListener('click', function () {
        msgSaveOrCancel(addRoles);
    });
});
//#endregion

//#region function
function getAllRoles() {

    getDataTableByData(tblDataExists,
        getUrl() + '/basar/roles',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { data: 'RoleDividerDescAR' },
            {
                data: 'RoleDescAR',
                className: "text-danger"
            },
            { data: 'RoleDescEN' },
            { data: 'Name' },
            
            { data: 'RoleDateIn' },
            //{
            //    data: "YearStatus",
            //    className: 'text-center',
            //    render: function (data) {
            //        return getStatusTextDataTable(data);
            //    }
            //},
            {
                data: "Delete",
                className: 'text-center',
                render: function () {
                    return '<i class="fa fa-remove fa-2x text-danger delete-record"></i>';
                }
            }
        ],
        { RoleName: null }


    );
}


var addRoleExtend = function (roleId) {

    var obj = {
        RoleId: roleId,
        RoleDescEN: $.trim(txtRoleDescEN.val()),
        RoleDescAR: $.trim(txtRoleDescAR.val())
    };
    $.ajax({
        url: getUrl() + '/basar/roles/RoleExtend/New',
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
            msgSuccess('تم ', 'الحفظ بنجاح', 'success');
        },
        error: function (jqXHR) {
            console.log(jqXHR.responseText);
        }
    });
};
var addRoles = function () {

    var obj = {
        Name: $.trim(txtRoleName.val())
    };
    $.ajax({
        url: getUrl() + '/basar/roles/new',
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
            addRoleExtend(data.Id);
            addClassDivider(data.Id);
            //if (typeof getData == 'function') {
            //    getData();
            //}

            //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
        },
        error: function (jqXHR) {
            console.log(jqXHR.responseText);
            msgSuccess('خطأ', jqXHR.responseText, 'warning');
        }
    });
};
var addClassDivider =function(roleId) {

    var obj = {
        RoleDividerId: $.trim(ddlRoleDivider.val()),
        RoleId: roleId
    };
    $.ajax({
        url: getUrl() + '/basar/RoleDivider/ClassDivider/New',
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
            //if (typeof getData == 'function') {
            //    getData();
            //}

            //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
        },
        error: function (jqXHR) {
            console.log(jqXHR.responseText);
            msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
        }
    });
}

//#endregion