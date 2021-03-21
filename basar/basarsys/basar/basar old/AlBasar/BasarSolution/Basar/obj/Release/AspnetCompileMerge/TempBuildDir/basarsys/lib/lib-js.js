function getData(actionUrl, func) {
    $.ajax({
        url: actionUrl,
        dataType: "json",
        method: 'GET',
        success: function (data) {
            $(data).each(function (index, result) {
                func(result);
            });
        },
        error: function (err) {
            console.log(err);
        }
    });
}

