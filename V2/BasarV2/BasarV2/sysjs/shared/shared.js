class Shared {
    constructor(description = '', keywords = '', title = '') {
        this.description = description;
        this.keywords = keywords;
        this.title = title;
    }
    static sweetMsg = new SharedSweetAlert();

    delay = (duration = 10) => new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve();
        }, duration);
        setTimeout(() => {
            reject('error');
        }, 10000);
    })

    static getAccessInfo() {
        let loginInfo = JSON.parse(sessionStorage.getItem('loginInfo'));
        // check session
        if (typeof loginInfo !== 'undefined' && loginInfo !== null) {

            return loginInfo;
        } else {
            return '';
        }
    }

    static getUrl() {
        if (window.location.href.toLowerCase().indexOf("localhost") > -1) {
            return 'http://localhost/basarapi';
        }
        return 'http://help.albasarint.com';
    }

    async getMeta() {
        if (this.keywords != '') {
            document.getElementsByTagName('meta')["keywords"].content = this.keywords;
        }
        if (this.description != '') {
            document.getElementsByTagName('meta')["description"].content = this.description;
        }
        if (this.title != '') {
            document.title = this.title;
        }
    };

    async getAuth(obj, url, successFunc, errorFunc) {
        if (Shared.getAccessInfo() != null && Shared.getAccessInfo != 'undefiend') {

            await $.ajax({
                url: `${Shared.getUrl()}${url}`,
                type: 'POST',
                headers: {
                    'Authorization': 'Bearer '
                        + Shared.getAccessInfo().access_token
                },
                data: JSON.stringify(obj),
                contentType: "application/json;charset=UTF-8",
                dataType: "json",
                success: data => successFunc(data),
                error: err => errorFunc(err)
            });
        }
    }
    async addAuth(obj, url, successFunc, errorFunc) {
        if (Shared.getAccessInfo() != null && Shared.getAccessInfo != 'undefiend') {
            await $.ajax({
                url: `${Shared.getUrl()}${url}`,
                type: 'POST',
                'Content-Type': 'application/json; charset=utf-8',
                headers: { 'Authorization': `Bearer ${Shared.getAccessInfo().access_token}` },
                data: obj,
                success: data => successFunc(data),
                error: err => errorFunc(err)
            });
        }
    };
    async getUnAuth(obj, url, successFunc, errorFunc) {
        await $.ajax({
            url: `${Shared.getUrl()}${url}`,
            type: 'POST',
            data: JSON.stringify(obj),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: data => successFunc(data),
            error: err => errorFunc(err)
        });
    }
    async addUnAuth(obj, url, successFunc, errorFunc) {
        await $.ajax({
            url: `${Shared.getUrl()}${url}`,
            type: 'POST',
            'Content-Type': 'application/json; charset=utf-8',
            data: obj,
            success: data => successFunc(data),
            error: err => errorFunc(err)
        });
    };
    //success function
    //error function
    async login(userName, password, success, error, url = Shared.getUrl()) {
        $.ajax({
            url: `${url}/token`,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            type: 'POST', //if use jquery after 1.9  use alias method
            contentType: 'application/json; charset=utf-8',
            data: {
                userName,
                password,
                grant_type: 'password'
            },
            success: response => success(response),
            error: err => error(err)
        });
    }

    //#region data table function

    async getBookDataTable(dtable, url, columns, myData = {}) {
        // FPrint/Copy/CSV
        await $(dtable).DataTable({
            //"fnRowCallback": function (nRow, aData, iDisplayIndex) {
            //    $("td:first", nRow).html(iDisplayIndex + 1);
            //    return nRow;
            //},
            dom: 'Bfrtip',
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5',
                'pdfHtml5',
                'print'
            ],
            "language": {
                "emptyTable": "ليست هناك بيانات متاحة في الجدول",
                "loadingRecords": "جارٍ التحميل...",
                "processing": "جارٍ التحميل...",
                "lengthMenu": "أظهر _MENU_ مدخلات",
                "zeroRecords": "لم يعثر على أية سجلات",
                "info": "إظهار _START_ إلى _END_ من أصل _TOTAL_ مدخل",
                "infoEmpty": "يعرض 0 إلى 0 من أصل 0 سجل",
                "infoFiltered": "(منتقاة من مجموع _MAX_ مُدخل)",
                "search": "ابحث:",
                "paginate": {
                    "first": "الأول",
                    "previous": "السابق",
                    "next": "التالي",
                    "last": "الأخير"
                },
                "aria": {
                    "sortAscending": ": تفعيل لترتيب العمود تصاعدياً",
                    "sortDescending": ": تفعيل لترتيب العمود تنازلياً"
                },
                "select": {
                    "rows": {
                        "_": "%d قيمة محددة",
                        "0": "",
                        "1": "1 قيمة محددة"
                    }
                },
                "buttons": {
                    "print": "طباعة",
                    "colvis": "الأعمدة الظاهرة",
                    "copy": "نسخ",
                    "copyTitle": "نسخ",
                    "copyKeys": "زر <i>ctrl<\/i> أو <i>⌘<\/i> + <i>C<\/i> من الجدول<br>ليتم نسخها إلى الحافظة<br><br>للإلغاء اضغط على الرسالة أو اضغط على زر الخروج.",
                    "copySuccess": {
                        "_": "%d قيمة نسخت",
                        "1": "1 قيمة نسخت"
                    },
                    "pageLength": {
                        "-1": "اظهار الكل",
                        "_": "إظهار %d أسطر"
                    }
                }
            },
            'iDisplayLength': 5,

            ////////////////////////////////////////////////

            /*"createdRow": function (row, data, dataIndex) {
                $(row).addClass(data.TypeOfCaseClassName).css('font-weight', 900);
            },*/
            /*'rowCallback': function (row, data, index) {
                if (data[3] > 11.7) {
                    $(row).find('td:eq(3)').css('color', 'red');
                }
            }*/
            ajax: {
                type: "POST",
                url: `${Shared.getUrl()}${url}`,
                headers: { 'Authorization': `Bearer ${Shared.getAccessInfo().access_token}` },
                //contentType: "application/json;charset=UTF-8",
                data: myData,
                datatype: "JSON",
                dataSrc: "",
                beforeSend(jqXHR) {
                },
                complete: function () {
                },
                error: function (jqXHR) {
                    console.log(jqXHR.responseText);
                }
            },
            "columns": columns,
            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            "processing": true,
            "pageLength": 10,
            // "pagingType": $(window).width() < 768 ? "simple" : "full_numbers", //"simple",
            "autoWidth": false,
            'destroy': true,
            'searching': true,
            'responsive': true,
            ordering: false

            ////////////////////////////////////////////////
        });
    }

    getStatusTextDataTable(status = false) {
        if (status) {
            return '<span class="badge badge-light-success">نشط</span>';
        }
        if (status === false) {
            return '<span class="badge badge-light-danger">غير نشط</span>';
        }
        else {
            return '<span class="badge badge-light-primary">---</span>';
        }
    }

    getRowNumberDataTable(data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
    }
    async getRowBydblClick(succ, elem_JQ = '#tblDataExists') {
        await $(document).on('dblclick', `${elem_JQ} tbody tr`, function () {
            const row = $(this).closest("tr"),
                data = $(elem_JQ).dataTable().fnGetData(row);
            succ(data);
        });
    }

    //#endregion data table function

    //#region validation
    checkValidation = (elementJs, errorMsg) => {
        if (typeof elementJs.value.trim() === 'undefined' || elementJs.value.trim() === null || elementJs.value.trim() === '') {
            elementJs.focus();
            Shared.sweetMsg.typeMsg(errorMsg, '', 'error');
            
            return false;
        }
        else {
            return true;
        }
    }

    //#endregion

}




