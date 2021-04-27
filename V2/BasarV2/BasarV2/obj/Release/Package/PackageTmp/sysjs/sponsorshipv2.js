{
    const app = {
        id: 0,
        tblDataExists: document.getElementById('tblDataExists'),
        ddlSponsor: document.getElementById('ddlSponsor'),
        txtSponsorShipName: document.getElementById('txtSponsorShipName'),
        txtSponsorShipNameEN: document.getElementById('txtSponsorShipNameEN'),
        btnSave: document.getElementById('btnSave'),
        cbSponsorShipStatus: document.getElementById('cbSponsorShipStatus'),
        shared: new Shared(),
        msg: new SharedSweetAlert(),
        init: () => document.addEventListener('DOMConentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {
            //
            getSponsors(ddlSponsor);
            //delete row 
            app.deleteRow();

            //Get data exists
            app.getBook();

            //Get selected row
            app.getRow();

            //Save data
            if (app.btnSave) {
                app.btnSave.addEventListener('click', () => {
                    if (!app.shared.checkValidation(app.ddlSponsor, 'المتبرع')) { }
                    if (!app.shared.checkValidation(app.txtSponsorShipName, 'اسم المتبرع عربي')) { }
                    if (!app.shared.checkValidation(app.txtSponsorShipNameEN, 'اسم المتبرع انجليزي')) { }
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
                SponsorShipId: app.id,
                SponsorId: app.ddlSponsor.value.trim(),
                SponsorShipName: app.txtSponsorShipName.value.trim(),
                SponsorShipNameEN: app.txtSponsorShipNameEN.value.trim(),
                SponsorShipStatus: app.cbSponsorShipStatus.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/basar/SponsorShip/new', succ => {
                app.id = succ.SponsorShipId;
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
                '/basar/SponsorShip/all',
                [
                    {
                        data: "SN",
                        render: app.shared.getRowNumberDataTable
                    },
                    {
                        data: 'SponsorShipName',
                        className: "text-danger"
                    },
                    { data: 'SponsorShipNameEN' },
                    { data: 'SponsorShipDateIn' },
                    {
                        data: "SponsorShipStatus",
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
                { SponsorShipStatus: null }
            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    app.id = data.SponsorShipId;
                    app.ddlSponsor.value = data.SponsorId;
                    app.txtSponsorShipName.value = data.SponsorShipName;
                    app.txtSponsorShipNameEN.value = data.SponsorShipNameEN;
                    data.SponsorShipStatus === true ? app.cbSponsorShipStatus.checked = true : app.cbSponsorShipStatus.checked = false

 
                }).catch(err => err);
            }, '#tblDataExists')


        },
        deleteRow: () => {
            $(tblDataExists).on("click", ".delete-record", function () {
                const row = $(this).closest("tr"),
                    data = $(tblDataExists).dataTable().fnGetData(row);
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    app.del(data.SponsorShipId);
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });
        },
        del: id => {
            const obj = { SponsorShipId: id };
            app.shared.addAuth(obj, '/basar/SponsorShip/del', () => {
                app.shared.delay(10).then(() => {
                    app.msg.typeMsg('تم الحذف', '', 'success');
                    app.reloaddt();
                }).catch(err => err);
            }, err => err);
        },
        clear: () => {
            app.id = 0;
            app.ddlSponsor.selectedIndex = 0;
            app.txtSponsorShipName.value = "";
            app.txtSponsorShipNameEN.value = "";
            app.cbSponsorShipStatus.checked = true;
        },
        reloaddt: () => {
            const tbl = $(tblDataExists).DataTable();
            tbl.ajax.reload(null, false);

        }
    };
    app.init();
}