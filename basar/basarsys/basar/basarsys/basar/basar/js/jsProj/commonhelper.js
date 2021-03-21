    //#region vars

    //#endregion vars

    //#region page

    //#endregion page

    //#region function
    let getDataFromFunction = function (obj, url, dataFunction) {
        $.ajax({
            //url: getUrl() + '/PatientType/Get',
            url: getUrl() + url,
            type: 'POST',
            headers: {
                'Authorization': 'Bearer '
                    + getAccessInfo().access_token
            },
            data: JSON.stringify(obj),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                loadingDiv.show();
            },
            complete: function () {
                loadingDiv.hide();
            },
            success: function (data) {
                dataFunction(data);
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    };
    let getDataFromFunctionUnAuth = function (obj, url, dataFunction) {
        $.ajax({
            //url: getUrl() + '/PatientType/Get',
            url: getUrl() + url,
            type: 'POST',
            data: JSON.stringify(obj),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend(jqXHR) {
                //loadingDiv.show();
            },
            complete: function () {
                //loadingDiv.hide();
            },
            success: function (data) {
                dataFunction(data);
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    };


    let addNewRecord = function (obj, url, successFunc) {
        $.ajax({
            url: getUrl() + url,
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
            complete: function (data) {
                loadingDiv.hide();
            },
            success: function (data) {
                successFunc(data);
            },
            error: function (jqXHR) {
                console.log(jqXHR);
            }
        });
    };


    //#endregion function


