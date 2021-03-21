//#region vars
var
    txtTourDsecAr = $('#txtTourDsecAr'),
    txtTourDsecEn = $('#txtTourDsecEn'),
    txtTourDescHint = $('#txtTourDescHint'),
    cbTourStatus = $('#cbTourStatus'),
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
                    msgSaveOrCancel(addTour);
                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {
    sessionStorage.removeItem('tourid');

    getTourdblClick();
    getTourForDelete();
    getTouresAll();
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('tourid');
    });

});

//#endregion



//#region Insert



function addTour() {
    var id = sessionStorage.getItem('tourid') === null ? id = 0 : sessionStorage.getItem('tourid');
    let tour = {
        TourId: id,
        TourDsecAr: $.trim(txtTourDsecAr.val()),
        TourDsecEn: $.trim(txtTourDsecEn.val()),
        TourDescHint: $.trim(txtTourDescHint.val()),
        TourStatus: cbTourStatus.is(":checked") == true
            ? true : cbTourStatus.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/tour/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: tour,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('tourid');
            sessionStorage.setItem('tourid', data.TourId);
            msgSuccess('تم ', 'الحفظ بنجاح', 'success');
            //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
        },
        error: function (jqXHR) {
            console.log(jqXHR.responseText);
            msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
        }
    });
}

function delTour(id, refreshFunc) {

    let tour = {
        TourId: id
    };
    $.ajax({
        url: getUrl() + '/basar/tour/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: tour,
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


var getTourForDelete = function (refresh) {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delTour(data.TourId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getTouresAll() {
    getDataTableByData(tblDataExists,
        getUrl() + '/basar/tour/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'TourDsecAr',
                className: "text-danger"
            },
            { data: 'TourDsecEn' },
            { data: 'CreationDate' },
            {
                data: "TourStatus",
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
        ]
        , { TourStatus: null }

    );
}


var getTourdblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('tourid');
        sessionStorage.setItem('tourid', data.TourId);

        txtTourDsecAr.val(data.TourDsecAr);
        txtTourDsecEn.val(data.TourDsecEn);
        txtTourDescHint.val(data.TourDescHint);

        data.TourStatus === true ? cbTourStatus.prop("checked", true) :
            cbTourStatus.prop("checked", false);


        modalTable.modal('hide');
    });
};
//#endregion


