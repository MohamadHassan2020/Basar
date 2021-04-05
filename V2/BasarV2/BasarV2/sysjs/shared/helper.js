const shared = new Shared();
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