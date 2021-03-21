//#region vars
var
    txtSponsorDsecAr = $('#txtSponsorDsecAr'),
    txtSponsorDsecEn = $('#txtSponsorDsecEn'),
    cbSponsorStatus = $('#cbSponsorStatus'),
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
                    msgSaveOrCancel(addSponsor);
                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {
    sessionStorage.removeItem('sponsorid');

    getSponsordblClick();
    getSponsorForDelete();
    getSponsoresAll();
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('sponsorid');
    });

});

//#endregion



//#region Insert



function addSponsor() {
    var id = sessionStorage.getItem('sponsorid') === null ? id = 0 : sessionStorage.getItem('sponsorid');
    let sponsor = {
        SponsorId: id,
        SponsorDsecAr: $.trim(txtSponsorDsecAr.val()),
        SponsorDsecEn: $.trim(txtSponsorDsecEn.val()),
        SponsorStatus: cbSponsorStatus.is(":checked") == true
            ? true : cbSponsorStatus.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/sponsors/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: sponsor,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('sponsorid');
            sessionStorage.setItem('sponsorid', data.SponsorId);
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

function delSponsor(id, refreshFunc) {

    let sponsor = {
        SponsorId: id
    };
    $.ajax({
        url: getUrl() + '/basar/sponsors/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: sponsor,
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


var getSponsorForDelete = function (refresh) {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delSponsor(data.SponsorId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getSponsoresAll() {
    var myData = { SponsorStatus: null };
    getDataTableByData(tblDataExists,
        getUrl() + '/basar/sponsors/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'SponsorDsecAr',
                className: "text-danger"
            },
            { data: 'SponsorDsecEn' },
            { data: 'CreationDate' },
            {
                data: "SponsorStatus",
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
        ], myData

    );
}


var getSponsordblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('sponsorid');
        sessionStorage.setItem('sponsorid', data.SponsorId);

        txtSponsorDsecAr.val(data.SponsorDsecAr);
        txtSponsorDsecEn.val(data.SponsorDsecEn);

        data.SponsorStatus === true ? cbSponsorStatus.prop("checked", true) :
            cbSponsorStatus.prop("checked", false);


        modalTable.modal('hide');
    });
};
//#endregion


