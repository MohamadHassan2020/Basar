//#region vars
var
    txtOPDCount = $('#txtOPDCount'),
    txtORCount = $('#txtORCount'),
    txtGlassesCount = $('#txtGlassesCount'),
    txtCampStatsSummaryNote = $('#txtCampStatsSummaryNote'),
    cbCampStatsSummaryIsClosed = $('#cbCampStatsSummaryIsClosed'),
    cbCampStatsSummaryStatus = $('#cbCampStatsSummaryStatus'),
    ddlStatsSummaryCamps = $('#ddlStatsSummaryCamps'),
    //btnSearch = $('#btnSearch'),
    campStatSummaryTable = $('#campStatSummaryTable'),
    tblCampStatsSummary = $('#tblCampStatsSummary'),
    btnCampStatsSummarySearch = document.getElementById('btnCampStatsSummarySearch');

//#endregion 

//#region validation 21-4-2020

// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {

    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('campstatssummary');
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
                    msgSaveOrCancel(addCampStatsSummary);

                }
            }, false);
        });
    }, false);
})();



//#endregion


//#region page function
$(function () {

    getSelect();
    ddlStatsSummaryCamps.on('change', function () {
        getCampStatSummaryById($(this).val());
    });
    getPlansFollowUp(ddlStatsSummaryCamps, 2);

    getStatsSummaryCampblClick();
    //getTeamForDelete();
    getCampStatsSummaryAll();
    campStatSummaryTable.on('show.bs.modal', function () {

        var tbl = tblCampStatsSummary.DataTable();
        tbl.ajax.reload(null, false);// user paging is not reset on reload
    });

    btnCampStatsSummarySearch.addEventListener('click', function () {
        campStatSummaryTable.modal('show');
    });

    //btnReset.addEventListener('click', function () {
    //    sessionStorage.removeItem('teamid');
    //});

});

//#endregion



//#region Insert



function addCampStatsSummary() {
    let obj = {
        PlanConfigId: $.trim(ddlStatsSummaryCamps.val()),
        OPDCount: $.trim(txtOPDCount.val()),
        ORCount: $.trim(txtORCount.val()),
        GlassesCount: $.trim(txtGlassesCount.val()),
        CampStatsSummaryNote: $.trim(txtCampStatsSummaryNote.val()),
        CampStatsSummaryStatus: true,
        CampStatsSummaryIsClosed: cbCampStatsSummaryIsClosed.is(":checked") == true
            ? true : cbCampStatsSummaryIsClosed.is(":not(:checked)") == false ? false : false//approach 1

    };
    $.ajax({
        url: getUrl() + '/basar/CampStatsSummary/new',
        type: 'POST',
        'Content-Type': 'application/json; charset=utf-8',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },
        data: obj,
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
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
    tblCampStatsSummary.on("click", ".delete-record", function () {
        var row = $(this).closest("tr");
        var data = tblCampStatsSummary.dataTable().fnGetData(row);
        msgSaveOrCancel(function () {
            delTeam(data.TeamId, function () {
                var tbl = tblCampStatsSummary.DataTable();
                //table.ajax.reload(null, false); // user paging is not reset on reload
                tbl.ajax.reload(null, false);
            });


        });
    });
};



function getCampStatsSummaryAll() {

    var campStatsSummarySearch = {
        //CampId: campId != '-1' ? campId : null
        CampId: null
    };
    getDataTableByData(tblCampStatsSummary,
        getUrl() + '/basar/CampStatsSummary/Getdt',
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
            { data: 'TourDsecAr' },
            { data: 'CountryDsecAr' },
            { data: 'CampDsecAr' },
            {
                data: 'TeamDsecAr',
                visible: false
            },
            { data: 'SponsorDsecAr' },
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
                data: 'GlassesCount',
                'render': function (data) {
                    if (data > 0) {
                        return '<i class="fa fa-eye text-info fa-border"></i> '
                            + data;

                    }
                    else
                        return '';
                }
            }

        ],
        campStatsSummarySearch


    );
}


var getStatsSummaryCampblClick = function () {
    $(document).on('dblclick', '#tblCampStatsSummary tbody tr', function () {
        var row = $(this).closest("tr"),
            data = tblCampStatsSummary.dataTable().fnGetData(row);

        getCampStatSummaryById(data.PlanConfigId);

        console.log(data.PlanConfigId);
        //data.TeamStatus === true ? cbTeamStatus.prop("checked", true) :
        //    cbTeamStatus.prop("checked", false);


        campStatSummaryTable.modal('hide');
    });
};

var getCampStatSummaryById = function (planConfigId) {
    clearCampStatSummary();
    $.ajax({
        url: getUrl() + '/basar/CampStatsSummary/GetById',
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
            $("#loading").show();

        },
        complete: function () {
            //select 
            //getSelect();
            $("#loading").hide();

        },
        success: function (data) {
            ddlStatsSummaryCamps.val(planConfigId);


            //ddlTour.select2().val(data.TourId).trigger('change');




            txtOPDCount.val(data.OPDCount);
            txtORCount.val(data.ORCount);
            txtGlassesCount.val(data.ORCount);
            txtCampStatsSummaryNote.val(data.CampStatsSummaryNote);
            //txtPlanConfigEndDate.val(getDateFromJson(data.PlanConfigEndDate));

            data.CampStatsSummaryIsClosed === true ? cbCampStatsSummaryIsClosed.prop("checked", true) :
                cbCampStatsSummaryIsClosed.prop("checked", false);

            data.CampStatsSummaryStatus === true ? cbCampStatsSummaryStatus.prop("checked", true) :
                cbCampStatsSummaryStatus.prop("checked", false);



        },
        error: function (jqXHR) {
            console.log(jqXHR);

        }
    });
};

function clearCampStatSummary() {
    txtOPDCount.val('');
    txtORCount.val('');
    txtGlassesCount.val('');
    txtCampStatsSummaryNote.val('');
    //txtPlanConfigEndDate.val(getDateFromJson(data.PlanConfigEndDate));


    cbCampStatsSummaryIsClosed.prop("checked", false);

    cbCampStatsSummaryStatus.prop("checked", true);


}
//#endregion


