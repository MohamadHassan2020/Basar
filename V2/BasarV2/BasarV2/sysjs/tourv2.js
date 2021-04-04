{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        txtTourDsecAr: document.getElementById('txtTourDsecAr'),
        txtTourDsecEn: document.getElementById('txtTourDsecEn'),
        txtTourDescHint: document.getElementById('txtTourDescHint'),
        btnSave: document.getElementById('btnSave'),
        cbTourStatus: document.getElementById('cbTourStatus'),
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
                    if (!app.shared.checkValidation(app.txtTourDsecAr, 'وصف الجولة المخيم')) { }
                    if (!app.shared.checkValidation(app.txtTourDsecEn, 'وصف الجولة بالانجليزية')) { }
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
                TourId: app.id,
                TourDescHint: app.txtTourDescHint.value.trim(),
                TourDsecAr: app.txtTourDsecAr.value.trim(),
                TourDsecEn: app.txtTourDsecEn.value.trim(),
                TourStatus: app.cbTourStatus.getAttribute("checked") === true
                    ? true : false //approach 1
            }
            app.shared.addAuth(obj, '/basar/tour/new', succ => {
                app.id = succ.TourId;
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
                '/basar/tour/Get',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'TourDsecAr',
                        className: "text-danger"
                    },
                    { data: 'TourDsecEn' },
                    { data: 'CreationDate' },
                    {
                        data: "TourStatus",
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
                { TourStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.TourId;
                    app.txtTourDescHint.value = data.TourDescHint;
                    app.txtTourDsecAr.value = data.TourDsecAr;
                    app.txtTourDsecEn.value = data.TourDsecEn;
                    data.TourStatus === true ? app.cbTourStatus.setAttribute('checked', true) :
                        app.cbTourStatus.setAttribute('checked', false)

                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.TourId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { TourId: id };
            app.shared.addAuth(obj, '/basar/tour/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    //reload data
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.txtTourDescHint.value = "";
            app.txtTourDsecAr.value = "";
            app.txtTourDsecEn.value = "";
            app.cbTourStatus.setAttribute('checked', true);
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}