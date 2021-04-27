{
    const app = {
        h2PlanYears: document.getElementById('h2PlanYears'),
        h2PlanCamps: document.getElementById('h2PlanCamps'),
        h2PlanCities: document.getElementById('h2PlanCities'),
        h2PlanCountries: document.getElementById('h2PlanCountries'),
        h2PlanSponsors: document.getElementById('h2PlanSponsors'),
        h2PlanTeams: document.getElementById('h2PlanTeams'),
        tbodyYearNumbers: document.getElementById('tbodyYearNumbers'),
        tbodyCampNumbers: document.getElementById('tbodyCampNumbers'),
        tbodyCountryNumbers: document.getElementById('tbodyCountryNumbers'),
        tbodySponsorNumbers: document.getElementById('tbodySponsorNumbers'),
        tbodyTeamNumbers: document.getElementById('tbodyTeamNumbers'),
        tbodyCampPhaseNumbers: document.getElementById('tbodyCampPhaseNumbers'),
        shared: new Shared(),
        msg: new SharedSweetAlert(),
        init: () => document.addEventListener('DOMContentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {
            app.statsNumbers();
            app.getPlanCountLi(app.tbodyYearNumbers,'/PlanStasticsHome/Stats/YearV2');
            app.getPlanCountLi(app.tbodyCampNumbers, '/PlanStasticsHome/Stats/CampCountV2');
            app.getPlanCountLi(app.tbodyCountryNumbers, '/PlanStasticsHome/Stats/CountryV2');
            app.getPlanCountLi(app.tbodySponsorNumbers, '/PlanStasticsHome/Stats/SponsorV2');
            app.getPlanCountLi(app.tbodyTeamNumbers, '/PlanStasticsHome/Stats/TeamV2');
            app.getPlanCountLi(app.tbodyCampPhaseNumbers, '/PlanStasticsHome/Stats/CampStatusV2');
        },
        statsNumbers: () => {
            const obj = {};
            app.shared.getAuth(obj, '/plan/Stats/CampStatusV2', data => {
                app.h2PlanYears.innerText = data.PlanYears;
                h2PlanCamps.textContent = data.PlanCamps;
                h2PlanCities.textContent = data.PlanCities;
                h2PlanCountries.textContent = data.PlanCountries;
                h2PlanSponsors.textContent = data.PlanSponsors;
                h2PlanTeams.textContent = data.PlanTeams;
            }, err => err);

        },
        getPlanCountLi: (elm,url) => {
            const obj = {};
            app.shared.getAuth(obj, url, data => {
                data.forEach((item, index) => {
                    elm.innerHTML += app.getCountStatsInTable(index, item.Key, item.Count, item.OPDCount, item.ORCount, item.GlassesCount);
                });

            }, err => err);
        },
        getCountStatsInTable: (index, statsLabel, campCount = '', opdCount = '', orCount = '', glassesCount = '') => {

            let content = '';
            content += `<tr>`;
            content += `<td class="py-1 line-ellipsis">`;
            content += `<span>${index + 1} - </span> ${statsLabel}`;
            content += `</td>`;
            content += `<td class="py-1">`;
            content += ` <i class="text-success align-middle mr-50"></i><span>${campCount === -1 ? '' : campCount}</span>`;
            content += `<td class="py-1">${opdCount === -1 ? '' : opdCount}</td>`;
            content += `<td class="text-success py-1">${orCount === -1 ? '' : orCount}</td>`;
            content += `<td class="text-success py-1">${glassesCount === -1 ? '' : glassesCount}</td>`;
            content += `<td class="text-center py-1">`;
            content += `<div class="dropdown">`;
            content += `<span class="bx bx-dots-vertical-rounded font-medium-3 dropdown-toggle nav-hide-arrow cursor-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></span>`;
            content += `<div class="dropdown-menu dropdown-menu-right">`;
            content += `<a class="dropdown-item" href="javascript:;"><i class="bx bx-edit-alt mr-1"></i> التفاصيل</a>`;
            content += `<a class="dropdown-item" href="javascript:;"><i class="bx bx-trash mr-1"></i> المتابعات</a>`;
            content += `</div>`;
            content += `</div>`;
            content += `</td>`;
            content += `</tr>`;
            return content;
        },
    };

    app.init();
}