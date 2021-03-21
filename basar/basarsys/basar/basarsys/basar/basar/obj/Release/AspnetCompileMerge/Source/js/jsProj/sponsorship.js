//#region vars
{
    let ddlSponsor = $('#ddlSponsor'),
        txtSponsorShipName = $('#txtSponsorShipName'),
        txtSponsorShipNameEN = $('#txtSponsorShipNameEN'),
        txtSponsorShipOrder = $('#txtSponsorShipOrder'),
        cbSponsorShipStatus = $('#cbSponsorShipStatus'),
        loadingDiv = $('#loading'),
        modalTable = $('#modalTable'),
        tblDataExists = $('#tblDataExists'),
        btnSave = document.getElementById('btnSave');


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
                        msgSaveOrCancel(addSponsorShip);
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

        sessionStorage.removeItem('SponsorShipId');
        getSponsors(ddlSponsor);

        getSponsorShipdblClick();
        getSponsorShipForDelete();

        modalTable.on('show.bs.modal', function () {

            let tbl = tblDataExists.DataTable();
            tbl.ajax.reload(null, false);// user paging is not reset on reload
        });

        /*
        btnSave.addEventListener('click', function () {
            addCamp();
        });*/

        document.getElementById('btnReset').addEventListener('click', function () {
            sessionStorage.removeItem('SponsorShipId');
        });


        document.getElementById('btnSearch').addEventListener('click', function () {
            //get data table
            getSponsorShipAll();
            modalTable.modal('show');
        });

    });

    //#endregion

    //#region Insert



    function addSponsorShip() {
        var id = sessionStorage.getItem('SponsorShipId') === null ? id = 0 : sessionStorage.getItem('SponsorShipId');
        let obj = {
            SponsorShipId: id,
            SponsorId: $.trim(ddlSponsor.val()),
            SponsorShipName: $.trim(txtSponsorShipName.val()),
            SponsorShipNameEN: $.trim(txtSponsorShipNameEN.val()),
            SponsorShipOrder: $.trim(txtSponsorShipOrder.val()),
            SponsorShipStatus: cbSponsorShipStatus.is(":checked") == true
                ? true : cbSponsorShipStatus.is(":not(:checked)") == false ? false : false //approach 1

        };
        $.ajax({
            url: getUrl() + '/basar/SponsorShip/new',
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
            success: function (data) {
                sessionStorage.removeItem('SponsorShipId');
                sessionStorage.setItem('SponsorShipId', data.SponsorShipId);
                msgSuccess('تم ', 'تم حفظ المدينة', 'success');
            },
            complete: function () {
                loadingDiv.hide();
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
                msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
            }
        });
    }

    function delSponsorShip(id, refreshFunc) {

        let obj = {
            SponsorShipId: id
        };
        $.ajax({
            url: getUrl() + '/basar/SponsorShip/del',
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


    var getSponsorShipForDelete = function () {
        tblDataExists.on("click", ".delete-record", function () {
            let row = $(this).closest("tr"),
            data = tblDataExists.dataTable().fnGetData(row);
            msgSaveOrCancel(function () {
                delSponsorShip(data.SponsorShipId, function () {
                    let tbl = tblDataExists.DataTable();
                    //table.ajax.reload(null, false); // user paging is not reset on reload
                    tbl.ajax.reload(null, false);
                });


            });
        });
    };



    function getSponsorShipAll() {
        var obj = {
            SponsorId: $.trim(ddlSponsor.val()) != '' ? $.trim(ddlSponsor.val()) : null
        };
        getDataTableByData(tblDataExists,
            getUrl() + '/basar/SponsorShip/all',
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
                { data: 'SponsorShipName' },
                { data: 'SponsorShipNameEN' },
                { data: 'SponsorShipDateIn' },
                {
                    data: "SponsorShipStatus",
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
            obj
        );
    }


    let getSponsorShipdblClick = function () {

        $(document).on('dblclick', '#tblDataExists tbody tr', function () {
            let row = $(this).closest("tr"),
                data = tblDataExists.dataTable().fnGetData(row);
            sessionStorage.removeItem('SponsorShipId');
            sessionStorage.setItem('SponsorShipId', data.SponsorShipId);

            txtSponsorShipName.val(data.SponsorShipName);
            txtSponsorShipNameEN.val(data.SponsorShipNameEN);
            txtSponsorShipOrder.val(data.SponsorShipOrder);
            //ddlCountry.val(data.CountryId);
            ddlSponsor.select2().val(data.SponsorId).trigger('change');

            data.SponsorShipStatus === true ? cbSponsorShipStatus.prop("checked", true) :
                cbSponsorShipStatus.prop("checked", false);


            modalTable.modal('hide');
            getSelect();
        });
    };
    //#endregion

}