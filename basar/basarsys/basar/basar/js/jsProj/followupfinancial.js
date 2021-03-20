{
    //#region vars
    let inputfinance = $("#inputfinance"),
        loadingDiv = $('#loading'),
        ddlPlanCampsFinance = $('#ddlPlanCampsFinance'),
        ddlFollowUpStatusFinance = $('#ddlFollowUpStatusFinance'),
        txtCampFollowUpFinancialDate = $('#txtCampFollowUpFinancialDate'),
        txtCampFollowUpFinancialAmmount = $('#txtCampFollowUpFinancialAmmount'),
        txtCampFollowUpFinancialNote = $('#txtCampFollowUpFinancialNote'),
        cbCampFollowUpFinancialIsClosed = $('#cbCampFollowUpFinancialIsClosed'),

    //cbClearCache = $('#cbClearCache'),
    //modalTable = $('#modalTable'),
    //modalFollowUp = $('#modalFollowUp'),
    //tblDataExists = $('#tblDataExistsCamps'),
    //btnSave = document.getElementById('btnSave'),
    // btnSearch = document.getElementById('btnSearch'),
    btnResetFinancial = document.getElementById('btnResetFinancial');
    //#endregion

    //#region validation 4-42020

    // Example starter JavaScript for disabling form submissions if there are invalid fields

    //intermediate invoked function expression IIFE
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
                            addCampFollowUpFinancial(function () {
                                uploadFileInClickFollowupFinancial(inputfinance);
                                console.log("Saved");
                            });
                        });
                    }
                }, false);
            });
        }, false);
    })();

    //#endregion



    //#region page function
    //#endregion
    $(function () {

        getCalender(txtCampFollowUpFinancialDate);
        getFileInputjs(inputfinance);
        getPlansFollowUp(ddlPlanCampsFinance, 2);
        getFollowUpStatus(ddlFollowUpStatusFinance, true, '2');



        getAttachmentFinancialdblClick();
        //fuDrugsFollow.hide();


        ddlPlanCampsFinance.on('change', function () {
             if ($(this).val() != '') {
                 $('.campfollowupfinaincialtbody').html('');
                 inputfinance.fileinput('destroy');
                 getFileInputjs(inputfinance, []);
                // $(this).val('');
                 let followUpStatusId = ddlFollowUpStatusFinance.val() == '' ? null : ddlFollowUpStatusFinance.val(),
                     planConfigId = $(this).val();
                 getCampFollowUpFinancialById(planConfigId, followUpStatusId);
                 getCampAllFollowUpFinincialById(planConfigId, followUpStatusId);
             }
         });

        ddlFollowUpStatusFinance.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupfinaincialtbody').html('');
                inputfinance.fileinput('destroy');
                getFileInputjs(inputfinance, []);
                let planConfigId = ddlPlanCampsFinance.val(),
                    followUpStatusId = $(this).val();
                getCampFollowUpFinancialById(planConfigId, followUpStatusId);
                getCampAllFollowUpFinincialById(planConfigId, followUpStatusId);
            }
        });






        btnResetFinancial.addEventListener('click', function () {
            inputfinance.fileinput('destroy');
            getFileInputjs(inputfinance, []);
            ddlPlanCampsFinance.select2().val('').trigger('change');
            getSelect();
            ddlPlanCampsFinance.val('');
        });


        //#endregion

    });



    //#region db

    let addAttachmentFollowUpFinancial = function (attachmentName) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampsFinance.val()),
            FollowUpStatusId: $.trim(ddlFollowUpStatusFinance.val()),
            CampFollowUpFinancialDate: $.trim(txtCampFollowUpFinancialDate.val()),
            CampFollowUpFinancialNote: $.trim(txtCampFollowUpFinancialNote.val()),
            CampFollowUpFinancialAmmount: $.trim(txtCampFollowUpFinancialAmmount.val()),
            AttachmentName: attachmentName
        };

        $.ajax({
            url: getUrl() + '/basar/CampFollowUpFinancial/Attachment/Financial/New',
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
                console.log(data);
            },
            error: function (jqXHR) {
                //console.log(jqXHR.responseText);
                //msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
            }
        });
    };

    let uploadFileInClickFollowupFinancial = function (fu) {
        if (fu.val() != '') {

            var formData = new FormData();
            var file = fu[0];
            //single image
            formData.append('file', file.files[0]);
            //multi image
            for (var i = 0; i < file.files.length - 1; i++) {
                formData.append('file', file.files[i]);
            }

            $.ajax({
                //url: 'api/Upload/',
                url: getUrl() + '/basar/upload/',
                // url: getUrl() + '/basar/upload/Test',
                //url: '../Home/About',
                type: 'post',
                data: formData,
                contentType: false,
                processData: false,
                headers: {
                    'Authorization': 'Bearer '
                        + getAccessInfo().access_token
                },
                beforeSend(jqXHR) {
                    loadingDiv.show();
                },
                complete: function () {
                    loadingDiv.hide();
                },
                success: function (d) {
                    //var str = 'BodyPart_';
                    //single file
                    //$('#updatePanelFile').addClass('alert-success').append('<strong> Success! <a href="' + d + '" target="_blank" >Open File </a> </strong>').show();

                    //multi files
                    let initial = [];
                    $.each(d, function (i, value) {
                        addAttachmentFollowUpFinancial(
                            value.substring(value.lastIndexOf('/') + 1)
                        );
                        initial.push[value.substring(value.lastIndexOf('/')) + 1];
                        //$('#updatePanelFile').append('<strong> Success! <a href="' + value + '" target="_blank" >Open File </a> </strong> <br />');
                    });
                    getFileInputjs(fu, initial);
                },
                error: function (jqxhr) {
                    //console.log(jqxhr);
                }

            });
        }
    }

    //get attachment
    let getFinancialAttachment = function (id) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpFinancial/FinancialAttachment/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'AttachmentFinancialId': id }
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
                inputfinance.fileinput('destroy');
                var imges = [];
                var fixedUrl = getUrl() + "/uploadfiles/";

                $.each(data, function (i, value) {
                    imges.push(fixedUrl + value.AttachmentName);
                });

                if (imges.length < 1) {
                    getFileInputjs(inputfinance, []);
                }
                else {
                    getFileInputjs(inputfinance, imges);

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
    };
    function getAttachmentsFinancial() {
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
                    getFileInputjs(inputfinance, []);
                }
                else {
                    getFileInputjs(inputfinance, imges);
                }

            },
            error: function (jqXHR) {
                if (jqXHR.status == '401') {
                    sessionStorage.removeItem('loginInfo');
                    window.location.href = "../Home/SignIn";
                }


            }
        });
    }


    let addCampFollowUpFinancial = function (uploadFiles) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampsFinance.val()),
            FollowUpStatusId: $.trim(ddlFollowUpStatusFinance.val()),
            CampFollowUpFinancialDate: $.trim(txtCampFollowUpFinancialDate.val()),
            CampFollowUpFinancialNote: $.trim(txtCampFollowUpFinancialNote.val()),
            CampFollowUpFinancialAmmount: $.trim(txtCampFollowUpFinancialAmmount.val()),
            CampFollowUpFinancialStatus: true,
            CampFollowUpFinancialIsClosed: cbCampFollowUpFinancialIsClosed.is(":checked") == true
                ? true : cbCampFollowUpFinancialIsClosed.is(":not(:checked)") == false ? false : false//approach 1

        };
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpFinancial/new',
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

                /* $('.campfollowupdrugstbody').html('');
                 var planConfigId = ddlPlanCampDrugs.val(),
                     followUpStatusId = ddlCampFollowUpDrugs.val();
                 getCampAllFollowUpDrugById(planConfigId, followUpStatusId);*/
                if (typeof uploadFiles == 'function') {
                    uploadFiles();
                }
                msgSuccess('تم ', 'الحفظ بنجاح', 'success');
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
                msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
            }
        });
    };


    let getCampAllFollowUpFinincialById = function (planConfigId, followUpStatusId) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpFinancial/GetAllById',
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
                    if (item.AttachmentFinancialId == null) {
                        isAttach = '';
                        isAttach = '';
                    }
                    else {
                        isAttach = '<i class="fa fa-file-archive-o fa-2x"></i>';
                        trClass = 'tr-cursor';
                    }
                    html += `<tr class="${trClass}">`;
                    html += '<td>' + parseInt(key + 1) + '</td>';
                    html += `<td hidden class="attachmentfinancialid" data-attachmentfinancialid="${item.AttachmentFinancialId}"> ${item.AttachmentFinancialId}  </td>`;
                    html += '<td>' + getDateFromJsonTime(item.CampFollowUpFinancialDateIn) + '</td>';
                    html += '<td class="' + item.FollowUpStatusClassName + '">' + item.FollowUpStatusDescAR + '</td>';
                    html += '<td>' + getDateFromJson(item.CampFollowUpFinancialDate) + '</td>';
                    html += '<td>' + item.CampFollowUpFinancialNote + '</td>';
                    html += '<td>' + item.CampFollowUpFinancialAmmount + '</td>';
                    html += `<td> ${item.UserName}  </td>`;
                    html += `<td class="text-center"> ${isAttach} </td>`;
                    html += '</tr>';
                    $('.campfollowupfinaincialtbody').html(html);
                });

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };
    let getCampFollowUpFinancialById = function (planConfigId, followUpStatusId) {
        clearCampFollowUpFinancial();
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpFinancial/GetById',
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
            success: function (data) {
                //ddlPlanCampDrugs.select2().val(planConfigId).trigger('change');
                ddlPlanCampsFinance.val(data.FollowUpStatusId);
                //ddlCampFollowUpDrugs.select2().val(data.FollowUpStatusId).trigger('change');

                txtCampFollowUpFinancialNote.val(data.CampFollowUpFinancialNote);
                txtCampFollowUpFinancialDate.val(getDateFromJson(data.CampFollowUpFinancialDate));
                txtCampFollowUpFinancialAmmount.val(getDateFromJson(data.CampFollowUpFinancialAmmount));

                data.CampFollowUpFinancialIsClosed === true ? cbCampFollowUpFinancialIsClosed.prop("checked", true) :
                    cbCampFollowUpFinancialIsClosed.prop("checked", false);

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };

    let clearCampFollowUpFinancial = function () {
        txtCampFollowUpFinancialNote.val('');
        txtCampFollowUpFinancialDate.val('');
        txtCampFollowUpFinancialAmmount.val('');

        cbCampFollowUpFinancialIsClosed.prop("checked", false);
    };

    //#endregion



    //#region helper

    let getAttachmentFinancialdblClick = function () {
        $(document).on('dblclick', '#tblFollowupFinancial tbody tr', function () {
            let row = $(this).closest("tr");
            //console.log($(row).getElementsByTagName("td")[0].innerHTML);
            //console.log(myJSON = JSON.stringify(row));
            $(row).find("td.attachmentfinancialid").each(function (i, value) {
                //document.getElementById("fuDrugsFollow").value = null;
                //$("#fuDrugsFollow").empty();
                //upload files
                //fuDrugsFollow.fadeToggle();
                getFinancialAttachment($(this).text());
                console.log($(this).text());
            });
        });
    };

    let onRowClick = function (tableId, callback) {
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
    };

    /*
    onRowClick("tblFollowupsDrug", function (row) {
        var value = row.getElementsByTagName("td")[0].innerHTML;
        //document.getElementById('click-response').innerHTML = value + " clicked!";
    });*/
    //#endregion
}