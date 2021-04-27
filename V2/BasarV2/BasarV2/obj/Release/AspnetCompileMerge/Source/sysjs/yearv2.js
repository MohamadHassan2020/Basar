{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        txtYearNameAr: document.getElementById('txtYearNameAr'),
        txtYearOrder: document.getElementById('txtYearOrder'),
        txtYearDesc: document.getElementById('txtYearDesc'),
        btnSave: document.getElementById('btnSave'),
        cbYearStatus: document.getElementById('cbYearStatus'),
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
                    if (!app.shared.checkValidation(app.txtYearNameAr, 'عام الخطة')) {

                    }
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
                yearId: app.id,
                yearNameAr: app.txtYearNameAr.value.trim(),
                yearNameEn: app.txtYearNameAr.value.trim(),
                yearDesc: app.txtYearDesc.value.trim(),
                yearOrder: app.txtYearOrder.value.trim(),
                yearStatus: app.cbYearStatus.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/basar/year/new', succ => {
                app.id = succ.YearId;
                app.shared.delay(50).then(() => {
                    app.msg.typeMsg();
                    app.reloaddt();
                }).catch(err => err);
            }, err => err)
        },
        getBook: () => {
            app.shared.getBookDataTable(tblDataExists,
                '/basar/year/Get',
                [
                    {
                        data: "SN",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                    {
                        data: 'YearNameAr',
                        className: "text-danger"
                    },
                    { data: 'YearNameEn' },
                    { data: 'CreationDate' },
                    {
                        data: "YearStatus",
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
                { YearStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.YearId;
                    app.txtYearNameAr.value = data.YearNameAr;
                    app.txtYearDesc.value = data.YearDesc;
                    data.YearStatus === true ? app.cbYearStatus.checked = true : app.cbYearStatus.checked = false

                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr");
                const data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.YearId, data.YearNameEn);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: (id, yearNameEn) => {
            const obj = { YearId: id, YearNameEn: yearNameEn };
            app.shared.addAuth(obj, '/basar/year/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.txtYearNameAr.value = "";
            app.txtYearNameAr.value = "";
            app.txtYearDesc.value = "";
            app.txtYearOrder.value = "";
            app.cbYearStatus.checked = true;
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}