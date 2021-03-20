//#region vars
var
    txtCampStatusDescAR = $('#txtCampStatusDescAR'),
    txtCampStatusDescEN = $('#txtCampStatusDescEN'),
    cbCampStatusEnabled = $('#cbCampStatusEnabled'),
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
                    msgSaveOrCancel(addCampStatus);
                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {
    sessionStorage.removeItem('campstatusid');

    getCampStatusdblClick();
    getCampStatusForDelete();
    getCampStatusAll();
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('campstatusid');
    });

});

//#endregion



//#region Insert



function addCampStatus() {
    var id = sessionStorage.getItem('campstatusid') === null ? id = 0 : sessionStorage.getItem('campstatusid');
    let campStatus = {
        CampStatusId: id,
        CampStatusDescAR: $.trim(txtCampStatusDescAR.val()),
        CampStatusDescEN: $.trim(txtCampStatusDescEN.val()),
        CampStatusEnabled: cbCampStatusEnabled.is(":checked") == true
            ? true : cbCampStatusEnabled.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/campstatus/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: campStatus,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('campstatusid');
            sessionStorage.setItem('campstatusid', data.CampStatusId);
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

function delCampStatus(id, refreshFunc) {

    let campStatus = {
        CampStatusId: id
    };
    $.ajax({
        url: getUrl() + '/basar/campstatus/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: campStatus,
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


var getCampStatusForDelete = function () {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delCampStatus(data.CampStatusId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getCampStatusAll() {
   
    getDataTableByData(tblDataExists,
        getUrl() + '/basar/campstatus/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'CampStatusDescAR',
                className: "text-danger"
            },
            { data: 'CampStatusDescEN' },
            { data: 'CreationDate' },
            {
                data: "CampStatusEnabled",
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
        { CampStatusEnabled: null }


    );
}


var getCampStatusdblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('campstatusid');
        sessionStorage.setItem('campstatusid', data.CampStatusId);

        txtCampStatusDescAR.val(data.CampStatusDescAR);
        txtCampStatusDescEN.val(data.CampStatusDescEN);

        data.CampStatusEnabled === true ? cbCampStatusEnabled.prop("checked", true) :
            cbCampStatusEnabled.prop("checked", false);


        modalTable.modal('hide');
    });
};
//#endregion


