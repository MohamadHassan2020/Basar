{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        ddlPlanConfigYear: document.getElementById('ddlPlanConfigYear'),
        ddlTour: document.getElementById('ddlTour'),
        ddlCountry: document.getElementById('ddlCountry'),
        ddlCamp: document.getElementById('ddlCamp'),
        ddlTeam: document.getElementById('ddlTeam'),
        ddlSponsor: document.getElementById('ddlSponsor'),
        ddlSponsorShip: document.getElementById('ddlSponsorShip'),
        ddlCampStatus: document.getElementById('ddlCampStatus'),
        txtPlanConfigRemark: document.getElementById('txtPlanConfigRemark'),
        btnSave: document.getElementById('btnSave'),
        txtPlanConfigDateRange: document.getElementById('txtPlanConfigDateRange'),
        cbPreliminaryStatus: document.getElementById('cbPreliminaryStatus'),
        shared: new Shared(),
        msg: new SharedSweetAlert(),
        init: () => document.addEventListener('DOMConentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {

            $('a[data-toggle="tab"][id="all-tab"]').on('shown.bs.tab', function (e) {
                app.getBook();
            });

            //date picker
            $('.showdropdowns').daterangepicker({
                showDropdowns: true,
                drops: "up"
            });

            //#region lists
            //
            getCountries(app.ddlCountry);
            getSponsors(app.ddlSponsor);
            getYears(app.ddlPlanConfigYear);
            getTour(app.ddlTour);
            getTeam(app.ddlTeam);
            getCampStatus(app.ddlCampStatus);

            //get camps
            app.ddlCountry.addEventListener('change', function () {
                getCampsByCountry(ddlCamp, this.value.trim());
            });

            //get sponsor ship
            app.ddlSponsor.addEventListener('change', function () {
                getSponsorShipBySponsor(ddlSponsorShip, this.value.trim());
            });


            //#endregion
            //delete row 
            app.deleteRow();



            //Get selected row
            app.getRow();

            //Save data
            if (app.btnSave) {
                app.btnSave.addEventListener('click', () => {
                    if (!app.shared.checkValidation(app.ddlPlanConfigYear, 'العام')) { }
                    if (!app.shared.checkValidation(app.ddlCountry, 'الدولة')) { }
                    else {
                        app.msg.confirmMsg('هل تريد الحفظ', 'البرنامج', 'warning', app.add, () => {
                            app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                        });
                    }
                });
            }
        },
        add: () => {
            const dateRange = $(app.txtPlanConfigDateRange).data('daterangepicker');
            const obj = {
                PlanConfigId: app.id,
                PlanConfigYear: app.ddlPlanConfigYear.value.trim(),
                TourId: app.ddlTour.value.trim(),
                TeamId: app.ddlTeam.value.trim(),
                CountryId: app.ddlCountry.value.trim(),
                CampId: app.ddlCamp.value.trim(),
                SponsorId: app.ddlSponsor.value.trim(),
                CampStatusId: app.ddlCampStatus.value.trim(),
                PlanConfigStartDate: dateRange.startDate.format('MM/DD/YYYY'),
                PlanConfigEndDate: dateRange.endDate.format('MM/DD/YYYY'),
                PlanConfigRemark: app.txtPlanConfigRemark.value.trim(),
                PreliminaryStatus: app.cbPreliminaryStatus.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/plan/config', succ => {
                app.id = succ.PlanConfigId;
                app.shared.delay(50).then(() => {

                    //check sponsor ship befor saved
                    if (app.shared.isValidate(app.ddlSponsorShip)) {
                        const obj2 = {
                            PlanConfigId: app.id,
                            SponsorShipId: app.ddlSponsorShip.value.trim(),
                            SponsorId: app.ddlSponsor.value.trim()
                        };
                        //add plan config sponsor ship
                        app.shared.addAuth(obj2, '/plan/config/SponsorShip/Add', () => { }, err => err);
                    }
                    //msg 
                    app.msg.typeMsg();
                    //reload data
                    //app.reloaddt();
                }).catch(err => err);
            }, err => err)
        },
        getBook: () => {

            const planSearch = {
                PlanConfigYear: app.ddlPlanConfigYear.value.trim() != '' ? app.ddlPlanConfigYear.value.trim() : null,
                CountryId: app.ddlCountry.value.trim() != '' ? app.ddlCountry.value.trim() : null,
                TourId: app.ddlTour.value.trim() != '' ? app.ddlTour.value.trim() : null,
                TeamId: app.ddlTeam.value.trim() != '' ? app.ddlTeam.value.trim() : null,
                CampId: app.ddlCamp.value.trim() != '' ? app.ddlCamp.value.trim() : null,
                SponsorId: app.ddlSponsor.value.trim() != '' ? app.ddlSponsor.value.trim() : null,
                CampStatusId: app.ddlCampStatus.value.trim() != '' ? app.ddlCampStatus.value.trim() : null,
                //    PlanConfigStartDate: $.trim(txtPlanConfigStartDate.val()) != '' ? $.trim(txtPlanConfigStartDate.val()) : null,
                //    PlanConfigEndDate: $.trim(txtPlanConfigEndDate.val()) != '' ? $.trim(txtPlanConfigEndDate.val()) : null
            };

            app.shared.getBookDataTable(tblDataExists,
                '/plan/config/AllPlan',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable,
                        className: 'text-center'

                    },
                    {
                        data: 'PlanConfigYear',
                        className: "text-center"
                    },
                    {
                        data: 'TourDsecAr',
                        visible: false
                    },
                    {
                        data: 'CountryDsecAr', className: 'text-center'
                    },
                    {
                        data: 'CampDsecAr', className: 'text-center'
                    },
                    {
                        data: 'TeamDsecAr',
                        visible: false
                    },
                    {
                        data: 'SponsorDsecAr',
                        render: function (data, type, row, meta) {
                            return data + '</br >' + row["SponsorShipName"];
                        },
                        className: 'text-center'

                    },
                    {
                        data: 'PlanConfigStartDate',
                        'render': function (data) {
                            return `<i class="bx bx-calendar bx-sm"></i> ${app.shared.getDateFromJsonYMD(data)}`;
                        },
                        className: 'text-center'
                    },
                    {
                        data: 'PlanConfigEndDate',
                        'render': data => `<i class="bx bx-calendar bx-sm"></i> ${app.shared.getDateFromJsonYMD(data)}`,
                        className: 'text-center'

                    },
                    {
                        data: 'OPDCount',
                        className: 'text-center',
                        'render': function (data) {
                            if (data > 0) {
                                return `<span class="badge badge-light-primary">${data}</span>`;
                            }
                            else
                                return '';
                        }
                    },
                    {
                        data: 'ORCount',
                        className: 'text-center',
                        'render': function (data) {
                            if (data > 0) {
                                return `<span class="badge badge-light-success">${data}</span>`;
                            }
                            else
                                return '';
                        }
                    },
                    {
                        data: 'GlassesCount',
                        className: 'text-center',
                        'render': function (data) {
                            if (data > 0) {
                                return `<span class="badge badge-light-warning">${data}</span>`;

                            }
                            else
                                return '';
                        }
                    },
                    {
                        data: "Delete",
                        className: 'text-center',
                        render: function () {
                            return '<i class="bx bx-trash-alt delete-record"></i>';
                        }
                    }
                ], planSearch
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(100).then(() => {
                    app.id = data.PlanConfigId;
                    app.getPlanConfigById(data.PlanConfigId);
                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.PlanConfigId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { PlanConfigId: id };
            app.shared.addAuth(obj, '/plan/config/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.ddlCamp.selectedIndex = 0;
            app.ddlCampStatus.selectedIndex = 0;
            app.ddlCountry.selectedIndex = 0;
            app.ddlPlanConfigYear.selectedIndex = 0;
            app.ddlSponsor.selectedIndex = 0;
            app.ddlSponsorShip.selectedIndex = 0;
            app.ddlTeam.selectedIndex = 0;
            app.ddlTour.selectedIndex = 0;
            app.cbPreliminaryStatus.checked = true;
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);
        },
        getPlanConfigById: planConfigId => {
            const obj2 = {
                planConfigId
            };

            app.shared.getAuth(obj2, '/plan/config/ById', data => {

                app.ddlPlanConfigYear.value = data.PlanConfigYear;


                //ddlTour.select2().val(data.TourId).trigger('change');
                //ddlCountry.select2().val(data.CountryId).trigger('change');


                getCampsByCountry(app.ddlCamp, data.CountryId);
                setTimeout(function () {

                    //ddlCamp.select2().val(data.CampId).trigger('change');
                    //getSelect();
                }, 1000);

                //ddlTeam.select2().val(data.TeamId).trigger('change');
                //ddlSponsor.select2().val(data.SponsorId).trigger('change');
                getSponsorShipBySponsor(app.ddlSponsorShip, data.SponsorId);


                //ddlCampStatus.select2().val(data.CampStatusId).trigger('change');

                //txtPlanConfigStartDate.val(getDateFromJson(data.PlanConfigStartDate));
                //txtPlanConfigEndDate.val(getDateFromJson(data.PlanConfigEndDate));
                app.txtPlanConfigRemark.value = data.PlanConfigRemark;

                /*data.PlanConfigStatus === true ? cbPlanConfigStatus.prop("checked", true) :
                    cbPlanConfigStatus.prop("checked", false);*/

                data.PreliminaryStatus === true ? app.cbPreliminaryStatus.checked = true : app.cbPreliminaryStatus.checked = false

                /*data.PlanConfigIsClosed === true ? cbPlanConfigIsClosed.prop("checked", true) :
                    cbPlanConfigIsClosed.prop("checked", false);*/


            }, err => err);
        },
    };
    app.init();
}