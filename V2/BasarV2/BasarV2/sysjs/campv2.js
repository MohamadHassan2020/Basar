{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        ddlCountry: document.getElementById('ddlCountry'),
        txtCampDsecAr: document.getElementById('txtCampDsecAr'),
        txtCampDsecEn: document.getElementById('txtCampDsecEn'),
        btnSave: document.getElementById('btnSave'),
        cbCampStatus: document.getElementById('cbCampStatus'),
        shared: new Shared(),
        msg: new SharedSweetAlert(),
        init: () => document.addEventListener('DOMConentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {
            //
            getCountries(ddlCountry);
            //delete row 
            app.deleteRow();

            //Get data exists
            app.getBook();

            //Get selected row
            app.getRow();

            //Save data
            if (app.btnSave) {
                app.btnSave.addEventListener('click', () => {
                    if (!app.shared.checkValidation(app.ddlCountry, 'الدولة')) { }
                    if (!app.shared.checkValidation(app.txtCampDsecAr, 'اسم المدينة عربي')) { }
                    if (!app.shared.checkValidation(app.txtCampDsecEn, 'اسم المدينة انجليزي')) { }
                    else {
                        app.msg.confirmMsg('هل تريد الحفظ', 'البرنامج', 'warning', app.add, () => {
                            app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                        });
                    }
                });
            }
        },
        add: () => {
            const obj = {
                CampId: app.id,
                CountryId: app.ddlCountry.value.trim(),
                CampDsecAr: app.txtCampDsecAr.value.trim(),
                CampDsecEn: app.txtCampDsecEn.value.trim(),
                CampStatus: app.cbCampStatus.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/basar/camps/new', succ => {
                app.id = succ.CampId;
                app.shared.delay(50).then(() => {
                    //msg 
                    app.msg.typeMsg();
                    //reload data
                    app.reloaddt();
                }).catch(err => err);
            }, err => err)
        },
        getBook: () => {
            app.shared.getBookDataTable(tblDataExists,
                '/basar/camps/all',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'CampDsecAr',
                        className: "text-danger"
                    },
                    { data: 'CampDsecEn' },
                    { data: 'CreationDate' },
                    {
                        data: "CampStatus",
                        className: 'text-center',
                        render: status => {
                            return app.shared.getStatusTextDataTable(status);
                        }
                    },
                    {
                        data: "Delete",
                        className: 'text-center',
                        render: function () {
                            return '<i class="bx bx-trash-alt delete-record"></i>';
                        }
                    }
                ],
                { CampStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.CampId;
                    app.ddlCountry.value = data.CountryId;
                    app.txtCampDsecAr.value = data.CampDsecAr;
                    app.txtCampDsecEn.value = data.CampDsecEn;
                    data.CampStatus === true ? app.cbCampStatus.checked = true : app.cbCampStatus.checked = false
                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.CampId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { CampId: id };
            app.shared.addAuth(obj, '/basar/camps/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.ddlCountry.selectedIndex = 0;
            app.txtCampDsecAr.value = "";
            app.txtCampDsecEn.value = "";
            app.cbCampStatus.checked = true;
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}