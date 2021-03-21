{

    var loadingDiv = $('#loading');
    var getUrl = function () {
        return 'http://localhost/basarapi';
        //return 'http://help.albasarint.com';
    };
    loadingScreen();
    $(function () {
        /* pure js post
        var xhr = new XMLHttpRequest();
        xhr.open('POST', getUrl() + '/Basar/UserHelper/Check');
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('authorization', 'Bearer '
            + getAccessInfo().access_token);
        xhr.send(JSON.stringify({
            RoleName: 'Plan'
        }));
        xhr.onload = function () {
            console.log(xhr.response);
        };
        xhr.send();
        */

        checkAuth();

        loadingAjax();
    });


    //Region File input 4-5-2020
    function getFileInputjs3() {
        $('#inputmedia').fileinput({
            theme: "explorer",
            uploadUrl: "/file-upload-batch/2",
            allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'PDF', 'doc', 'docx', 'xls', 'xlsx'],
            overwriteInitial: false,
            initialPreviewAsData: true,
            maxFileSize: 10000,
            removeFromPreviewOnError: true,
            initialPreviewFileType: 'pdf',//'image',
            /*initialPreview: [
                "https://picsum.photos/1920/1080?image=101",
                "https://picsum.photos/1920/1080?image=102",
                "https://picsum.photos/1920/1080?image=103"
            ],
            initialPreviewConfig: [
                { caption: "picture-1.jpg", size: 329892, width: "120px", url: "/site/file-delete", key: 101 },
                { caption: "picture-2.jpg", size: 872378, width: "120px", url: "/site/file-delete", key: 102 },
                { caption: "picture-3.jpg", size: 632762, width: "120px", url: "/site/file-delete", key: 103 }
            ],*/
            //initialPreviewDownloadUrl: 'https://picsum.photos/1920/1080?image={key}' // the key will be dynamically replaced
        });
    }
    function getFileInputjs(inputFile, initial) {
        $(inputFile).fileinput({
            theme: "explorer-fa",
            uploadUrl: getUrl() + 'basar/upload/',
            //uploadUrl: "/file-upload-batch/2",
            allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'PDF', 'doc', 'docx', 'xls', 'xlsx'],
            overwriteInitial: false,
            autoReplace: false,
            initialPreviewAsData: true,
            maxFileSize: 10000,
            initialPreviewFileType: 'pdf',//'image',
            removeFromPreviewOnError: true,
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            initialPreview: initial


            /*,
            initialPreviewConfig: [
                { caption: "picture-1.jpg", size: 329892, width: "120px", url: "/site/file-delete", key: 101 },
                { caption: "picture-2.jpg", size: 872378, width: "120px", url: "/site/file-delete", key: 102 },
                { caption: "picture-3.jpg", size: 632762, width: "120px", url: "/site/file-delete", key: 103 },
                { caption: "picture-4.jpg", size: 8550, width: "120px", url: "/site/file-delete", key: 104 }
            ],
            initialPreviewDownloadUrl: 'https://picsum.photos/1920/1080?image={key}' // the key will be dynamically replaced
            */
        });
    }
    function getFileInputjsPreview(inputFile, initial) {
        $(inputFile).fileinput({
            theme: "explorer",
            //uploadUrl: getUrl() + '/uploadfiles/',
            uploadUrl: getUrl() + 'basar/upload/',
            //uploadUrl: "/file-upload-batch/2",
            allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'PDF', 'doc', 'docx', 'xls', 'xlsx'],
            overwriteInitial: false,
            initialPreviewAsData: true,
            maxFileSize: 10000,
            removeFromPreviewOnError: true,
            previewFileIcon: '<i class="fas fa-file"></i>',
            initialPreview: initial,
            initialPreviewConfig: [
                { caption: "picture-1.jpg", size: 329892, width: "120px", url: "/site/file-delete", key: 101 },
                { caption: "picture-2.jpg", size: 872378, width: "120px", url: "/site/file-delete", key: 102 },
                { caption: "picture-3.jpg", size: 632762, width: "120px", url: "/site/file-delete", key: 103 },
                { caption: "picture-4.jpg", size: 8550, width: "120px", url: "/site/file-delete", key: 104 }
            ],
            initialPreviewDownloadUrl: 'https://picsum.photos/1920/1080?image={key}' // the key will be dynamically replaced
        });
    }


    //Region


    function loadingScreen() {
        $(window).on('load', function () {
            loadingDiv.hide();
        });

    }
    function loadingAjax() {
        $(document).ajaxStart(function () {
            loadingDiv.show();
        }).ajaxStop(function () {
            loadingDiv.hide();
        });
    }

    function getAccessInfo() {

        var loginInfo = JSON.parse(sessionStorage.getItem('loginInfo'));
        if (loginInfo == null) {
            return null;
        }
        else {
            return loginInfo;
        }

    }
    function checkAuth() {
        if (window.location.href.indexOf("SignIn") === -1) {
            if (sessionStorage.getItem('loginInfo') === null) {
                window.location.href = "../Home/SignIn";
            }
            else {
                return false;
            }
        }
    }



    function getMsg(partialView, url, modalId, status) {
        $(partialView).empty();
        $(partialView).load(url);
        setTimeout(function () {
            var modalTitle = $(modalId + ' .modal-title'),
                modalText = $(modalId + ' .modal-body p');
            if (status) {
                modalTitle.text('Success');
                modalText.text('Saved');
            }
            else if (status === false) {
                modalTitle.text('Error');
                modalText.text('error user Name');
            }
            else {
                modalTitle.text('');
                modalText.text('');
            }
            $(modalId).modal('show');
        }, 100);
    }

    //#region datatable
    function getDataTableArabic() {
        return {
            "decimal": "",
            "emptyTable": "لا يوجد بيانات",
            "info": "اظهار _START_ to _END_ من _TOTAL_ سجل",
            "infoEmpty": "اظهار 0 من 0 of 0 سجل",
            "infoFiltered": "(بحث من _MAX_ مجموع سجل)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "اظهار _MENU_ سجل",
            "loadingRecords": "تحميل السجلات...",
            "processing": "تحميل...",
            "search": "بحث:",
            "zeroRecords": "لا يوجد نتائج بالبحث",
            "paginate": {
                "first": "الأول",
                "last": "الأخير",
                "next": '<i class="fa fa-chevron-left"></i>',
                "previous": '<i class="fa fa-chevron-right"></i>'
            },
            "aria": {
                "sortAscending": ": activate to sort column ascending",
                "sortDescending": ": activate to sort column descending"
            }
        };

    }

    function getStatusTextDataTable(status) {

        if (status) {
            return '<span class="badge badge-pill badge-success">نشط</span>';
        }
        if (status === false) {
            return '<span class="badge badge-pill badge-danger">غير نشط</span>';
        }
        else {
            return '<span class="badge badge-pill badge-dark">---</span>';
        }
    }
    //#endregion

    //#region date function

    function getDateFromJson(jsonDate) {
        var jDate = new Date(jsonDate),
            year = jDate.getFullYear(),
            month = jDate.getMonth() + 1,
            day = jDate.getDate(),
            myBirth = year + '-' + month + '-' + day;
        return myBirth;
    }
    function getDateFromJsonTime(jsonDate) {
        var jDate = new Date(jsonDate),
            year = jDate.getFullYear(),
            month = jDate.getMonth() + 1,
            day = jDate.getDate(),
            hour = jDate.getHours(),
            minute = jDate.getMinutes(),
            myBirth = hour + ':' + minute + ' ' + year + '-' + month + '-' + day;
        return myBirth;
    }

    function getDateFromJsonDMY(jsonDate) {
        var jDate = new Date(jsonDate),
            year = jDate.getFullYear(),
            month = jDate.getMonth() + 1,
            day = jDate.getDate(),
            myBirth = day + '-' + month + '-' + year;
        return myBirth;
    }


    function getCurrentDate() {
        var today = new Date();
        var dd = String(today.getDate());//.padStart(2, '0');
        var mm = String(today.getMonth() + 1);//.padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        today = mm + '-' + dd + '-' + yyyy;
        return today;
    }

    //link picker
    //var txtVisaDate = txtPlanConfigEndDate.val();

    function getCalender(jqElem) {
        var todayDate = new Date().getDate();
        var endD = new Date(new Date().setDate(todayDate - 15));
        var currDate = new Date();
        jqElem.datepicker({
            keyboardNavigation: false,
            forceParse: false,
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            autoclose: true,
            todayHighlight: true,
            clearBtn: true,
            startDate: currDate,
            //endDate: currDate,
            Default: {
                time: 'fa fa-times',
                date: 'fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-laptop',
                clear: 'fa fa-trash',
                close: 'fa fa-remove-format'
            }
        });

        /*txtPlanConfigStartDate.on("changeDate", function (e) {
            txtPlanConfigEndDate.datepicker('setStartDate', e.date);
        });
        txtPlanConfigEndDate.on("changeDate", function (e) {
            txtPlanConfigStartDate.datepicker('setEndDate', e.date + 3);
        });*/
    }


    function getCalenderPicker(txtPlanConfigStartDate, txtPlanConfigEndDate) {
        var fromTime = txtPlanConfigStartDate.val();
        var toTime = txtPlanConfigEndDate.val();

        //txtPlanConfigStartDate.val(getCurrentDate);
        //txtPlanConfigEndDate.val(getCurrentDate);


        txtPlanConfigStartDate.datepicker({
            keyboardNavigation: false,
            forceParse: false,
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            autoclose: true,
            endDate: toTime,
            todayHighlight: true,
            clearBtn: true,
            Default: {
                time: 'fa fa-times',
                date: 'fa-calendar',
                up: 'fa fa-chevron-up',
                down: 'fa fa-chevron-down',
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-laptop',
                clear: 'fa fa-trash',
                close: 'fa fa-remove-format'
            }
        });
        txtPlanConfigEndDate.datepicker({
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            format: 'yyyy-mm-dd',
            autoclose: true,
            startDate: fromTime,

            todayHighlight: true,
            clearBtn: true
        });
        txtPlanConfigStartDate.on("changeDate", function (e) {
            txtPlanConfigEndDate.datepicker('setStartDate', e.date);
        });
        txtPlanConfigEndDate.on("changeDate", function (e) {
            txtPlanConfigStartDate.datepicker('setEndDate', e.date + 3);
        });
    }
    //#endregion date function
}