{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        txtCountryDsecAr: document.getElementById('txtCountryDsecAr'),
        txtCountryDsecEn: document.getElementById('txtCountryDsecEn'),
        btnSave: document.getElementById('btnSave'),
        cbCountryStatus: document.getElementById('cbCountryStatus'),
        shared: new Shared(),
        msg: new SharedSweetAlert(),
        init: () => document.addEventListener('DOMConentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {

            //delete row 
            app.deleteRow();

            //Get data exists
            app.getBook();

            //Get selected row
            app.getRow();

            //Save data
            if (app.btnSave) {
                app.btnSave.addEventListener('click', () => {
                    if (!app.shared.checkValidation(app.txtCountryDsecAr, 'وصف الدولة بالعربية')) { }
                    if (!app.shared.checkValidation(app.txtCountryDsecEn, 'وصف الدولة بالانجليزية')) { }
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
                CountryId: app.id,
                CountryDsecAr: app.txtCountryDsecAr.value.trim(),
                CountryDsecEn: app.txtCountryDsecEn.value.trim(),
                CountryStatus: app.cbCountryStatus.getAttribute("checked") === true
                    ? true : false ? false : false//approach 1
            }
            app.shared.addAuth(obj, '/basar/country/new', succ => {
                app.id = succ.CountryId;
                app.shared.delay(50).then(() => {
                    app.msg.typeMsg();
                    //app.reloaddt();
                }).catch(err => err);
            }, err => err)
        },
        getBook: () => {
            app.shared.getBookDataTable(tblDataExists,
                '/basar/country/Get',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'CountryDsecAr',
                        className: "text-danger"
                    },
                    { data: 'CountryDsecEn' },
                    { data: 'CreationDate' },
                    {
                        data: "CountryStatus",
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
                { CountryStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.CountryId;
                    app.txtCountryDsecAr.value = data.CountryDsecAr;
                    app.txtCountryDsecEn.value = data.CountryDsecEn;
                    data.CountryStatus === true ? app.cbCountryStatus.setAttribute('checked', true) :
                        app.cbCountryStatus.setAttribute('checked', false)

                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr");
                const data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.CountryId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { CountryId: id };
            app.shared.addAuth(obj, '/basar/country/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.txtCountryDsecAr.value = "";
            app.txtCountryDsecEn.value = "";
            app.cbCountryStatus.setAttribute('checked', false);
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}