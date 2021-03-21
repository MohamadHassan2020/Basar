function uploadFile(event, fUpload,  tour, country, camp, yearValue, tourValue, countryValue, campValue, myurl) {
    if (yearValue !== '-1' &&  yearValue !== '' && yearValue !== null) {
        var files = fUpload[0].files;
        if (files.length > 0) {
            var FileSize = fUpload[0].files[0].size / 1024;
            if (FileSize < 500) {
                var formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    formData.append(files[i].name, files[i]);
                }
                //var progressbarLabel = $('#progressBar-label');
                //var progressbarDiv = $('#progressbar');
                var dateFolder = getDateToday();

                $.ajax({

                    url: myurl + dateFolder + "&tour=" + tour + "&country=" + country + "&camp=" + camp +  "&yearValue=" + yearValue + "&tourValue=" + tourValue
                        + "&countryValue=" + countryValue + "&campValue=" + campValue,
                    method: 'post',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function () {
                        //progressbarLabel.text('اكتمل التحميل');
                        //progressbarDiv.fadeOut(2000);
                        alert('اكتمل التحميل');
                    },
                    error: function (err) {
                        alert('تأكد من حفظ البيانات');
                        alert(err.statusText);
                    }
                });

                //progressbarLabel.text('تحميل ...');
                //progressbarDiv.progressbar({
                //    value: false
                //}).fadeIn(5000);
            }
            else {
                alert('حجم الملف كبير');
            }
        }
        else {

            alert('لا يوجد مرفق');
        }
    }
    else {
        alert('تأكد من تسجيل البيانات');
    }
}

function uploadFileArchive(event, fUpload, yearValue, myurl, documentTypeText, docNum, documentTypeValue) {
    if (yearValue !== '-1' && yearValue !== '' && yearValue !== null) {
        var files = fUpload[0].files;
        if (files.length > 0) {
            var FileSize = fUpload[0].files[0].size / 1024;
            if (FileSize < 200000) {
                var formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    formData.append(files[i].name, files[i]);
                }
               
                var dateFolder = getDateToday();

                $.ajax({

                    url: myurl + dateFolder + "&yearValue=" + yearValue + "&documentTypeText=" + documentTypeText + "&docNum=" + docNum + "&documentTypeValue=" + documentTypeValue,
                    method: 'post',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function () {
                        //progressbarLabel.text('اكتمل التحميل');
                        //progressbarDiv.fadeOut(2000);
                        alert('اكتمل التحميل');
                    },
                    error: function (err) {
                        alert('تأكد من حفظ البيانات');
                        alert(err.statusText);
                    }
                });

                //progressbarLabel.text('تحميل ...');
                //progressbarDiv.progressbar({
                //    value: false
                //}).fadeIn(5000);
            }
            else {
                alert('حجم الملف كبير');
            }
        }
        else {

            alert('لا يوجد مرفق');
        }
    }
    else {
        alert('تأكد من تسجيل البيانات');
    }
}



function getDateToday() {
    var d = new Date();

    var month = d.getMonth() + 1;
    var day = d.getDate();

    var output = d.getFullYear() + '-' +
        (month < 10 ? '0' : '') + month + '-' +
        (day < 10 ? '0' : '') + day;
    return output;
}


function getSelectText(ddl) {
    return $("#" + ddl + " option:selected").text();
}
function getSelectValue(ddl) {
    return $("#" + ddl + " option:selected").val();
}