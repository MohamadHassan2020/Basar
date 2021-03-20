//#region vars
var ddlCountry = $('#ddlCountry'),
    txtCampDsecAr = $('#txtCampDsecAr'),
    txtCampDsecEn = $('#txtCampDsecEn'),
    cbCampStatus = $('#cbCampStatus'),
    modalTable = $('#modalTable'),
    tblDataExists = $('#tblDataExists'),
    btnSave = document.getElementById('btnSave'),
    btnSearchModa = document.getElementById('btnSearch'),

    btnReset = document.getElementById('btnReset');

//#endregion

//#region validation 19-4-2020

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
                    msgSaveOrCancel(addCamp);
                }
            }, false);
        });
    }, false);
})();



//#endregion

//#region function
$(function () {

    //select 
    getSelect();

    sessionStorage.removeItem('campid');
    getCountries(ddlCountry);

    getCampdblClick();
    getCampForDelete();
     
    modalTable.on('show.bs.modal', function () {

        var tbl = tblDataExists.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    /*
    btnSave.addEventListener('click', function () {
        addCamp();
    });*/

    btnReset.addEventListener('click', function () {
        sessionStorage.removeItem('campid');
    });


    btnSearch.addEventListener('click', function () {
        //get data table
        getCampsAll();
        modalTable.modal('show');
    });

});

//#endregion

//#region Insert



function addCamp() {
    var id = sessionStorage.getItem('campid') === null ? id = 0 : sessionStorage.getItem('campid');
    let camp = {
        CampId: id,
        CountryId: $.trim(ddlCountry.val()),
        CampDsecAr: $.trim(txtCampDsecAr.val()),
        CampDsecEn: $.trim(txtCampDsecEn.val()),
        CampStatus: cbCampStatus.is(":checked") == true
            ? true : cbCampStatus.is(":not(:checked)") == false ? false : false,//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/camps/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: camp,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            sessionStorage.removeItem('campid');
            sessionStorage.setItem('campid', data.CampId);
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

function delCamp(id, refreshFunc) {

    let camp = {
        CampId: id
    };
    $.ajax({
        url: getUrl() + '/basar/camps/del',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: camp,
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

function testOut() {
    $("table").DataTable({
        "processing": true,
        "serverSide": true,
        "retrieve": true,
        "ajax": {
            'url': getUrl() + '/basar/camps/all',
            'dataSrc': "",
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            "data": function (outData) {
                // what is being sent to the server
                console.log(outData);
                return outData;
            },
            dataFilter: function (inData) {
                // what is being sent back from the server (if no error)
                console.log(inData);
                return inData;
            },
            error: function (err, status) {
                // what error is seen(it could be either server side or client side.
                console.log(err);
            }
        },
        "columns": [{
            "data": "CountryDsecAr"

        }, {
            "data": "CampDsecEn"

        },
        {
            "data": "CampDsecAr"

        }, {
            "data": "CreationDate"

        }]

    });
}

var getCampForDelete = function (refresh) {
    tblDataExists.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblDataExists.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delCamp(data.CampId, function () {
                var tbl = tblDataExists.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });



    });
};



function getCampsAll() {
    var campSearch = {
        CountryId: $.trim(ddlCountry.val()) != '' ? $.trim(ddlCountry.val()) : null
    };
    getDataTableByData(tblDataExists,
        getUrl() + '/basar/camps/all',
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
            { data: 'CampDsecAr' },
            { data: 'CampDsecEn' },
            { data: 'CreationDate' },
            {
                data: "CampStatus",
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
        campSearch
    );
}


var getCampdblClick = function () {
    
    $(document).on('dblclick', '#tblDataExists tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
        sessionStorage.removeItem('campid');
        sessionStorage.setItem('campid', data.CampId);

        txtCampDsecAr.val(data.CampDsecAr);
        txtCampDsecEn.val(data.CampDsecEn);
        //ddlCountry.val(data.CountryId);
        ddlCountry.select2().val(data.CountryId).trigger('change');
        
        data.CampStatus === true ? cbCampStatus.prop("checked", true) :
            cbCampStatus.prop("checked", false);


        modalTable.modal('hide');
        getSelect();
    });
};
//#endregion
