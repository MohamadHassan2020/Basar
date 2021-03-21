//#region vars
var iPlanCamps = document.getElementById('iPlanCamps'),
    spanPlanYears = document.getElementById('spanPlanYears'),
    spanPlanCountries = document.getElementById('spanPlanCountries'),
    spanPlanSponsors = document.getElementById('spanPlanSponsors'),
    spanPlanTeams = document.getElementById('spanPlanTeams'),
    modalTable = $('#modalTable'),
    spanPlanCities = document.getElementById('spanPlanCities'),
    ddlPlanConfigYear = $('#ddlPlanConfigYearNav'),
    ddlTour = $('#ddlTourNav'),
    ddlCountry = $('#ddlCountryNav'),
    ddlCamp = $('#ddlCampNav');


//#endregion

$(function () {

    checkAllCampdbClick();
    getYears(ddlPlanConfigYear);
    getCountries(ddlCountry);

    getStatsCount();
    checkSponsordbClick();
    checkCountrydbClick();
    checkTeamdbClick();
    checkCampdbClick();
    checkYeardbClick();
    getPlancampStatusdbClick();
});


//#region 27-4-2020
var checkSponsordbClick = function () {
    $(document).on('dblclick', 'ul.sponsorplan li', function () {
        //var row = $(this).closest("li");
        var sponosorId = $(this).data('dataid'),
            url = '';
        var planSearch = {
            SponsorId: sponosorId != '-1' ? sponosorId : null
        };
        if (planSearch.SponsorId == null) {
            url = '/plan/config/AllPlan/Stats/Sponsors';
        }
        else {
            url = '/plan/config/AllPlan/Stats';
        }
        getPlanSearchResult(planSearch, url);

        modalTable.modal('show');

        //    data = tblDataExists.dataTable().fnGetData(row);
        //getPlanConfigById(data.PlanConfigId);
        //modalTable.modal('hide');

    });
};
var checkCountrydbClick = function () {
    $(document).on('dblclick', 'ul.countryplan li', function () {
        //var row = $(this).closest("li");
        var countryId = $(this).data('dataid');
        var planSearch = {
            //PlanConfigYear: $.trim(ddlPlanConfigYear.val()) != '' ? $.trim(ddlPlanConfigYear.val()) : null,
            CountryId: countryId != '-1' ? countryId : null
            //TourId: $.trim(ddlTour.val()) != '' ? $.trim(ddlTour.val()) : null,
            //TeamId: $.trim(ddlTeam.val()) != '' ? $.trim(ddlTeam.val()) : null,
            //CampId: $.trim(ddlCamp.val()) != '' ? $.trim(ddlCamp.val()) : null,
            //SponsorId: sponosorId != '-1' ? sponosorId : null
            //CampStatusId: $.trim(ddlCampStatus.val()) != '' ? $.trim(ddlCampStatus.val()) : null,
            //PlanConfigStartDate: $.trim(txtPlanConfigStartDate.val()) != '' ? $.trim(txtPlanConfigStartDate.val()) : null,
            //PlanConfigEndDate: $.trim(txtPlanConfigEndDate.val()) != '' ? $.trim(txtPlanConfigEndDate.val()) : null
        };
        getPlanSearchResult(planSearch, '/plan/config/AllPlan/Stats');

        modalTable.modal('show');

        //    data = tblDataExists.dataTable().fnGetData(row);
        //getPlanConfigById(data.PlanConfigId);
        //modalTable.modal('hide');

    });
};
var checkTeamdbClick = function () {
    $(document).on('dblclick', 'ul.teamplan li', function () {
        //var row = $(this).closest("li");
        var teamId = $(this).data('dataid');
        var planSearch = {
            TeamId: teamId != '-1' ? teamId : null
        };
        getPlanSearchResult(planSearch, '/plan/config/AllPlan/Stats');

        modalTable.modal('show');
    });
};
var checkCampdbClick = function () {
    $(document).on('dblclick', 'ul.campplan li', function () {
        //var row = $(this).closest("li");
        var campId = $(this).data('dataid'),
            url = '';
        var planSearch = {
            CampId: campId != '-1' ? campId : null
        };
        if (planSearch.CampId == null) {
            //url = '/plan/config/AllPlan/Stats/Sponsors';
            url = '/plan/config/AllPlan/Stats/camps';
        }
        else {
            url = '/plan/config/AllPlan/Stats';
        }
        getPlanSearchResult(planSearch, url);
        //console.log($(this).text());
        modalTable.modal('show');
    });
};
var checkAllCampdbClick = function () {
    $(document).on('dblclick', 'div.allstatscamps span', function () {
        var planSearch = {
            CampId: null
        };
        getPlanSearchResult(planSearch, '/plan/config/AllPlan/Stats');

        //console.log($(this).text());
        modalTable.modal('show');
    });
};

var checkYeardbClick = function () {

    $(document).on('dblclick', 'ul.yearplan li', function () {
        var yearId = $(this).data('dataid'),
            planSearch = {
                PlanConfigYear: yearId != '' ? yearId : null
            };

        getPlanSearchResult(planSearch, '/plan/config/AllPlan/Stats');
        modalTable.modal('show');

    });
};


function getPlancampStatusdbClick() {
    $(document).on('dblclick', 'ul.campstatusplan li', function () {
        var campStatusId = $(this).data('dataid'),
            planSearch = {
                CampStatusId: campStatusId != '-1' ? campStatusId : null
            };

        getPlanSearchResult(planSearch, '/plan/config/AllPlan/Stats/CampStatus');
        modalTable.modal('show');

    });
}
var getPlanSearchResult = function (planSearch, url) {

    getDataTableByData(tblDataExists,
        //getUrl() + '/plan/config/AllPlan/Stats',
        getUrl() + url,
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
            }

        ],
        planSearch
    );

};

//#endregion
function getStatsCount() {
    $.ajax({
        url: getUrl() + '/plan/Stats/CampStatus',
        type: 'GET',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },

        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            iPlanCamps.textContent = data.PlanCamps;
            spanPlanCities.textContent = data.PlanCities;
            spanPlanYears.textContent = data.PlanYears;
            spanPlanCountries.textContent = data.PlanCountries;
            spanPlanSponsors.textContent = data.PlanSponsors;
            spanPlanTeams.textContent = data.PlanTeams;

            //getPlanCountLi('/PlanStasticsHome/Stats/Year', '.yearplan');
            getPlanCountLi('/PlanStasticsHome/Stats/Year', '#yearsStatsTbody');
            //getPlanCountLi('/PlanStasticsHome/Stats/Country', '.countryplan');
            getPlanCountLi('/PlanStasticsHome/Stats/Country', '#countryStatsTbody');
            //getPlanCountLi('/PlanStasticsHome/Stats/sponsor', '.sponsorplan');
            getPlanCountLi('/PlanStasticsHome/Stats/sponsor', '#sponsorStatsTbody');
            // getPlanCountLi('/PlanStasticsHome/Stats/campCount', '.campplan');
            getPlanCountLi('/PlanStasticsHome/Stats/campCount', '#campsStatsTbody');
            //getPlanCountLi('/PlanStasticsHome/Stats/Team', '.teamplan');
            getPlanCountLi('/PlanStasticsHome/Stats/Team', '#teamStatsTbody');
            //getPlanCountLi('/plan/Config/stats/CampStatus', '.campstatusplan');
            getPlanCountLi('/PlanStasticsHome/Stats/CampStatus', '#statusCampStatsTbody');

        },
        error: function (jqXHR) {
            console.log(jqXHR);
        }
    });
}

function getPlanCountLi(urlExtend, ulClass) {
    $.ajax({
        url: getUrl() + urlExtend,
        type: 'GET',
        headers: {
            'Authorization': 'Bearer '
                + getAccessInfo().access_token
        },

        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        beforeSend(jqXHR) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            $(data).each(function (index, item) {
                //getCountPlan(index + 1, ulClass, item.Key, item.Count, item.Id, item.OPDCount, item.ORCount, item.GlassesCount);
                getCountStatsInTable(index + 1, ulClass, item.Key, item.Count, item.Id, item.OPDCount, item.ORCount, item.GlassesCount);
            });

        },
        error: function (jqXHR) {
            console.log(jqXHR);
        }
    });
}



var getCountPlan = function (serial, liClass, value, count, id, opdCount, oRCount, glassesCount) {
    if (value == null) {
        value = 'تحدد لاحقاً';
    }
    if (opdCount === -1) {
        opdCount = '';
    }
    if (oRCount === -1) {
        oRCount = '';
    }
    if (glassesCount === -1) {
        glassesCount = '';
    }
    //oRCount == -1 ? '?' : oRCount;
    //glassesCount == -1 ? '?' : glassesCount;

    var card = '';

    card += '<li class="list-group-item"  data-dataid=' + id + '> <strong > ' + serial + ' </strong> ' + ' - ' + value;
    card += '<span data-toggle="tooltip" title="عدد المخيمات في  ' + value + '" class="badge badge-pill badge-info">' + count + '</span>';
    card += '<span data-toggle="tooltip" title="عدد مراجعي العيادات  ' + value + '" class="badge badge-pill badge-primary tab-number text-center">' + opdCount + '</span>';
    card += '<span data-toggle="tooltip" title="عدد العمليات في  ' + value + '" class="badge badge-pill badge-danger tab-number">' + oRCount + '</span>';
    card += '<span data-toggle="tooltip" title="عدد النظارات في  ' + value + '" class="badge badge-pill badge-success tab-number">' + glassesCount + '</span>';

    card += '</li>';

    $(liClass).append(card);


};
let getCountStatsInTable = function (serial, elmClass, value, count, id, opdCount, oRCount, glassesCount) {
    if (value == null) {
        value = 'تحدد لاحقاً';
    }
    if (opdCount === -1) {
        opdCount = '';
    }
    if (oRCount === -1) {
        oRCount = '';
    }
    if (glassesCount === -1) {
        glassesCount = '';
    }
    //oRCount == -1 ? '?' : oRCount;
    //glassesCount == -1 ? '?' : glassesCount;

    let content = '';
    /* content += `<table class="table">`;
     content += `<thead class="thead-dark">`;
     content += `<tr>`;
     content += `<th scope="col">#</th>`;
     content += `<th scope="col">العام</th>`;
     content += `<th scope="col">العدد</th>`;
     content += `<th scope="col">العيادات</th>`;
     content += `<th scope="col">العمليات</th>`;
     content += `<th scope="col">النظارات</th>`;
     content += `</tr></thead>`;
     content += `<tbody>`;*/
    content += `<tr>`;
    content += `<td data-toggle="tooltip" title=" ${value}">${serial} - ${value}
<span data-toggle="tooltip" title="عدد المخيمات لعام  ${value}" class="badge badge-secondary float-right">${count}</span></td>`;
    content += `<td class="text-center" data-toggle="tooltip" title="عدد مراجعي العيادات  ${value}"><span data-toggle="tooltip" title="عدد المخيمات لعام  ${value}" class="badge badge-secondary">${opdCount}</span>
<span data-toggle="tooltip" title="عدد مراجعي العمليات  ${value}" class="badge badge-secondary">${oRCount}</span>
<span data-toggle="tooltip" title="عدد مراجعي النظارات  ${value}" class="badge badge-secondary">${glassesCount}</span>
</td>`;
    /*
    card += '<li class="list-group-item"  data-dataid=' + id + '> <strong > ' + serial + ' </strong> ' + ' - ' + value;
    card += '<span data-toggle="tooltip" title="عدد المخيمات في  ' + value + '" class="badge badge-pill badge-info">' + count + '</span>';
    card += '<span data-toggle="tooltip" title="عدد مراجعي العيادات  ' + value + '" class="badge badge-pill badge-primary tab-number text-center">' + opdCount + '</span>';
    card += '<span data-toggle="tooltip" title="عدد العمليات في  ' + value + '" class="badge badge-pill badge-danger tab-number">' + oRCount + '</span>';
    card += '<span data-toggle="tooltip" title="عدد النظارات في  ' + value + '" class="badge badge-pill badge-success tab-number">' + glassesCount + '</span>';
    */
    /*
    content += '</tr></tbody>';
    content += '</table>';*/

    $(elmClass).append(content);


};