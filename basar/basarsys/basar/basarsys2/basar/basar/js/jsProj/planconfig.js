{
    //#region vars
    let ddlPlanConfigYear = $('#ddlPlanConfigYear'),
        ddlTour = $('#ddlTour'),
        ddlCountry = $('#ddlCountry'),
        loadingDiv = $("#loading"),
        ddlCamp = $('#ddlCamp'),
        ddlTeam = $('#ddlTeam'),
        ddlSponsor = $('#ddlSponsor'),
        ddlSponsorShip = $('#ddlSponsorShip'),
        ddlCampStatus = $('#ddlCampStatus'),
        txtPlanConfigStartDate = $('#txtPlanConfigStartDate'),
        txtPlanConfigEndDate = $('#txtPlanConfigEndDate'),
        txtPlanConfigRemark = $('#txtPlanConfigRemark'),
        cbPreliminaryStatus = $('#cbPreliminaryStatus'),
        cbPlanConfigStatus = $('#cbPlanConfigStatus'),
        cbPlanConfigIsClosed = $('#cbPlanConfigIsClosed'),
        cbClearCache = $('#cbClearCache'),
        modalTable = $('#modalTable'),
        tblDataExists = $('#tblDataExists'),
        btnSave = document.getElementById('btnSave'),
        btnSearch = document.getElementById('btnSearch'),
        btnReset = document.getElementById('btnReset');
    //#endregion

    //#region validation 4-42020

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
                        msgSaveOrCancel(addPlanConfig);

                    }
                }, false);
            });
        }, false);
    })();

    //#endregion



    //#region page function
    //#endregion
    $(function () {

        ddlSponsor.on('change', function () {
            getSponsorShip(ddlSponsorShip, $(this).val());
        });
        //select 
        getSelect();


        sessionStorage.removeItem('planconfigid');
        getYears(ddlPlanConfigYear);
        getTours(ddlTour);
        getCountries(ddlCountry);
        getTeams(ddlTeam);
        getSponsors(ddlSponsor);
        getCampStatus(ddlCampStatus);

        ddlCountry.on('change', function () {
            getCamps(ddlCamp, $(this).val());
        });

        getPlanForDelete();
        getPlanConfigdblClick();



        modalTable.on('show.bs.modal', function () {
            loadingDiv.show();


            let tbl = tblDataExists.DataTable();
            //table.ajax.reload(null, false); // user paging is not reset on reload
            tbl.ajax.reload(null, false);
        });



        //#region datetime picker
        getCalenderPicker(txtPlanConfigStartDate, txtPlanConfigEndDate);

        //#endregion

        //#region event

        btnReset.addEventListener('click', function () {
            loadingDiv.show();

            sessionStorage.removeItem('planconfigid');
            setTimeout(function () {
                var statusCache = cbClearCache.prop("checked");
                location.reload(statusCache);
            }, 200);
        });

        btnSearch.addEventListener('click', function () {
            //get data table
            getPlansAll();
            modalTable.modal('show');
        });


        //#endregion

    });

    //#region datatable



    let getPlansAll = function () {
        let planSearch = {
            PlanConfigYear: $.trim(ddlPlanConfigYear.val()) != '' ? $.trim(ddlPlanConfigYear.val()) : null,
            CountryId: $.trim(ddlCountry.val()) != '' ? $.trim(ddlCountry.val()) : null,
            TourId: $.trim(ddlTour.val()) != '' ? $.trim(ddlTour.val()) : null,
            TeamId: $.trim(ddlTeam.val()) != '' ? $.trim(ddlTeam.val()) : null,
            CampId: $.trim(ddlCamp.val()) != '' ? $.trim(ddlCamp.val()) : null,
            SponsorId: $.trim(ddlSponsor.val()) != '' ? $.trim(ddlSponsor.val()) : null,
            CampStatusId: $.trim(ddlCampStatus.val()) != '' ? $.trim(ddlCampStatus.val()) : null,
            PlanConfigStartDate: $.trim(txtPlanConfigStartDate.val()) != '' ? $.trim(txtPlanConfigStartDate.val()) : null,
            PlanConfigEndDate: $.trim(txtPlanConfigEndDate.val()) != '' ? $.trim(txtPlanConfigEndDate.val()) : null
        };
        getDataTableByData(tblDataExists,
            getUrl() + '/plan/config/AllPlan',
            [
                {
                    data: "SN",
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                {
                    data: 'PlanConfigYear',
                    className: "hidden-xs hidden-sm"
                },
                {
                    data: 'TourDsecAr',
                    visible: false
                },
                { data: 'CountryDsecAr' },
                { data: 'CampDsecAr' },
                {
                    data: 'TeamDsecAr',
                    visible: false
                },
                {
                    data: 'SponsorDsecAr',
                    render: function (data, type, row, meta) {
                        return data + '</br >' + row["SponsorShipName"];
                    }
                },
                {
                    data: 'PlanConfigStartDate',
                    'render': function (data) {

                        return '<i class="fa fa-calendar text-info fa-border"></i> '
                            + getDateFromJson(data);
                    }

                },
                {
                    data: 'PlanConfigEndDate',
                    'render': function (data) {
                        return '<i class="fa fa-calendar text-info fa-border"></i> '
                            + getDateFromJson(data);
                    }
                },
                {
                    data: 'OPDCount',
                    'render': function (data) {
                        if (data > 0) {
                            return '<i class="fa  fa-group text-info"></i> '
                                + data;

                        }
                        else
                            return '';
                    }
                },
                {
                    data: 'ORCount',
                    'render': function (data) {
                        if (data > 0) {
                            return '<i class="fa fa-bed  text-info"></i> '
                                + data;

                        }
                        else
                            return '';
                    }
                },
                {
                    data: 'GlassesCount',
                    'render': function (data) {
                        if (data > 0) {
                            return '<i class="fa fa-eye text-info fa-border"></i> '
                                + data;

                        }
                        else
                            return '';
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
            planSearch
        );

    };

    let getDataButtonClick = function () {
        tblrequisitionDraft.on("click", ".print-requisition", function () {
            let row = $(this).closest("tr"),
                data = tblrequisitionDraft.dataTable().fnGetData(row);

        });
    };

    let getPlanConfigdblClick = function () {
        $(document).on('dblclick', '#tblDataExists tbody tr', function () {
            let row = $(this).closest("tr"),
                data = tblDataExists.dataTable().fnGetData(row);
            getPlanConfigById(data.PlanConfigId, data.SponsorShipId);
            modalTable.modal('hide');

        });
    };
    //#endregion datatable


    //#region Insert
    let updateCampStatsSummary = function () {
        let id = sessionStorage.getItem('planconfigid') === null ? id = 0 : sessionStorage.getItem('planconfigid'),
            plan = {
                PlanConfigId: id,
                PlanConfigYear: $.trim(ddlPlanConfigYear.val()),
                TourId: $.trim(ddlTour.val()),
                TeamId: $.trim(ddlTeam.val()),
                CountryId: $.trim(ddlCountry.val()),
                CampId: $.trim(ddlCamp.val()),
                SponsorId: $.trim(ddlSponsor.val()),
                CampStatusId: $.trim(ddlCampStatus.val())


            };
        $.ajax({
            url: getUrl() + '/basar/CampStatsSummary/update',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: plan,
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                console.log(data);
                //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
            },
            error: function (jqXHR) {
                //console.log(jqXHR.responseText);
                //msgSuccess('خطا', 'تأكد من الاتصال', 'error');
            }
        });
    };
    let addPlanConfigSponsorship = function (planConfigId, sponsorId) {
        if ($.trim(ddlSponsorShip.val()) != '') {

            let obj = {
                PlanConfigId: planConfigId,
                SponsorShipId: $.trim(ddlSponsorShip.val()),
                SponsorId: sponsorId
            };
            $.ajax({
                url: getUrl() + '/plan/config/SponsorShip/Add',
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
                success: function () {
                },
                error: function (jqXHR) {
                    //console.log(jqXHR.responseText);
                    //msgSuccess('خطا', 'تأكد من الاتصال', 'error');
                }
            });
        }
    };
    let addPlanConfig = function () {
        var id = sessionStorage.getItem('planconfigid') === null ? id = 0 : sessionStorage.getItem('planconfigid');
        let plan = {

            PlanConfigId: id,
            PlanConfigYear: $.trim(ddlPlanConfigYear.val()),
            TourId: $.trim(ddlTour.val()),
            TeamId: $.trim(ddlTeam.val()),
            CountryId: $.trim(ddlCountry.val()),
            CampId: $.trim(ddlCamp.val()),
            SponsorId: $.trim(ddlSponsor.val()),
            CampStatusId: $.trim(ddlCampStatus.val()),
            PlanConfigStartDate: $.trim(txtPlanConfigStartDate.val()),
            PlanConfigEndDate: $.trim(txtPlanConfigEndDate.val()),
            PlanConfigRemark: $.trim(txtPlanConfigRemark.val()),

            PlanConfigIsClosed: cbPlanConfigIsClosed.is(":checked") == true
                ? true : cbPlanConfigIsClosed.is(":not(:checked)") == false ? false : false,//approach 1

            PreliminaryStatus: cbPreliminaryStatus.prop("checked") == true ? true :
                cbPreliminaryStatus.prop("checked") == false ? false : false, //approach 2

            PlanConfigStatus: cbPlanConfigStatus.is(":checked") == true
                ? true : cbPlanConfigStatus.is(":not(:checked)") == false ? false : false,//approach 1
        };
        $.ajax({
            url: getUrl() + '/plan/config',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: plan,
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                addPlanConfigSponsorship(plan.PlanConfigId, plan.SponsorId);
                loadingDiv.hide();
            },
            success: function (data) {
                sessionStorage.removeItem('planconfigid');
                sessionStorage.setItem('planconfigid', data.PlanConfigId);
                setTimeout(function () {
                    //updateCampStatsSummary();
                }, 200);
                msgSuccess('تم ', 'حفظ المخيم بالخطة', 'success');
                //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
            },
            error: function (jqXHR) {
                //console.log(jqXHR.responseText);
                msgSuccess('خطا', 'تأكد من الاتصال', 'error');
            }
        });
    };

    let delPlanConfig = function (id, refreshFunc) {

        let plan = {
            PlanConfigId: id
        };
        $.ajax({
            url: getUrl() + '/plan/config/del',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: plan,
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
                msgSuccess('خطأ', jqXHR.responseText, 'error');
            }
        });
    }


    let getPlanForDelete = function () {
        tblDataExists.on("click", ".delete-record", function () {
            let row = $(this).closest("tr"),
                data = tblDataExists.dataTable().fnGetData(row);
            msgSaveOrCancel(function () {
                delPlanConfig(data.PlanConfigId, function () {
                    let tbl = tblDataExists.DataTable();
                    //table.ajax.reload(null, false); // user paging is not reset on reload
                    tbl.ajax.reload(null, false);
                });
            });
        });
    };

    //#endregion

    let getPlanConfigById = function (planConfigId, sponsorShipId) {
        $.ajax({
            url: getUrl() + '/plan/config/ById',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'PlanConfigId': planConfigId }
            ),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();

            },
            complete: function () {
                getSelect();
                //select 
                 if (sponsorShipId != null && sponsorShipId > 0) {
                    setTimeout(function () {
                        ddlSponsorShip.select2().val(sponsorShipId).trigger('change');
                    }, 500);
                }
                
                loadingDiv.hide();

            },
            success: function (data) {
                sessionStorage.removeItem('planconfigid');
                sessionStorage.setItem('planconfigid', data.PlanConfigId);
                ddlPlanConfigYear.val(data.PlanConfigYear);


                ddlTour.select2().val(data.TourId).trigger('change');
                ddlCountry.select2().val(data.CountryId).trigger('change');


                getCamps(ddlCamp, data.CountryId);
                setTimeout(function () {

                    ddlCamp.select2().val(data.CampId).trigger('change');
                    getSelect();
                }, 1000);

                ddlTeam.select2().val(data.TeamId).trigger('change');
                ddlSponsor.select2().val(data.SponsorId).trigger('change');
                getSponsorShip(ddlSponsorShip, data.SponsorId);
               
               
                ddlCampStatus.select2().val(data.CampStatusId).trigger('change');

                txtPlanConfigStartDate.val(getDateFromJson(data.PlanConfigStartDate));
                txtPlanConfigEndDate.val(getDateFromJson(data.PlanConfigEndDate));
                txtPlanConfigRemark.val(data.PlanConfigRemark);

                data.PlanConfigStatus === true ? cbPlanConfigStatus.prop("checked", true) :
                    cbPlanConfigStatus.prop("checked", false);

                data.PreliminaryStatus === true ? cbPreliminaryStatus.prop("checked", true) :
                    cbPreliminaryStatus.prop("checked", false);

                data.PlanConfigIsClosed === true ? cbPlanConfigIsClosed.prop("checked", true) :
                    cbPlanConfigIsClosed.prop("checked", false);

            },
            error: function (jqXHR) {
                if (jqXHR.status == '401') {
                    sessionStorage.removeItem('loginInfo');
                    window.location.href = "../Home/SignIn";
                }


            }
        });
    };


}