{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        txtCampStatusDescAR: document.getElementById('txtCampStatusDescAR'),
        txtCampStatusDescEN: document.getElementById('txtCampStatusDescEN'),
        btnSave: document.getElementById('btnSave'),
        cbCampStatusEnabled: document.getElementById('cbCampStatusEnabled'),
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
                    if (!app.shared.checkValidation(app.txtCampStatusDescAR, 'وصف حالة المخيم')) { }
                    if (!app.shared.checkValidation(app.txtCampStatusDescEN, 'وصف حالة المخيم بالنجليزية')) { }
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
                CampStatusId: app.id,
                CampStatusDescAR: app.txtCampStatusDescAR.value.trim(),
                CampStatusDescEN: app.txtCampStatusDescEN.value.trim(),
                CampStatusEnabled: app.cbCampStatusEnabled.getAttribute("checked") === true
                    ? true : false ? false : false//approach 1
            }
            app.shared.addAuth(obj, '/basar/campstatus/new', succ => {
                app.id = succ.CampStatusId;
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
                '/basar/campstatus/Get',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'CampStatusDescAR',
                        className: "text-danger"
                    },
                    { data: 'CampStatusDescEN' },
                    { data: 'CreationDate' },
                    {
                        data: "CampStatusEnabled",
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
                { CampStatusEnabled: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.CampStatusId;
                    app.txtCampStatusDescAR.value = data.CampStatusDescAR;
                    app.txtCampStatusDescEN.value = data.CampStatusDescEN;
                    data.CampStatusEnabled === true ? app.cbCampStatusEnabled.setAttribute('checked', true) :
                        app.cbCampStatusEnabled.setAttribute('checked', false)

                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.CampStatusId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { CampStatusId: id };
            app.shared.addAuth(obj, '/basar/campstatus/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.txtCampStatusDescAR.value = "";
            app.txtCampStatusDescEN.value = "";
            app.cbCampStatusEnabled.setAttribute('checked', true);
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}