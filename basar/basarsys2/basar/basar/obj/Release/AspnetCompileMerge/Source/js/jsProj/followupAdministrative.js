{
    //#region vars
    let inputmanager = $("#inputmanager"),
        loadingDiv = $('#loading'),
        ddlPlanCampsManager = $('#ddlPlanCampsManager'),
        ddlFollowUpStatusManager = $('#ddlFollowUpStatusManager'),
        txtVisaDate = $('#txtVisaDate'),
        cbCampFollowUpAdministrativeIsSignature = $('#cbCampFollowUpAdministrativeIsSignature'),
        cbCampFollowUpAdministrativeIsClosed = $('#cbCampFollowUpAdministrativeIsClosed'),
        txtCampFollowUpAdministrativeNote = $('#txtCampFollowUpAdministrativeNote');

    //#endregion

    //#region validation 4-42020

    // Example starter JavaScript for disabling form submissions if there are invalid fields

    //intermediate invoked function expression IIFE
    /*(function () {

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
                                uploadFileInClickFollowupFinancial(inputmanager);
                                console.log("Saved");
                            });
                        });
                    }
                }, false);
            });
        }, false);
    })();*/

    //#endregion



    //#region page function
    //#endregion
    $(function () {

        document.getElementById('btnSaveAdministrative').addEventListener('click', function () {
            if (isValidAdministrative) {
                msgSaveOrCancel(function () {
                    addCampFollowUpAdministrative(function () {
                        uploadFileInClickFollowupAdministrative(inputmanager);
                        console.log("Saved");
                    });
                });
            }
        });


        getCalender(txtVisaDate);

        getFileInputjs(inputmanager);
        getPlansFollowUp(ddlPlanCampsManager, 2);
        getFollowUpStatus(ddlFollowUpStatusManager, true, '3');



        getAttachmentAdministrativedblClick();
        //fuDrugsFollow.hide();


        ddlPlanCampsManager.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupadministrativetbody').html('');
                inputmanager.fileinput('destroy');
                getFileInputjs(inputmanager, []);
                // $(this).val('');
                let followUpStatusId = ddlFollowUpStatusManager.val() == '' ? null : ddlFollowUpStatusManager.val(),
                    planConfigId = $(this).val();
                getCampFollowUpAdministrativeById(planConfigId, followUpStatusId);
                getCampAllFollowUpAdministrativeById(planConfigId, followUpStatusId);
            }
        });

        ddlFollowUpStatusManager.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupadministrativetbody').html('');
                inputmanager.fileinput('destroy');
                getFileInputjs(inputmanager, []);
                let planConfigId = ddlPlanCampsManager.val(),
                    followUpStatusId = $(this).val();
                getCampFollowUpAdministrativeById(planConfigId, followUpStatusId);
                getCampAllFollowUpAdministrativeById(planConfigId, followUpStatusId);
            }
        });






        document.getElementById('btnResetAdministrative').addEventListener('click', function () {
            inputmanager.fileinput('destroy');
            getFileInputjs(inputmanager, []);
            ddlPlanCampsManager.select2().val('').trigger('change');
            getSelect();
            ddlFollowUpStatusManager.val('');
        });


        //#endregion

    });



    //#region db

    let isValidAdministrative = function () {
        let isValid = false;
        if ($.trim(ddlPlanCampsManager.val()) == '') {
            msgSuccess('اختر المخيم', 'تاكد من اختيار المخيم', 'error');
        }
        else if ($.trim(ddlFollowUpStatusManager.val()) == '') {
            msgSuccess('المتابعة الادارية', 'تاكد من اختيار مرحلة المتابعة الادارية للمخيم', 'error');
        }
        else if ($.trim(txtVisaDate.val()) == '') {
            msgSuccess('المتابعة الادارية', 'تاكد من ادخال تاريخ اشعارات المرحلة', 'error');
        }
        else if ($.trim(txtCampFollowUpAdministrativeNote.val()) == '') {
            msgSuccess('المتابعة الادارية', 'تاكد من ادخال ملاحظات المرحلة', 'error');
        }
        else {
            isValid = true;
        }
        return isValid;

    };


    let addAttachmentFollowUpAdministrative = function (attachmentName) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampsManager.val()),
            FollowUpStatusId: $.trim(ddlFollowUpStatusManager.val()),
            CampFollowUpAdministrativeDate: $.trim(txtVisaDate.val()),
            CampFollowUpAdministrativeNote: $.trim(txtCampFollowUpAdministrativeNote.val()),
            CampFollowUpAdministrativeIsClosed: cbCampFollowUpAdministrativeIsClosed.prop('checked'),
            CampFollowUpAdministrativeIsSignature: cbCampFollowUpAdministrativeIsSignature.prop('checked'),
            AttachmentName: attachmentName
        };

        $.ajax({
            url: getUrl() + '/basar/CampFollowUpAdministrative/Attachment/Administrative/New',
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

            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
                //msgSuccess('خطأ', 'خطأ في الاتصال ', 'error');
            }
        });
    };

    let uploadFileInClickFollowupAdministrative = function (fu) {
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
                        addAttachmentFollowUpAdministrative(
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
    };

    //get attachment
    let getAdministrativeAttachment = function (id) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpAdministrative/AdministrativeAttachment/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'AttachmentAdministrativeId': id }
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
                inputmanager.fileinput('destroy');
                var imges = [];
                var fixedUrl = getUrl() + "/uploadfiles/";

                $.each(data, function (i, value) {
                    imges.push(fixedUrl + value.AttachmentName);
                });

                if (imges.length < 1) {
                    getFileInputjs(inputmanager, []);
                }
                else {
                    getFileInputjs(inputmanager, imges);

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

    /* remove
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
                    getFileInputjs(inputmanager, []);
                }
                else {
                    getFileInputjs(inputmanager, imges);
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
    */

    let addCampFollowUpAdministrative = function (uploadFiles) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampsManager.val()),
            FollowUpStatusId: $.trim(ddlFollowUpStatusManager.val()),
            CampFollowUpAdministrativeDate: $.trim(txtVisaDate.val()),
            CampFollowUpAdministrativeNote: $.trim(txtCampFollowUpAdministrativeNote.val()),
            CampFollowUpAdministrativeStatus: true,
            CampFollowUpAdministrativeIsClosed: cbCampFollowUpAdministrativeIsClosed.is(":checked") == true
                ? true : cbCampFollowUpAdministrativeIsClosed.is(":not(:checked)") == false ? false : false,//approach 1
            CampFollowUpAdministrativeIsSignature: cbCampFollowUpAdministrativeIsSignature.is(":checked") == true
                ? true : cbCampFollowUpAdministrativeIsSignature.is(":not(:checked)") == false ? false : false//approach 1

        };
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpAdministrative/new',
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
                 var planConfigId = ddlPlanCampsManager.val(),
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


    let getCampAllFollowUpAdministrativeById = function (planConfigId, followUpStatusId) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpAdministrative/GetAllById',
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
                        signature,
                        trClass;
                    if (item.AttachmentAdministrativeId == null) {
                        isAttach = '';
                        isAttach = '';
                    }
                    else {
                        isAttach = '<i class="fa fa-file-archive-o fa-2x"></i>';
                        trClass = 'tr-cursor';
                    }
                    if (item.CampFollowUpAdministrativeIsSignature) {
                        signature = '<i class="fa fa-pencil-square-o fa-2x" data-toggle="tooltip" title="تم توقيع العقد"></i>';
                    }
                    else {
                        signature = '<i class="fa fa-history fa-2x" data-toggle="tooltip" title="لم يتم توقيع العقد"></i>';
                    }
                    //

                    html += `<tr class="${trClass}">`;
                    html += '<td>' + parseInt(key + 1) + '</td>';
                    html += `<td hidden class="attachmentadministrativeid" data-attachmentadministrativeid="${item.AttachmentAdministrativeId}"> ${item.AttachmentAdministrativeId}  </td>`;
                    html += '<td>' + getDateFromJsonTime(item.CampFollowUpAdministrativeDateIn) + '</td>';
                    html += '<td class="' + item.FollowUpStatusClassName + '">' + item.FollowUpStatusDescAR + '</td>';
                    html += '<td>' + getDateFromJson(item.CampFollowUpAdministrativeDate) + '</td>';
                    html += '<td>' + item.CampFollowUpAdministrativeNote + '</td>';
                    html += '<td>' + signature + '</td>';
                    html += `<td> ${item.UserName}  </td>`;
                    html += `<td class="text-center"> ${isAttach} </td>`;
                    html += '</tr>';
                    $('.campfollowupadministrativetbody').html(html);
                });

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };
    let getCampFollowUpAdministrativeById = function (planConfigId, followUpStatusId) {
        clearCampFollowUpAdministrative();
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpAdministrative/GetById',
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
                //ddlPlanCampsManager.select2().val(planConfigId).trigger('change');
                ddlFollowUpStatusManager.val(data.FollowUpStatusId);
                //ddlCampFollowUpDrugs.select2().val(data.FollowUpStatusId).trigger('change');

                txtCampFollowUpAdministrativeNote.val(data.CampFollowUpAdministrativeNote);
                txtVisaDate.val(getDateFromJson(data.CampFollowUpAdministrativeDate));

                data.CampFollowUpAdministrativeIsClosed === true ? cbCampFollowUpAdministrativeIsClosed.prop("checked", true) :
                    cbCampFollowUpAdministrativeIsClosed.prop("checked", false);
                data.CampFollowUpAdministrativeIsSignature === true ? cbCampFollowUpAdministrativeIsSignature.prop("checked", true) :
                    cbCampFollowUpAdministrativeIsSignature.prop("checked", false);

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };

    let clearCampFollowUpAdministrative = function () {
        txtCampFollowUpAdministrativeNote.val('');
        txtVisaDate.val('');
        cbCampFollowUpAdministrativeIsClosed.prop("checked", false);
        cbCampFollowUpAdministrativeIsSignature.prop("checked", false);
    };

    //#endregion



    //#region helper

    let getAttachmentAdministrativedblClick = function () {
        $(document).on('dblclick', '#tblFollowupAdministrative tbody tr', function () {
            let row = $(this).closest("tr");
            //console.log($(row).getElementsByTagName("td")[0].innerHTML);
            //console.log(myJSON = JSON.stringify(row));
            $(row).find("td.attachmentadministrativeid").each(function (i, value) {
                //document.getElementById("fuDrugsFollow").value = null;
                //$("#fuDrugsFollow").empty();
                //upload files
                //fuDrugsFollow.fadeToggle();
                getAdministrativeAttachment($(this).text());
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