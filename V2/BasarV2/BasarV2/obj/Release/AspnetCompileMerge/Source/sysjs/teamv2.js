{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        txtTeamDsecAr: document.getElementById('txtTeamDsecAr'),
        txtTeamDsecEn: document.getElementById('txtTeamDsecEn'),
        btnSave: document.getElementById('btnSave'),
        cbTeamStatus: document.getElementById('cbTeamStatus'),
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
                    if (!app.shared.checkValidation(app.txtTeamDsecAr, 'اسم الفريق عربي')) { }
                    if (!app.shared.checkValidation(app.txtTeamDsecEn, 'اسم الفريق انجليزي')) { }
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
                TeamId: app.id,
                TeamDsecAr: app.txtTeamDsecAr.value.trim(),
                TeamDsecEn: app.txtTeamDsecEn.value.trim(),
                TeamStatus: app.cbTeamStatus.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/basar/teams/new', succ => {
                app.id = succ.TeamId;
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
                '/basar/teams/Get',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'TeamDsecAr',
                        className: "text-danger"
                    },
                    { data: 'TeamDsecEn' },
                    { data: 'CreationDate' },
                    {
                        data: "TeamStatus",
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
                { TeamStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.TeamId;
                    app.txtTeamDsecAr.value = data.TeamDsecAr;
                    app.txtTeamDsecEn.value = data.TeamDsecEn;
                    data.TeamStatus === true ? app.cbTeamStatus.checked = true : app.cbTeamStatus.checked = false

                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.TeamId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { TeamId: id };
            app.shared.addAuth(obj, '/basar/teams/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.txtTeamDsecAr.value = "";
            app.txtTeamDsecEn.value = "";
            app.cbTeamStatus.checked = true;
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}