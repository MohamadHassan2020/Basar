const shared = new Shared();

//#region 12-4-2021
const getCampsFollowUp = async (ddlCamps) => {
    if (ddlCamps) {
        let ddl = ddlCamps;
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '').text(' المخيم'));
        let obj = { CampStatus: true };
        await shared.getAuth(obj, '/plan/config/AllPlanPending',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.PlanConfigId,
                        text: item.CountryDsecAr + '\t' + item.CampDsecAr + '\t' + shared.getDateFromJsonDMY(item.PlanConfigStartDate)
                    }));
                });
            }, err => err
        );
    }
};
const getFollowUpPhase = async (ddlFollowUpPhase, divider) => {
    if (ddlFollowUpPhase) {
        let ddl = ddlFollowUpPhase;
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '').text(' حالة المخيم'));
        let obj = { FollowUpStatusEnabled: true, FollowUpStatusDivider: divider };
        await shared.getAuth(obj, '/basar/FollowUpStatus/Get',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.FollowUpStatusId,
                        text: item.FollowUpStatusDescAR
                    }));
                });
            }, err => err
        );
    }

};

//#endregion
const getCountries = async ddlCountry => {
    if (ddlCountry) {
        let ddl = ddlCountry;
        $(ddl).append($("<option/>").attr("value", '').text('الدولة'));
        let obj = { CountryStatus: true };
        await shared.getAuth(obj, '/basar/country',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.CountryId,
                        text: item.CountryDsecAr
                    }));
                });
            }, err => err
        );
    }
};
const getSponsors = async ddlSponsor => {
    if (ddlSponsor) {
        let ddl = ddlSponsor;
        $(ddl).append($("<option/>").attr("value", '').text('المتبرع'));
        let obj = { SponsorStatus: true };
        await shared.getAuth(obj, '/basar/sponsors',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.SponsorId,
                        text: item.SponsorDsecAr
                    }));
                });
            }, err => err
        );
    }

};
const getYears = async ddlyear => {
    if (ddlyear) {
        let ddl = ddlyear;
        $(ddl).append($("<option/>").attr("value", '').text('عام الخطة'));
        let obj = { yearStatus: true };
        await shared.getAuth(obj, '/basar/Year',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.YearNameEn,
                        text: item.YearNameAr,
                        'data-yeardesc': item.YearDesc
                    }));
                });
            }, err => err
        );
    }

};
const getTour = async ddlTour => {
    if (ddlTour) {
        let ddl = ddlTour;
        $(ddl).append($("<option/>").attr("value", '').text('الجولة'));
        let obj = { TourStatus: true };
        await shared.getAuth(obj, '/basar/tour',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.TourId,
                        text: item.TourDsecAr,
                        'data-tourdeschint': item.TourDescHint,
                        'data-toggle': 'tooltip',
                        'data-container': '#tooltipContainer',
                        title: item.TourHint //,
                    }));
                });
            }, err => err
        );
    }

};
const getTeam = async ddlTeam => {
    if (ddlTeam) {
        let ddl = ddlTeam;
        $(ddl).append($("<option/>").attr("value", '').text('الفريق'));
        let obj = { TeamStatus: true };
        await shared.getAuth(obj, '/basar/teams',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.TeamId,
                        text: item.TeamDsecAr
                    }));
                });
            }, err => err
        );
    }

};
const getCampStatus = async ddlCampStatus => {
    if (ddlCampStatus) {
        let ddl = ddlCampStatus;
        $(ddl).append($("<option/>").attr("value", '').text('حالة المخيم'));
        let obj = { CampStatusEnabled: true };
        await shared.getAuth(obj, '/basar/campstatus',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.CampStatusId,
                        text: item.CampStatusDescAR
                    }));
                });
            }, err => err
        );
    }

};
const getCampsByCountry = async (ddlCamps, countryId) => {
    if (ddlCamps) {
        let ddl = ddlCamps;
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '').text('مدينة المخيم'));
        let obj = { CampStatus: true, countryId };
        await shared.getAuth(obj, '/basar/camps',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.CampId,
                        text: item.CampDsecAr
                    }));
                });
            }, err => err
        );
    }

};

const getSponsorShipBySponsor = async (ddlSponosrShip, sponsorId) => {
    if (ddlSponosrShip) {
        let ddl = ddlSponosrShip;
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '').text('المتبرع'));
        let obj = { SponsorShipStatus: true, sponsorId };
        await shared.getAuth(obj, '/basar/SponsorShip/all',
            data => {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.SponsorShipId,
                        text: item.SponsorShipName
                    }));
                });
            }, err => err
        );
    }

};