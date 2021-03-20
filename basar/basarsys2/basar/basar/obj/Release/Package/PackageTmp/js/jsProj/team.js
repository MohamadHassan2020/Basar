//#region vars
var
    txtTeamDsecAr = $('#txtTeamDsecAr'),
    txtTeamDsecEn = $('#txtTeamDsecEn'),
    cbTeamStatus = $('#cbTeamStatus'),
    btnSearch = $('#btnSearch'),
    modalTable = $('#modalTable'),
    tblDataExists = $('#tblDataExists'),
    btnReset = document.getElementById('btnReset');

//#endregion 

//#region validation 21-4-2020

// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {

    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                    form.classList.add('was-validated');
                }
                else {
                    form.classList.add('was-validated');
                    event.preventDefault();
                    msgSaveOrCancel(addTeam);
                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {
    sessionStorage.removeItem('teamid');

    getTeamdblClick();
    getTeamForDelete();
    getTeamsAll();
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('teamid');
    });

});

//#endregion



//#region Insert



function addTeam() {
    var id = sessionStorage.getItem('teamid') === null ? id = 0 : sessionStorage.getItem('teamid');
    let team = {
        TeamId: id,
        TeamDsecAr: $.trim(txtTeamDsecAr.val()),
        TeamDsecEn: $.trim(txtTeamDsecEn.val()),
        TeamStatus: cbTeamStatus.is(":checked") == true
            ? true : cbTeamStatus.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/teams/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: team,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('teamid');
            sessionStorage.setItem('teamid', data.TeamId);
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

function delTeam(id, refreshFunc) {

    let team = {
        TeamId: id
    };
    $.ajax({
        url: getUrl() + '/basar/teams/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: team,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
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


var getTeamForDelete = function () {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delTeam(data.TeamId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getTeamsAll() {

    getDataTableByData(tblDataExists,
        getUrl() + '/basar/teams/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'TeamDsecAr',
                className: "text-danger"
            },
            { data: 'TeamDsecEn' },
            { data: 'CreationDate' },
            {
                data: "TeamStatus",
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
        { TeamStatus: null }


    );
}


var getTeamdblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('teamid');
        sessionStorage.setItem('teamid', data.TeamId);

        txtTeamDsecAr.val(data.TeamDsecAr);
        txtTeamDsecEn.val(data.TeamDsecEn);

        data.TeamStatus === true ? cbTeamStatus.prop("checked", true) :
            cbTeamStatus.prop("checked", false);


        modalTable.modal('hide');
    });
};
//#endregion


