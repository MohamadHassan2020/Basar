{
    //#region vars
    let ddlPlanConfigYear = $('#ddlPlanConfigYear'),
        inputmedia = $("#inputmedia"),
        
        fuDrugsFollow = $("#fuDrugsFollow"),
        inputfinance = $("#inputfinance"),
        loadingDiv = $('#loading'),
        ddlTour = $('#ddlTour'),
        ddlCountry = $('#ddlCountry'),
        ddlCampFollowUpDrugs = $('#ddlCampFollowUpDrugs'),
        ddlFollowUpStatusFinance = $('#ddlFollowUpStatusFinance'),
        ddlFollowUpStatusManager = $('#ddlFollowUpStatusManager'),
        ddlFollowUpStatusMedia = $('#ddlFollowUpStatusMedia'),
        txtCampFollowUpDrugsNote = $('#txtCampFollowUpDrugsNote'),
        cbCampFollowUpDrugsIsClosed = $('#cbCampFollowUpDrugsIsClosed'),
        ddlPlanCampDrugs = $('#ddlPlanCampDrugs'),

        ddlPlanCampsManager = $('#ddlPlanCampsManager'),
        txtVisaDateMedia = $('#txtVisaDateMedia'),
        ddlPlanCampsMedia = $('#ddlPlanCampsMedia'),
        ddlTeam = $('#ddlTeam'),
        ddlSponsor = $('#ddlSponsor'),
        ddlCampStatus = $('#ddlCampStatus'),
        txtPlanConfigStartDate = $('#txtPlanConfigStartDate'),
        txtPlanConfigEndDate = $('#txtPlanConfigEndDate'),
        txtPlanConfigRemark = $('#txtPlanConfigRemark'),
        cbPreliminaryStatus = $('#cbPreliminaryStatus'),
        cbPlanConfigStatus = $('#cbPlanConfigStatus'),
        cbPlanConfigIsClosed = $('#cbPlanConfigIsClosed'),
        cbClearCache = $('#cbClearCache'),
        modalTable = $('#modalTable'),
        modalFollowUp = $('#modalFollowUp'),
        tblDataExists = $('#tblDataExistsCamps'),
        txtVisaDate = $('#txtVisaDate'),
        txtFinanceDate = $('#txtFinanceDate'),
        txtCampFollowUpDrugsDate = $('#txtCampFollowUpDrugsDate'),
        btnSave = document.getElementById('btnSave'),
        btnSearch = document.getElementById('btnSearch'),
        btnResetDrugs = document.getElementById('btnResetDrugs');
    //#endregion


    //#region validation 4-42020

    // Example starter JavaScript for disabling form submissions if there are invalid fields

    //intermediate invoked function expression IIFE
    /*
(function () {

    'use strict';
    window.addEventListener('load', function () {

        // Fetch all the forms we want to apply custom Bootstrap validation styles to

        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                    form.classList.add('was-validated');
                }
                else {
                    form.classList.add('was-validated');
                    event.preventDefault();
                    msgSaveOrCancel(function () {
                        addCampFollowUpDrug(function () {
                            let planConfigId = $.trim(ddlPlanCampDrugs.val()),
                                followUpStatusId = $.trim(ddlCampFollowUpDrugs.val()),
                                campFollowUpDrugsDate = $.trim(txtCampFollowUpDrugsDate.val()),
                                campFollowUpDrugsNote = $.trim(txtCampFollowUpDrugsNote.val());
                            uploadFileInClick(fuDrugsFollow, planConfigId, followUpStatusId, campFollowUpDrugsDate, campFollowUpDrugsNote);
                        });
                    });
                }
            }, false);
        });
    }, false);
})();
*/
    //#endregion



    //#region page function
    //#endregion
    $(function () {

        document.getElementById('btnSaveFollowupsDrug').addEventListener('click', function () {
            if (isValidDrug()) {
                msgSaveOrCancel(function () {
                    addCampFollowUpDrug(function () {
                        let planConfigId = $.trim(ddlPlanCampDrugs.val()),
                            followUpStatusId = $.trim(ddlCampFollowUpDrugs.val()),
                            campFollowUpDrugsDate = $.trim(txtCampFollowUpDrugsDate.val()),
                            campFollowUpDrugsNote = $.trim(txtCampFollowUpDrugsNote.val());
                        uploadFileInClick(fuDrugsFollow, planConfigId, followUpStatusId, campFollowUpDrugsDate, campFollowUpDrugsNote);
                    });


                });
            }
        });
        getAttachmentDrugdblClick();


        getFileInputjs(fuDrugsFollow, []);


        //fuDrugsFollow.hide();


        $('[data-toggle="tooltip"]').tooltip();
        //select 
        getSelect();


        getPlansFollowUp(ddlPlanCampDrugs, 2);

        getPlansFollowUp(ddlPlanCampsManager, 2);

        getFollowUpStatus(ddlCampFollowUpDrugs, true, '1');

        ddlPlanCampDrugs.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupdrugstbody').html('');
                fuDrugsFollow.fileinput('destroy');
                getFileInputjs(fuDrugsFollow, []);
                ddlCampFollowUpDrugs.val('');
                let followUpStatusId = ddlCampFollowUpDrugs.val() == '' ? null : ddlCampFollowUpDrugs.val(),
                    planConfigId = $(this).val();
                getCampFollowUpDrugById(planConfigId, followUpStatusId);
                getCampAllFollowUpDrugById(planConfigId, followUpStatusId);
            }
        });

        ddlCampFollowUpDrugs.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupdrugstbody').html('');
                let planConfigId = ddlPlanCampDrugs.val(),
                    followUpStatusId = $(this).val();
                getCampFollowUpDrugById(planConfigId, followUpStatusId);
                getCampAllFollowUpDrugById(planConfigId, followUpStatusId);
            }
        });



        //#region datetime picker
        getCalenderPicker(txtPlanConfigStartDate, txtPlanConfigEndDate);
        getCalender(txtVisaDate);

        getCalender(txtCampFollowUpDrugsDate);
        getCalender(txtVisaDateMedia);
        //#endregion

        //#region event


        btnResetDrugs.addEventListener('click', function () {
            fuDrugsFollow.fileinput('destroy');
            getFileInputjs(fuDrugsFollow, []);
            ddlPlanCampDrugs.select2().val('').trigger('change');
            getSelect();
            ddlCampFollowUpDrugs.val('');
        });


        //#endregion

    });



    //#region db

    let isValidDrug = function () {
        let isValid = false;
        if ($.trim(ddlPlanCampDrugs.val()) == '') {
            msgSuccess('اختر المخيم', 'تاكد من اختيار المخيم', 'error');
        }
        else if ($.trim(ddlCampFollowUpDrugs.val()) == '') {
            msgSuccess('مرحلة الأدوية', 'تاكد من اختيار مرحلة الأدوية للمخيم', 'error');
        }
        else if ($.trim(txtCampFollowUpDrugsDate.val()) == '') {
            msgSuccess('تاريخ المرحلة', 'تاكد من ادخال تاريخ اشعارات المرحلة', 'error');
        }
        else if ($.trim(txtCampFollowUpDrugsNote.val()) == '') {
            msgSuccess('ملاحظات المرحلة', 'تاكد من ادخال ملاحظات المرحلة', 'error');
        }
        else {
            isValid = true;
        }
        return isValid;

    };

    //get attachment
    function getDrugAttachments(id) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpDrug/DrugAttachments/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'AttachmentDrugId': id }
            ),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {

                loadingDiv.hide();
                //if (fuDrugsFollow.length < 0) {
                // getFileInputjs(fuDrugsFollow, []);
                //}
            },
            success: function (data) {
                //$('#fuDrugsFollow').fileinput('clear');
                fuDrugsFollow.fileinput('destroy');
                var imges = [];
                var fixedUrl = getUrl() + "/uploadfiles/";

                $.each(data, function (i, value) {
                    imges.push(fixedUrl + value.AttachmentName);
                });

                if (imges.length < 1) {
                    getFileInputjs(fuDrugsFollow, []);
                }
                else {
                    getFileInputjs(fuDrugsFollow, imges);

                }




                //getFileInputjs(fu, initial);

            },
            error: function (jqXHR) {
                if (jqXHR.status == '401') {
                    sessionStorage.removeItem('loginInfo');
                    window.location.href = "../Home/SignIn";
                }


            }
        });
    }
    function getAttachments() {
        $.ajax({
            url: getUrl() + '/basar/upload/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'AttachmentStatus': true }
            ),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {

                loadingDiv.hide();
            },
            success: function (data) {

                var imges = [];
                var fixedUrl = getUrl() + "/uploadfiles/";

                $.each(data, function (i, value) {
                    imges.push(fixedUrl + value.AttachmentName);
                });

                if (imges.length < 1) {
                    getFileInputjs(fuDrugsFollow, []);
                }
                else {
                    getFileInputjs(fuDrugsFollow, imges);
                }




                //getFileInputjs(fu, initial);

            },
            error: function (jqXHR) {
                if (jqXHR.status == '401') {
                    sessionStorage.removeItem('loginInfo');
                    window.location.href = "../Home/SignIn";
                }


            }
        });
    }


    function addCampFollowUpDrug(uploadFiles) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampDrugs.val()),

            FollowUpStatusId: $.trim(ddlCampFollowUpDrugs.val()),
            CampFollowUpDrugsDate: $.trim(txtCampFollowUpDrugsDate.val()),
            CampFollowUpDrugsNote: $.trim(txtCampFollowUpDrugsNote.val()),
            CampFollowUpDrugsStatus: true,
            CampFollowUpDrugsIsClosed: cbCampFollowUpDrugsIsClosed.is(":checked") == true
                ? true : cbCampFollowUpDrugsIsClosed.is(":not(:checked)") == false ? false : false//approach 1

        };
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpDrug/new',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: obj,
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {

                $('.campfollowupdrugstbody').html('');
                var planConfigId = ddlPlanCampDrugs.val(),
                    followUpStatusId = ddlCampFollowUpDrugs.val();
                getCampAllFollowUpDrugById(planConfigId, followUpStatusId);
                if (typeof uploadFiles == 'function') {
                    uploadFiles();
                }
                msgSuccess('تم ', 'الحفظ بنجاح', 'success');
                //if (typeof getData == 'function') {
                //    getData();
                //}

                //getMsg("#partialView", '../Home/SuccessMsg', '#successModalMsg', true);
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
                msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
            }
        });
    }


    let getCampAllFollowUpDrugById = function (planConfigId, followUpStatusId) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpDrug/GetAllById',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'PlanConfigId': planConfigId,
                    'FollowUpStatusId': followUpStatusId
                }
            ),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();

            },
            complete: function () {
                //select 
                //getSelect();
                loadingDiv.hide();

            },
            success: function (result) {
                let html = '';

                $.each(result, function (key, item) {
                    let isAttach,
                        trClass;
                    if (item.AttachmentDrugId == null) {
                        isAttach = '';
                        isAttach = '';
                    }
                    else {
                        isAttach = '<i class="fa fa-file-archive-o fa-2x"></i>';
                        trClass = 'tr-cursor';
                    }
                    html += `<tr class="${trClass}">`;
                    html += '<td>' + parseInt(key + 1) + '</td>';
                    html += `<td hidden class="attachmentdrugid" data-attachmentdrugid="${item.AttachmentDrugId}"> ${item.AttachmentDrugId}  </td>`;
                    html += '<td>' + getDateFromJsonTime(item.CampFollowUpDrugsDateIn) + '</td>';
                    html += '<td class="' + item.FollowUpStatusClassName + '">' + item.FollowUpStatusDescAR + '</td>';
                    html += '<td>' + getDateFromJson(item.CampFollowUpDrugsDate) + '</td>';
                    html += '<td>' + item.CampFollowUpDrugsNote + '</td>';
                    html += `<td> ${item.UserName}  </td>`;
                    html += `<td class="text-center"> ${isAttach} </td>`;
                    html += '</tr>';
                    $('.campfollowupdrugstbody').html(html);
                });

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };
    let getCampFollowUpDrugById = function (planConfigId, followUpStatusId) {
        clearCampFollowUpDrug();
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpDrug/GetById',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'PlanConfigId': planConfigId,
                    'FollowUpStatusId': followUpStatusId
                }
            ),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();

            },
            complete: function () {
                //select 
                getSelect();
                loadingDiv.hide();

            },
            success: function (data) {
                //ddlPlanCampDrugs.select2().val(planConfigId).trigger('change');
                ddlCampFollowUpDrugs.val(data.FollowUpStatusId);
                //ddlCampFollowUpDrugs.select2().val(data.FollowUpStatusId).trigger('change');

                txtCampFollowUpDrugsNote.val(data.CampFollowUpDrugsNote);
                txtCampFollowUpDrugsDate.val(getDateFromJson(data.CampFollowUpDrugsDate));

                data.CampFollowUpDrugsIsClosed === true ? cbCampFollowUpDrugsIsClosed.prop("checked", true) :
                    cbCampFollowUpDrugsIsClosed.prop("checked", false);

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };

    let clearCampFollowUpDrug = function () {
        txtCampFollowUpDrugsNote.val('');
        txtCampFollowUpDrugsDate.val('');

        cbCampFollowUpDrugsIsClosed.prop("checked", false);
    };

    //#endregion



    //#region helper

    let getAttachmentDrugdblClick = function () {
        $(document).on('dblclick', '#tblFollowupsDrug tbody tr', function () {
            let row = $(this).closest("tr");
            //console.log($(row).getElementsByTagName("td")[0].innerHTML);
            //console.log(myJSON = JSON.stringify(row));
            $(row).find("td.attachmentdrugid").each(function (i, value) {
                //document.getElementById("fuDrugsFollow").value = null;
                //$("#fuDrugsFollow").empty();
                //upload files
                //fuDrugsFollow.fadeToggle();
                getDrugAttachments($(this).text());
            });
        });
    };

    function onRowClick(tableId, callback) {
        var table = document.getElementById(tableId),
            rows = table.getElementsByTagName("tr"),
            i;
        for (i = 0; i < rows.length; i++) {
            table.rows[i].onclick = function (row) {
                return function () {
                    callback(row);
                };
            }(table.rows[i]);
        }
    }

    onRowClick("tblFollowupsDrug", function (row) {
        var value = row.getElementsByTagName("td")[0].innerHTML;
        //document.getElementById('click-response').innerHTML = value + " clicked!";
    });
    //#endregion
}