{
    //#region vars
    let inputmedia = $("#inputmedia"),
        loadingDiv = $('#loading'),
        ddlPlanCampsMedia = $('#ddlPlanCampsMedia'),
        ddlFollowUpStatusMedia = $('#ddlFollowUpStatusMedia'),
        txtVisaDateMedia = $('#txtVisaDateMedia'),
        txtCampFollowUpMediaDropboxLink = $('#txtCampFollowUpMediaDropboxLink'),
        cbCampFollowUpMediaIsClosed = $('#cbCampFollowUpMediaIsClosed'),
        txtCampFollowUpMediaNote = $('#txtCampFollowUpMediaNote');

    //#endregion


    //#endregion
    $(function () {

        document.getElementById('btnSaveMedia').addEventListener('click', function () {
            if (isValidMedia) {
                msgSaveOrCancel(function () {
                    addCampFollowUpMedia(function () {
                        uploadFileInClickFollowupMedia(inputmedia);
                        console.log("Saved");
                    });
                });
            }
        });


        getCalender(txtVisaDateMedia);

        getFileInputjs(inputmedia);
        getPlansFollowUp(ddlPlanCampsMedia, 2);
        getFollowUpStatus(ddlFollowUpStatusMedia, true, '4');



        getAttachmentMediadblClick();


        ddlPlanCampsMedia.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupmediatbody').html('');
                inputmedia.fileinput('destroy');
                getFileInputjs(inputmedia, []);
                // $(this).val('');
                let followUpStatusId = ddlFollowUpStatusMedia.val() == '' ? null : ddlFollowUpStatusMedia.val(),
                    planConfigId = $(this).val();
                getCampFollowUpMediaById(planConfigId, followUpStatusId);
                getCampAllFollowUpMediaById(planConfigId, followUpStatusId);
            }
        });

        ddlFollowUpStatusMedia.on('change', function () {
            if ($(this).val() != '') {
                $('.campfollowupmediatbody').html('');
                inputmedia.fileinput('destroy');
                getFileInputjs(inputmedia, []);
                let planConfigId = ddlPlanCampsMedia.val(),
                    followUpStatusId = $(this).val();
                getCampFollowUpMediaById(planConfigId, followUpStatusId);
                getCampAllFollowUpMediaById(planConfigId, followUpStatusId);
            }
        });






        document.getElementById('btnResetMedia').addEventListener('click', function () {
            inputmedia.fileinput('destroy');
            getFileInputjs(inputmedia, []);
            ddlPlanCampsMedia.select2().val('').trigger('change');
            getSelect();
            ddlFollowUpStatusMedia.val('');
        });


        //#endregion

    });



    //#region db

    let isValidMedia = function () {
        let isValid = false;
        if ($.trim(ddlPlanCampsMedia.val()) == '') {
            msgSuccess('اختر المخيم', 'تاكد من اختيار المخيم', 'error');
        }
        else if ($.trim(ddlFollowUpStatusMedia.val()) == '') {
            msgSuccess('المتابعة الاعلامية', 'تاكد من اختيار مرحلة المتابعة الاعلامية للمخيم', 'error');
        }
        else if ($.trim(txtVisaDateMedia.val()) == '') {
            msgSuccess('المتابعة الاعلامية', 'تاكد من ادخال تاريخ اشعارات المرحلة', 'error');
        }
        else if ($.trim(txtCampFollowUpMediaNote.val()) == '') {
            msgSuccess('المتابعة الاعلامية', 'تاكد من ادخال ملاحظات المرحلة', 'error');
        }
        else if ($.trim(txtCampFollowUpMediaDropboxLink.val()) == '') {
            msgSuccess('المتابعة الاعلامية', 'تاكد من ادخال الرابط', 'error');
        }
        else {
            isValid = true;
        }
        return isValid;

    };


    let addAttachmentFollowUpMedia = function (attachmentName) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampsMedia.val()),
            FollowUpStatusId: $.trim(ddlFollowUpStatusMedia.val()),
            CampFollowUpMediaDate: $.trim(txtVisaDateMedia.val()),
            CampFollowUpMediaNote: $.trim(txtCampFollowUpMediaNote.val()),
            CampFollowUpMediaDropboxLink: $.trim(txtCampFollowUpMediaDropboxLink.val()),
            CampFollowUpMediaIsClosed: cbCampFollowUpMediaIsClosed.prop('checked'),
            AttachmentName: attachmentName
        };

        $.ajax({
            url: getUrl() + '/basar/CampFollowUpMedia/Attachment/Media/New',
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

    let uploadFileInClickFollowupMedia = function (fu) {
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
                    let initial = [];
                    $.each(d, function (i, value) {
                        addAttachmentFollowUpMedia(
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
    let geMediaAttachment = function (id) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpMedia/MediaAttachment/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'AttachmentMediaId': id }
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
                inputmedia.fileinput('destroy');
                var imges = [];
                var fixedUrl = getUrl() + "/uploadfiles/";

                $.each(data, function (i, value) {
                    imges.push(fixedUrl + value.AttachmentName);
                });

                if (imges.length < 1) {
                    getFileInputjs(inputmedia, []);
                }
                else {
                    getFileInputjs(inputmedia, imges);

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
    let addCampFollowUpMedia = function (uploadFiles) {
        let obj = {
            PlanConfigId: $.trim(ddlPlanCampsMedia.val()),
            FollowUpStatusId: $.trim(ddlFollowUpStatusMedia.val()),
            CampFollowUpMediaDate: $.trim(txtVisaDateMedia.val()),
            CampFollowUpMediaNote: $.trim(txtCampFollowUpMediaNote.val()),
            CampFollowUpMediaDropboxLink: $.trim(txtCampFollowUpMediaDropboxLink.val()),
            CampFollowUpMediaStatus: true,
            CampFollowUpMediaIsClosed: cbCampFollowUpMediaIsClosed.is(":checked") == true
                ? true : cbCampFollowUpMediaIsClosed.is(":not(:checked)") == false ? false : false,//approach 1

        };
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpMedia/new',
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
                 var planConfigId = ddlPlanCampsMedia.val(),
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


    let getCampAllFollowUpMediaById = function (planConfigId, followUpStatusId) {
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpMedia/GetAllById',
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
                        isClosed,
                        linkURL,
                        trClass;
                    if (item.AttachmentMediaId == null) {
                        isAttach = '';
                        isAttach = '';
                    }
                    else {
                        isAttach = '<i class="fa fa-file-archive-o fa-3x"></i>';
                        trClass = 'tr-cursor';
                    }
                    if (item.CampFollowUpMediaIsClosed) {
                        isClosed = '<i class="fa fa-pencil-square-o fa-3x" data-toggle="tooltip" title="تم الانتهاء من المرحلة"></i>';
                    }
                    else {
                        isClosed = '<i class="fa fa-history fa-3x" data-toggle="tooltip" title="المرحلة تحت التعديل"></i>';
                    }
                    if (item.CampFollowUpMediaDropboxLink != '') {
                        linkURL = `<a href="${item.CampFollowUpMediaDropboxLink}" data-toggle="tooltip" title="رابط الدروب بوكس" target="_blank"> <i class="fa fa-external-link fa-3x"></i></a>`;
                    }
                    else {
                        linkURL = '';
                    }
                    //

                    html += `<tr class="${trClass}">`;
                    html += '<td>' + isClosed + ' ' +  parseInt(key + 1) + '</td>';
                    html += `<td hidden class="attachmentmediaid" data-attachmentmediaid="${item.AttachmentMediaId}"> ${item.AttachmentMediaId}  </td>`;
                    html += '<td>' + getDateFromJsonTime(item.CampFollowUpMediaDateIn) + '</td>';
                    html += '<td class="' + item.FollowUpStatusClassName + '">' + item.FollowUpStatusDescAR + '</td>';
                    html += '<td>' + getDateFromJson(item.CampFollowUpMediaDate) + '</td>';
                    html += '<td>' + item.CampFollowUpMediaNote + '</td>';
                    html += `<td> ${item.UserName}  </td>`;
                  
                    html += `<td class="text-center"> ${linkURL}  ${isAttach} </td>`;
                    html += '</tr>';
                    $('.campfollowupmediatbody').html(html);
                });

            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };
    let getCampFollowUpMediaById = function (planConfigId, followUpStatusId) {
        clearCampFollowUpMedia();
        $.ajax({
            url: getUrl() + '/basar/CampFollowUpMedia/GetById',
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
                //ddlPlanCampsMedia.select2().val(planConfigId).trigger('change');
                ddlFollowUpStatusMedia.val(data.FollowUpStatusId);
                //ddlCampFollowUpDrugs.select2().val(data.FollowUpStatusId).trigger('change');

                txtCampFollowUpMediaNote.val(data.CampFollowUpMediaNote);
                txtCampFollowUpMediaDropboxLink.val(data.CampFollowUpMediaDropboxLink);
                txtVisaDateMedia.val(getDateFromJson(data.CampFollowUpMediaDate));

                data.CampFollowUpMediaIsClosed === true ? cbCampFollowUpMediaIsClosed.prop("checked", true) :
                    cbCampFollowUpMediaIsClosed.prop("checked", false);


            },
            error: function (jqXHR) {
                if (jqXHR.status) {
                    console.log('not found');
                }

            }
        });
    };

    let clearCampFollowUpMedia = function () {
        txtCampFollowUpMediaNote.val('');
        txtVisaDateMedia.val('');
        txtCampFollowUpMediaDropboxLink.val('');

        cbCampFollowUpMediaIsClosed.prop("checked", false);

    };

    //#endregion



    //#region helper

    let getAttachmentMediadblClick = function () {
        $(document).on('dblclick', '#tblFollowupMedia tbody tr', function () {
            let row = $(this).closest("tr");
            $(row).find("td.attachmentmediaid").each(function (i, value) {
                geMediaAttachment($(this).text());

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