//#region vars
var  
    txtCountryDsecAr = $('#txtCountryDsecAr'),
    txtCountryDsecEn = $('#txtCountryDsecEn'),
    cbCountryStatus = $('#cbCountryStatus'),
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
                    msgSaveOrCancel(addCountry);
                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {
    sessionStorage.removeItem('countryid');

    getCountrydblClick();
    getCountryForDelete();
    getCountriesAll();
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('countryid');
    });

});

//#endregion



//#region Insert



function addCountry() {
    var id = sessionStorage.getItem('countryid') === null ? id = 0 : sessionStorage.getItem('countryid');
    let country = {
        CountryId: id,
        CountryDsecAr: $.trim(txtCountryDsecAr.val()),
        CountryDsecEn: $.trim(txtCountryDsecEn.val()),
        CountryStatus: cbCountryStatus.is(":checked") == true
            ? true : cbCountryStatus.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/country/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: country,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('countryid');
            sessionStorage.setItem('countryid', data.CountryId);
            msgSuccess('تم ', 'تم حفظ المدينة', 'success');
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

function delCountry(id, refreshFunc) {

    let country = {
        CountryId: id
    };
    $.ajax({
        url: getUrl() + '/basar/country/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: country,
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

 
var getCountryForDelete = function (refresh) {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delCountry(data.CountryId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getCountriesAll() {
    var myData = { CountryStatus: null };
    getDataTableByData(tblDataExists,
        getUrl() + '/basar/country/Get',
        [
            {
                data: "SN",
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                data: 'CountryDsecAr',
                className: "text-danger"
            },
            { data: 'CountryDsecEn' },
            { data: 'CreationDate' },
            {
                data: "CountryStatus",
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


var getCountrydblClick = function () {
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('countryid');
        sessionStorage.setItem('countryid', data.CountryId);

        txtCountryDsecAr.val(data.CountryDsecAr);
        txtCountryDsecEn.val(data.CountryDsecEn);

        data.CountryStatus === true ? cbCountryStatus.prop("checked", true) :
            cbCountryStatus.prop("checked", false);


        modalTable.modal('hide');
    });
};
//#endregion


