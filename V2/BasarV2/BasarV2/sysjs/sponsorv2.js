{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        txtSponsorDsecAr: document.getElementById('txtSponsorDsecAr'),
        txtSponsorDsecEn: document.getElementById('txtSponsorDsecEn'),
        btnSave: document.getElementById('btnSave'),
        cbSponsorStatus: document.getElementById('cbSponsorStatus'),
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
                    if (!app.shared.checkValidation(app.txtSponsorDsecAr, 'اسم المتبرع عربي')) { }
                    if (!app.shared.checkValidation(app.txtSponsorDsecEn, 'اسم المتبرع انجليزي')) { }
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
                SponsorId: app.id,
                SponsorDsecAr: app.txtSponsorDsecAr.value.trim(),
                SponsorDsecEn: app.txtSponsorDsecEn.value.trim(),
                SponsorStatus: app.cbSponsorStatus.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/basar/sponsors/new', succ => {
                app.id = succ.SponsorId;
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
                '/basar/sponsors/Get',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'SponsorDsecAr',
                        className: "text-danger"
                    },
                    { data: 'SponsorDsecEn' },
                    { data: 'CreationDate' },
                    {
                        data: "SponsorStatus",
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
                { SponsorStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.SponsorId;
                    app.txtSponsorDsecAr.value = data.SponsorDsecAr;
                    app.txtSponsorDsecEn.value = data.SponsorDsecEn;
                    data.SponsorStatus === true ? app.cbSponsorStatus.checked = true : app.cbSponsorStatus.checked = false

                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.SponsorId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { SponsorId: id };
            app.shared.addAuth(obj, '/basar/sponsors/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.txtSponsorDsecAr.value = "";
            app.txtSponsorDsecEn.value = "";
            app.cbSponsorStatus.checked = true;
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}