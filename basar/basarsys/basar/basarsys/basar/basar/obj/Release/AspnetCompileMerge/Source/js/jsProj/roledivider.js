//#region vars
var
    txtRoleDividerDescAR = $('#txtRoleDividerDescAR'),
    txtRoleDividerDescEN = $('#txtRoleDividerDescEN'),
    txtRoleDividerOrder = $('#txtRoleDividerOrder'),
    cbRoleDividerStatus = $('#cbRoleDividerStatus'),
    loadingDiv = $("#loading"),
    btnSearch = $('#btnSearch'),
    modalTable = $('#modalTable'),
    tblDataExists = $('#tblDataExists'),
    btnReset = document.getElementById('btnReset'),
    btnSave = document.getElementById('btnSave');

//#endregion 




//#region page function
$(function () {
    sessionStorage.removeItem('RoleDividerId');

    getRolesDividerDblClick();
    getRolesDividerForDelete();
    getRoleDividerAll();
    modalTable.on('show.bs.modal', function () {
        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });


    btnSave.addEventListener('click', function () {
        if ($.trim(txtRoleDividerDescEN.val()) == '') {
            msgSuccess('Role Divider Description EN', 'Missing Data', 'warning');
        }
        else if ($.trim(txtRoleDividerDescAR.val()) == '') {
            msgSuccess('فئة الصلاحية بالعربي', 'Missing Data', 'warning');
        }
        else if ($.trim(txtRoleDividerOrder.val()) == '') {
            msgSuccess('ترتيب الصلاحية', 'Missing Data', 'warning');
        }
        else {
            msgSaveOrCancel(addRolesDivider);
        }
    });

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('RoleDividerId');
    });

});

//#endregion



//#region Insert



function addRolesDivider() {

    var id = sessionStorage.getItem('RoleDividerId') === null ? id = 0 : sessionStorage.getItem('RoleDividerId');
    var obj = {
        RoleDividerId: id,
        RoleDividerDescAR: $.trim(txtRoleDividerDescAR.val()),
        RoleDividerDescEN: $.trim(txtRoleDividerDescEN.val()),
        RoleDividerOrder: $.trim(txtRoleDividerOrder.val()),
        RoleDividerStatus: cbRoleDividerStatus.is(":checked") == true
            ? true : cbRoleDividerStatus.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/RoleDivider/New',
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
            sessionStorage.removeItem('RoleDividerId');
            sessionStorage.setItem('RoleDividerId', data.RoleDividerId);
            msgSuccess('تم ', 'الحفظ بنجاح', 'success');
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

function delRolesDivider(id, refreshFunc) {

    var obj = {
        RoleDividerId: id
    };
    $.ajax({
        url: getUrl() + '/basar/RoleDivider/del',
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
            msgSuccess('تم ', 'تم الحذف بنجاح', 'success');
            if (typeof refreshFunc == 'function') {
                refreshFunc();
            }

            //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
        },
        error: function (jqXHR) {
            console.log(jqXHR.responseText);
            msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
        }
    });
}
//#endregion

//#region datatable


var getRolesDividerForDelete = function () {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delRolesDivider(data.RoleDividerId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getRoleDividerAll() {

    getDataTableByData(tblDataExists,
        getUrl() + '/basar/RoleDivider/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'RoleDividerDescAR',
                className: "text-danger"
            },
            { data: 'RoleDividerDescEN' },
            { data: 'RoleDividerDateIn' },
            {
                data: "RoleDividerStatus",
                className: 'text-center',
                render: function (data) {
                    return getStatusTextDataTable(data);
                }
            },
            {
                data: "Delete",
                className: 'text-center',
                render: function () {
                    return '<i class="fa fa-remove fa-2x text-danger delete-record"></i>';
                }
            }
        ],
        { RoleDividerStatus: null }

    );
}


var getRolesDividerDblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('RoleDividerId');
        sessionStorage.setItem('RoleDividerId', data.RoleDividerId);
        txtRoleDividerDescAR.val(data.RoleDividerDescAR);
        txtRoleDividerDescEN.val(data.RoleDividerDescEN);
        txtRoleDividerOrder.val(data.RoleDividerOrder);
        data.RoleDividerStatus === true ? cbRoleDividerStatus.prop("checked", true) :
            cbRoleDividerStatus.prop("checked", false);
        modalTable.modal('hide');
    });
};

//#endregion


