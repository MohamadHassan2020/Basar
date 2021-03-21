$(document).ready(function () {
    getTotalClinicalReport();
    updategetTotalClinicalReport();
});
//#region       30-9-2019
function getTotalClinicalReport() {
    $("[id$='gvAxes']" + " tbody tr .male-value, .female-value").on("blur", function () {
        var row = $(this).closest("tr"),
            //maleValue = $(this).val() != "" ? $(this).val() : 0,
            maleValue = $(row).find(".male-value").val() != "" ? $(row).find(".male-value").val() : 0,
            femaleValue = $(row).find(".female-value").val() != "" ? $(row).find(".female-value").val() : 0,
            totalValue = $(row).find(".total-value");
        $(totalValue).text(parseInt(maleValue) + parseInt(femaleValue));
    });
}
function updategetTotalClinicalReport() {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        getTotalClinicalReport();
    });
}
//#endregion   30-9-2019
