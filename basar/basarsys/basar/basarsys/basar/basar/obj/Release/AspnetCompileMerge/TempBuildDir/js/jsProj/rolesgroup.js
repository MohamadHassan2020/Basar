//start scope
{
    //#region vars
    const
        txtRoleGroupDescAR = $('#txtRoleGroupDescAR'),
        txtRoleGroupDescEN = $('#txtRoleGroupDescEN'),
        txtRoleGroupOrder = $('#txtRoleGroupOrder'),
        cbRoleGroupStatus = $('#cbRoleGroupStatus'),
        loadingDiv = $("#loading"),
        btnSearch = $('#btnSearch'),
        modalTable = $('#modalTable'),
        tblDataExists = $('#tblDataExists'),
        ddlRoleDivider = $('#ddlRoleDivider'),
        btnReset = document.getElementById('btnReset'),
        btnSave = document.getElementById('btnSave');

    //#endregion 




    //#region page function
    $(function () {

        $('[data-toggle="tooltip"]').tooltip();

        getRoleByRoleDividerId(null);
        getRoleDivider(ddlRoleDivider, true);

        ddlRoleDivider.on('change', function () {
            var roleDividerId = $.trim($(this).val()) == '' ? null : $.trim($(this).val());
            getRoleByRoleDividerId(roleDividerId);
        });
        sessionStorage.removeItem('RoleGroupId');

        getRolesGroupDblClick();
        getRolesGroupForDelete();
        getRoleGroupAll();
        modalTable.on('show.bs.modal', function () {
            var tbl = tblDataExists.DataTable();
            tbl.ajax.reload(null, false);// user paging is not reset on reload
        });


        btnSave.addEventListener('click', function () {
            if ($.trim(txtRoleGroupDescEN.val()) == '') {
                msgSuccess('Role Group Description EN', 'Missing Data', 'warning');
            }
            else if ($.trim(txtRoleGroupDescAR.val()) == '') {
                msgSuccess('مجموعة الصلاحية بالعربي', 'Missing Data', 'warning');
            }
            else if ($.trim(txtRoleGroupOrder.val()) == '') {
                msgSuccess('ترتيب الصلاحية', 'Missing Data', 'warning');
            }
            else {
                msgSaveOrCancel(addRolesGroup);
            }
        });

        btnReset.addEventListener('click', function () {
            sessionStorage.removeItem('RoleGroupId');
        });

    });

    //#endregion



    //#region Insert



    function addRoleGroupDivider(roleId, roleGroupId) {

        var obj = {
            RoleId: roleId,
            RoleGroupId: roleGroupId,
            RoleDividerId: $.trim(ddlRoleDivider.val())
        };
        $.ajax({
            url: getUrl() + '/basar/RoleGroup/RoleGroupDivider/New',
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
                console.log(jqXHR.responseText);
            }
        });
    }
    function addRolesGroup() {

        var id = sessionStorage.getItem('RoleGroupId') === null ? id = 0 : sessionStorage.getItem('RoleGroupId');
        var obj = {
            RoleGroupId: id,
            RoleGroupDescAR: $.trim(txtRoleGroupDescAR.val()),
            RoleGroupDescEN: $.trim(txtRoleGroupDescEN.val()),
            RoleGroupOrder: $.trim(txtRoleGroupOrder.val()),
            RoleGroupStatus: cbRoleGroupStatus.is(":checked") == true
                ? true : cbRoleGroupStatus.is(":not(:checked)") == false ? false : false//approach 1

        };
        $.ajax({
            url: getUrl() + '/basar/RoleGroup/New',
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
                sessionStorage.removeItem('RoleGroupId');
                sessionStorage.setItem('RoleGroupId', data.RoleGroupId);

                chkRoleOfDivider = $('#chkRolesContainer div.custom-checkbox input[type="checkbox"].custom-control-input');
                // Loop and push the checked CheckBox value in Array.
                for (var i = 0; i < chkRoleOfDivider.length; i++) {
                    if (chkRoleOfDivider[i].checked) {

                        addRoleGroupDivider($.trim(chkRoleOfDivider[i].value), data.RoleGroupId);
                    }
                }

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

    function delRolesGroup(id, refreshFunc) {

        var obj = {
            RoleGroupId: id
        };
        $.ajax({
            url: getUrl() + '/basar/RoleGroup/del',
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


    var getRolesGroupForDelete = function () {
        tblDataExists.on("click", ".delete-record", function () {
            var row = $(this).closest("tr");
            var data = tblDataExists.dataTable().fnGetData(row);
            msgSaveOrCancel(function () {
                delRolesGroup(data.RoleGroupId, function () {
                    var tbl = tblDataExists.DataTable();
                    //table.ajax.reload(null, false); // user paging is not reset on reload
                    tbl.ajax.reload(null, false);
                });


            });
        });
    };



    function getRoleGroupAll() {

        getDataTableByData(tblDataExists,
            getUrl() + '/basar/RoleGroup/Get',
            [
                {
                    data: "SN",
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    data: 'RoleGroupDescAR',
                    className: "text-danger"
                },
                { data: 'RoleGroupDescEN' },
                { data: 'RoleGroupDateIn' },
                {
                    data: "RoleGroupStatus",
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
            { RoleGroupStatus: null }


        );
    }


    var getRolesGroupDblClick = function () {
        $(document).on('dblclick', '#tblDataExists tbody tr', function () {
            var row = $(this).closest("tr"),
                data = tblDataExists.dataTable().fnGetData(row);
            sessionStorage.removeItem('RoleGroupId');
            sessionStorage.setItem('RoleGroupId', data.RoleGroupId);

            txtRoleGroupDescAR.val(data.RoleGroupDescAR);
            txtRoleGroupDescEN.val(data.RoleGroupDescEN);
            txtRoleGroupOrder.val(data.RoleGroupOrder);

            data.RoleGroupStatus === true ? cbRoleGroupStatus.prop("checked", true) :
                cbRoleGroupStatus.prop("checked", false);


            modalTable.modal('hide');
        });
    };
    //#endregion

}

// end scope

