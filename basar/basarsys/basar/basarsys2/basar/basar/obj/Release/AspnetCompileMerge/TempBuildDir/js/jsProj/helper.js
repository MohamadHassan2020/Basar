{
    let ddlPlanConfigYear = $('#ddlPlanConfigYear'),
        ddlCountry = $('#ddlCountry'),
        loadingDiv = $('#loading'),
        changePasswordModal = $('#changePasswordModal'),
        avatar = $('.avatar'),
        aChangePwd = document.getElementById('aChangePwd'),
        btnChangePassword = document.getElementById('btnChangePassword'),
        logOut = $('a[data-event="logout"]');

    $(function () {
        //Log Out
        //console.log('a' + avatar.length);
        //avatar.text("Test");
        //$('[data-toggle="tooltip"]').tooltip();
        $("body").tooltip({
            selector: '[data-toggle=tooltip]',
            'data-placement': "bottom"
        });
        checkAuth();
        if (logOut.length > 0) {
            $('.username').append(getAccessInfo().userName);
            aChangePwd.addEventListener('click', function () {
                changePasswordModal.modal('show');
            });
            //change user password

            btnChangePassword.addEventListener('click', function () {
                msgSaveOrCancel(changeUserPassword);
            });

            logOut.on('click', function () {
                loadingDiv.show();
                sessionStorage.removeItem('planconfigid');
                sessionStorage.removeItem('loginInfo');//localStorage
                setTimeout(function () { window.location.href = "../Home/SignIn"; }, 200);
                loadingDiv.hide();
            });
        }
    });

    //#region admin db

    //function uploadFiles

    //fu==fileupload 7-6-2020
    function uploadFileInClick(fu, planConfigId, followUpStatusId, campFollowUpDrugsDate, campFollowUpDrugsNote) {
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
                        addAttachmentDrug(planConfigId, followUpStatusId, campFollowUpDrugsDate, campFollowUpDrugsNote,
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


    function uploadFileInClickFollowup(fu,  obj,url) {
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
                        addAttachmentFollowUp(obj,url,
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


    //#region add attachment

    function getSponsorShip(ddl, id) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('إسم المتبرع'));
        $.ajax({
            url: getUrl() + '/basar/SponsorShip/all',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'SponsorId': id }
            ),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.SponsorShipId,
                        text: item.SponsorShipName
                    }));
                });
            },
            complete: function () {
                loadingDiv.hide();
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }


    let addAttachmentDrug = function (planConfigId, followUpStatusId, campFollowUpDrugsDate, campFollowUpDrugsNote, attachmentName) {
        let obj = {
            PlanConfigId: planConfigId,

            FollowUpStatusId: followUpStatusId,
            CampFollowUpDrugsDate: campFollowUpDrugsDate,
            CampFollowUpDrugsNote: campFollowUpDrugsNote,
            AttachmentName: attachmentName

        };

        $.ajax({
            url: getUrl() + '/basar/CampFollowUpDrug/Attachment/Drug/New',
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

    //
    //#endregion


    //#region users
    function changeUserPassword() {

        let myUser = {
            oldPassword: $('#txtOldPassword').val(),
            newPassword: $('#txtNewPassword').val(),
            confirmPassword: $('#txtConfirmPassword').val()
        };
        $.ajax({
            url: getUrl() + '/api/account/ChangePassword',
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',//الترتيب مهم جدا في ارجاع الصلاحية
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: myUser,
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function () {
                msgSuccess('تم ', 'تغيير كلمة المرور', 'success');

            },
            error: function (jqXHR) {
                msgSuccess('خطا', 'تأكد من الاتصال', 'error');
            }
        });
        console.log(myUser);
    }
    //#endregion
    //#region   datatable

    function getDataTable(table, url, columns) {
        $(table).DataTable({
            ajax: {
                type: "GET",
                url: url,
                headers: {
                    'Authorization': 'Bearer '
                        + getAccessInfo().access_token
                },
                datatype: "JSON",
                dataSrc: "",
                beforeSend(jqXHR) {
                    loadingDiv.show();
                },
                complete: function () {
                    loadingDiv.hide();
                },
                error: function (jqXHR) {
                    console.log(jqXHR.responseText);
                }
            },
            "columns": columns,
            "language": getDataTableArabic(),
            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "الكل"] // change per page values here
            ],
            "processing": true,
            "pageLength": 20,
            "pagingType": "full_numbers",
            "autoWidth": false,
            "retrieve": true
        });
    }
    function getDataTableByData(table, url, columns, myData) {
        $(table).DataTable({

            ajax: {
                type: "POST",
                url: url,
                headers: {
                    'Authorization': 'Bearer '
                        + getAccessInfo().access_token
                },
                //contentType: "application/json;charset=UTF-8",
                data: myData,
                datatype: "JSON",
                dataSrc: "",
                beforeSend(jqXHR) {
                    loadingDiv.show();

                },
                complete: function () {
                    loadingDiv.hide();
                },
                error: function (jqXHR) {
                    if (jqXHR.status == '401') {
                        sessionStorage.removeItem('loginInfo');
                        window.location.href = "../Home/SignIn";
                    }
                }
            },
            "columns": columns,
            "language": getDataTableArabic(),
            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "الكل"] // change per page values here
            ],
            "processing": true,
            "pageLength": 20,
            "pagingType": "full_numbers",
            "autoWidth": false,
            'destroy': true,
            'searching': true
        });
    }


    //#endregion   datatable

    //#region 2-6-2020-4-2020

    function getRoleByRoleGroup(roleGroupId) {
        $.ajax({
            url: getUrl() + '/basar/roles/GetByRoleGroup',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'RoleGroupId': roleGroupId
                }
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
                //$(data).each(function (index, item) {
                //    $(ddl).append($('<option/>', {
                //        value: item.RoleDividerId,
                //        text: item.RoleDividerDescAR
                //    }));
                //});
                $('#chkRolesContainer').empty();
                let content = '';
                content += '<div class="row">';
                $.each(data, function (index, value) {

                    //var clsName = '';
                    //if (value.IsRestrict == true) {
                    //    clsName = 'isrestrict';
                    //}
                    //content += '<label class="col-form-label mr-3">';
                    //content += '<input type="checkbox" checked class="checkbox mr-1" title="' + value.RoleDescEN + '" id="cbRole' + index + '' + index + '" value="' + value.Id + '" />' + value.RoleDescAR + '';
                    //content += '</label>';

                    content += '<div class="col-sm-4">';
                    content += '<div class="form-group">';
                    content += '<div class="custom-control custom-checkbox">';
                    content += '<input type="checkbox" class="custom-control-input" checked value="' + value.RoleId + '" id="cbRole' + index + '"/>';
                    content += '<label class="custom-control-label text-primary" for="cbRole' + index + '"> ' + value.RoleDescAR + '</label>';
                    content += '</div>';
                    content += '</div>';
                    content += '</div>';
                });

                content += '</div>';
                $('#chkRolesContainer').html(content);
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getRoleByRoleDividerId(roleDividerId) {
        $.ajax({
            url: getUrl() + '/basar/roles/GetByRoleDividerId',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'RoleDividerId': roleDividerId
                }
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
                //$(data).each(function (index, item) {
                //    $(ddl).append($('<option/>', {
                //        value: item.RoleDividerId,
                //        text: item.RoleDividerDescAR
                //    }));
                //});
                $('#chkRolesContainer').empty();
                let content = '';
                content += '<div class="row">';
                $.each(data, function (index, value) {

                    //var clsName = '';
                    //if (value.IsRestrict == true) {
                    //    clsName = 'isrestrict';
                    //}
                    //content += '<label class="col-form-label mr-3">';
                    //content += '<input type="checkbox" checked class="checkbox mr-1" title="' + value.RoleDescEN + '" id="cbRole' + index + '' + index + '" value="' + value.Id + '" />' + value.RoleDescAR + '';
                    //content += '</label>';

                    content += '<div class="col-sm-4">';
                    content += '<div class="form-group">';
                    content += '<div class="custom-control custom-checkbox">';
                    content += '<input type="checkbox" class="custom-control-input" checked value="' + value.Id + '" id="cbRole' + index + '"/>';
                    content += '<label class="custom-control-label text-primary" for="cbRole' + index + '"> ' + value.RoleDescAR + '</label>';
                    content += '</div>';
                    content += '</div>';
                    content += '</div>';
                });

                content += '</div>';
                $('#chkRolesContainer').html(content);
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getRoleGroup(ddl, status) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('مجموعة الصلاحية'));
        $.ajax({
            url: getUrl() + '/basar/RoleGroup/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'UserStatus': status
                }
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
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.RoleGroupId,
                        text: item.RoleGroupDescAR
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getUsers(ddl, status) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('إسم المستخدم'));
        $.ajax({
            url: getUrl() + '/Basar/UserHelper/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'UserStatus': status
                }
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
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.Id,
                        text: item.UserName
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getRoleDivider(ddl, status) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('فئة الصلاحية'));
        $.ajax({
            url: getUrl() + '/basar/RoleDivider/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'RoleDividerStatus': status
                }
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
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.RoleDividerId,
                        text: item.RoleDividerDescAR
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getFollowUpStatus(ddl, status, divider) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('المرحلة'));
        $.ajax({
            url: getUrl() + '/basar/FollowUpStatus/Get',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                {
                    'FollowUpStatusEnabled': status,
                    'FollowUpStatusDivider': divider

                }
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
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.FollowUpStatusId,
                        text: item.FollowUpStatusDescAR
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getCampStatus(ddl) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('حالة المخيم'));
        $.ajax({
            url: getUrl() + '/basar/campstatus',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },

            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.CampStatusId,
                        text: item.CampStatusDescAR
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }

    function getSponsors(ddl) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('الراعي'));
        $.ajax({
            url: getUrl() + '/basar/sponsors',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },

            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.SponsorId,
                        text: item.SponsorDsecAr
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getTeams(ddl) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('الفريق'));
        $.ajax({
            url: getUrl() + '/basar/teams',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },

            //contentType: "application/json;charset=UTF-8", //ONLY POST
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.TeamId,
                        text: ' ' + item.TeamDsecAr
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }

    function getPlansFollowUp(ddl, campStatusId) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text(' المخيم'));
        $.ajax({
            //url: getUrl() + '/plan/config/AllPlan',
            url: getUrl() + '/plan/config/AllPlanPending',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'CampStatusId': campStatusId }
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
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.PlanConfigId,
                        text: item.CountryDsecAr + '\t' + item.CampDsecAr + '\t' + getDateFromJsonDMY(item.PlanConfigStartDate)
                        //text: item.PlanConfigYear + ' ' + item.CampDsecAr + '\t' + getDateFromJsonDMY(item.PlanConfigStartDate)
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    function getCamps(ddl, country) {
        $(ddl).html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('مدينة المخيم'));
        $.ajax({
            url: getUrl() + '/basar/camps',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(
                { 'CountryId': country }
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
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.CampId,
                        text: ' ' + item.CampDsecAr
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    }





    function getCountries(ddl) {

        ddl.html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('الدولة'));
        $.ajax({
            url: getUrl() + '/basar/country',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            dataType: 'JSON',
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.CountryId,
                        text: item.CountryDsecAr
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    }

    function getTours(ddl) {

        ddl.html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('الجولة'));
        $.ajax({
            url: getUrl() + '/basar/tour',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            dataType: 'JSON',
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option />', {
                        value: item.TourId,
                        text: item.TourDsecAr,
                        'data-tourdeschint': item.TourDescHint,
                        'data-toggle': 'tooltip',
                        'data-container': '#tooltipContainer',
                        title: item.TourHint //,
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    }
    function getYears(ddl) {

        ddl.html('');
        $(ddl).append($("<option/>").attr("value", '')
            .text('العام'));
        $.ajax({
            url: getUrl() + '/basar/Year',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            dataType: 'JSON',
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                $(data).each(function (index, item) {
                    $(ddl).append($('<option/>', {
                        value: item.YearNameEn,
                        text: item.YearNameAr,
                        'data-yeardesc': item.YearDesc
                    }));
                });
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    }

    //#endregion 16-4-2020
    //#endregion


    //#region select 2
    function getSelect() {
        $('.select-option').select2({
            //placeholder: 'Select an option',
            //dir: 'rtl',
            //language: 'ar',
            multiple: false,
            scrollAfterSelect: true,
            theme: 'bootstrap4'
        });
    }
    //#endregion
}