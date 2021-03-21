//#region vars
var
    txtYearNameAr = $('#txtYearNameAr'),
    txtYearNameEn = $('#txtYearNameEn'),
    txtYearDesc = $('#txtYearDesc'),
    cbYearStatus = $('#cbYearStatus'),
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
                    msgSaveOrCancel(addYear);
                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {
    sessionStorage.removeItem('yearid');

    getYeardblClick();
    getYearForDelete();
    getYearsAll();
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('yearid');
    });

});

//#endregion



//#region Insert



function addYear() {
    var id = sessionStorage.getItem('yearid') === null ? id = 0 : sessionStorage.getItem('yearid');
    let year = {
        YearId: id,
        YearNameAr: $.trim(txtYearNameAr.val()),
        YearNameEn: $.trim(txtYearNameEn.val()),
        YearDesc: $.trim(txtYearDesc.val()),
        YearStatus: cbYearStatus.is(":checked") == true
            ? true : cbYearStatus.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/year/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: year,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('yearid');
            sessionStorage.setItem('yearid', data.YearId);
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

function delYear(id, refreshFunc) {

    let year = {
        YearId: id
    };
    $.ajax({
        url: getUrl() + '/basar/year/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: year,
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


var getYearForDelete = function () {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delYear(data.YearId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getYearsAll() {

    getDataTableByData(tblDataExists,
        getUrl() + '/basar/year/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'YearNameAr',
                className: "text-danger"
            },
            { data: 'YearNameEn' },
            { data: 'CreationDate' },
            {
                data: "YearStatus",
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
        { YearStatus: null }


    );
}


var getYeardblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('yearid');
        sessionStorage.setItem('yearid', data.YearId);

        txtYearNameAr.val(data.YearNameAr);
        txtYearNameEn.val(data.YearNameEn);
        txtYearDesc.val(data.YearDesc);

        data.YearStatus === true ? cbYearStatus.prop("checked", true) :
            cbYearStatus.prop("checked", false);


        modalTable.modal('hide');
    });
};
//#endregion


