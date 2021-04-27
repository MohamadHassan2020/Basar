{
    const app = {
        id: 0,
        shared: new Shared(),
        msg: new SharedSweetAlert(),
        btnSave: document.getElementById('btnSave'),
        tblDataExists: document.getElementById('tblDataExists'),
        cbCampFollowUpDrugsIsClosed: document.getElementById('cbCampFollowUpDrugsIsClosed'),
        ddlPlanConfig: document.getElementById('ddlPlanConfig'),
        ddlFollowUpPhase: document.getElementById('ddlFollowUpPhase'),
        txtCampFollowUpDrugsDate: document.getElementById('txtCampFollowUpDrugsDate'),
        txtCampFollowUpDrugsNote: document.getElementById('txtCampFollowUpDrugsNote'),
        fuDrugsFollow: document.getElementById('fuDrugsFollow'),
        init: () => document.addEventListener('DOMContentLoaded', app.load()),
        load: () => app.pageFunc(),
        pageFunc: () => {
            //
            app.clear();
            //
            app.getBook();
            //
            app.getRow();
            //
            app.deleteRow();
            //
            getCampsFollowUp(app.ddlPlanConfig);
            getFollowUpPhase(app.ddlFollowUpPhase, "1");

            app.getFileInputjs(app.fuDrugsFollow);

            //Save data
            if (app.btnSave) {
                app.btnSave.addEventListener('click', () => {

                    if (!app.shared.checkValidation(app.txtCampFollowUpDrugsDate, 'تاريخ المرحلة')) {
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
                PlanConfigId: app.ddlPlanConfig.value.trim(),
                FollowUpStatusId: app.ddlFollowUpPhase.value.trim(),
                CampFollowUpDrugsDate: app.txtCampFollowUpDrugsDate.value.trim(),
                CampFollowUpDrugsNote: app.txtCampFollowUpDrugsNote.value.trim(),
                CampFollowUpDrugsStatus: true,
                CampFollowUpDrugsIsClosed: app.cbCampFollowUpDrugsIsClosed.checked === true ? true : false
            }
            app.shared.addAuth(obj, '/basar/CampFollowUpDrug/new', succ => {
                app.id = succ.PlanConfigId;
                app.shared.delay(50).then(() => {
                    app.msg.typeMsg();
                    //app.reloaddt();
                }).catch(err => err);
            }, err => err)
        },
        getBook: () => {
            const objFollow = {
                planConfigId: null,
                followUpStatusId: null

            }
            app.shared.getBookDataTable(tblDataExists,
                '/basar/CampFollowUpDrug/GetAllById',
                [
                    {
                        data: "SN",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        },
                        className: "text-center"
                    },
                    {
                        data: 'CampFollowUpDrugsDateIn',
                        className: "text-center",

                    },
                    {
                        data: 'FollowUpStatusDescAR',
                        className: "text-center"

                    },
                    {
                        data: 'CampFollowUpDrugsDate',
                        className: "text-center"
                    },
                    { data: 'CampFollowUpDrugsNote' },
                    {
                        data: 'UserName',
                        className: "text-center"

                    },
                    {
                        data: "isAttach",
                        className: 'text-center',
                        render: status => {
                            return app.shared.getStatusTextDataTable(status, 'المرفق', '-');
                        }
                    },
                    {
                        data: "Delete",
                        className: 'text-center',
                        render: function () {
                            return '<i class="bx bx-trash-alt delete-record"></i>';
                        }
                    }
                ], objFollow

            );

        },
        getRow: () => {

            app.shared.getRowBydblClick(data => {
                //clear preview data
                app.clear();

                //return select row data
                app.shared.delay(10).then(() => {
                    console.log(data);
                    data.CampFollowUpDrugsIsClosed === true ? app.cbCampFollowUpDrugsIsClosed.checked = true : app.cbCampFollowUpDrugsIsClosed.checked = false

                }).catch(err => err);
            }, '#tblDataExists')


        },

        deleteRow: () => {
            app.shared.getRowByClassClick(data => {
                app.msg.confirmMsg('هل تريد الحذف؟', '', 'warning', () => {
                    console.log('Done');
                }, () => {
                    app.msg.autoCloseMsg('البصر', 'البصر العالمية');
                });
            });

        },


        getFileInputjs: (inputFile, initial = []) => {
            $(inputFile).fileinput({
                theme: "explorer-fa",
                //uploadUrl: getUrl() + 'basar/upload/',
                //uploadUrl: "/file-upload-batch/2",
                allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'png', 'PNG', 'PDF', 'doc', 'docx', 'xls', 'xlsx'],
                overwriteInitial: false,
                autoReplace: false,
                initialPreviewAsData: true,
                maxFileSize: 10000,
                initialPreviewFileType: 'pdf',//'image',<i class=""></i>
                removeFromPreviewOnError: true,
                browseClass: "btn btn-primary btn-block",
                previewFileIcon: '<i class="fas fa-file"></i>',
                showCaption: false,
                showRemove: false,
                showUpload: false,
                //initialPreview: initial
            });
        },
        clear: () => {
            app.id = 0;
            app.txtCampFollowUpDrugsNote.value = "";
            app.ddlFollowUpPhase.value = "";
            app.ddlPlanConfig.value = "";
            app.txtCampFollowUpDrugsDate.value = "";
            app.cbCampFollowUpDrugsIsClosed.checked = false;
        }

    };

    app.init();
}