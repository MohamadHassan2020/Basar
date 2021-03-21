$(function () {
    getData('../BasarService/PlanServices.asmx/GetPlanModelStatsDT', getPlanModelStats);
});

function getPlanModelStats(result) {
    var myDiv = $("#myDiv");
    $(myDiv).empty();
    var div = '<div class="col">';
    div += '<div class="card border-success mb-3">';
    div += '<div class="card-header bg-transparent border-success text-center">';
    div += '<span><a href="javascript;;" role="button" class="btn btn-outline-success btn-block">' + result.YearNameEn + '</a></span>';
    div += '</div>';
    div += '<div class="card-body text-success">';
    div += '<h6 class="card-title">Total Camps <span class="badge badge-success">' + result.TotalCamps + '</span></h6>';
    div += '</div>';
    div += '<div class="card-footer bg-transparent border-success">';
    div += '<button type="button" class="btn btn-outline-success btn-sm btn-block">More...</button>';
    div += '</div>';
    div += '</div>';
    div += '</div>';
    myDiv.append(div);
}





