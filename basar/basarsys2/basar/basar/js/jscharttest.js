 //https://codepen.io/chartjs/pen/YVWZbz
$(function () {
    chartTest();
    chartTest2();
    chartTest3();
    getPlanLineChart();
    getTeamChart();
    
});

//#region
function getPlanLineChart(dataLabel, dataValue) {

    var config = {
        type: 'line',
        data: {
            labels: dataLabel,
            datasets: [{
                label: 'Sponsor',
                backgroundColor: window.chartColors.blue,
                borderColor: window.chartColors.blue,
                data: dataValue,

                fill: false,
            }/*, {
                label: 'My Second dataset',
                fill: false,
                backgroundColor: window.chartColors.blue,
                borderColor: window.chartColors.blue,
                data: numbers2  
            },
            {
                label: 'My third dataset',
                fill: false,
                backgroundColor: window.chartColors.orange,
                borderColor: window.chartColors.orange,
                data: numbers3  
                 
            }*/]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: 'Sponsor Line Chart'
            },
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Sponsor Name'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Camps Number'
                    }
                }]
            }
        }
    };

    var ctx = document.getElementById('canvas').getContext('2d');
    window.myLine = new Chart(ctx, config);

}
function getPlanTeamLineChart(dataLabel, dataValue) {

    var config = {
        type: 'line',
        data: {
            labels: dataLabel,
            datasets: [{
                label: 'Team',
                backgroundColor: window.chartColors.red,
                borderColor: window.chartColors.red,
                data: dataValue,

                fill: false,
            }/*, {
                label: 'My Second dataset',
                fill: false,
                backgroundColor: window.chartColors.blue,
                borderColor: window.chartColors.blue,
                data: numbers2  
            },
            {
                label: 'My third dataset',
                fill: false,
                backgroundColor: window.chartColors.orange,
                borderColor: window.chartColors.orange,
                data: numbers3  
                 
            }*/]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: 'Team Line Chart'
            },
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Team Name'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Camps Number'
                    }
                }]
            }
        }
    };
    //window.onload = function () {
        var ctx = document.getElementById('canvasTeam').getContext('2d');
        window.myLine = new Chart(ctx, config);
    //};
}
//#endregion

var backgroundColor = [
    'rgba(166, 88, 208, 0.2)',
    'rgba(243, 166, 57, 0.2)',
    'rgba(54, 162, 235, 0.2)',
    'rgba(243, 237, 57, 0.5)',
    'rgba(98, 243, 57, 0.2)',
    'rgba(35, 135, 8, 0.2)',
    'rgba(87, 80, 5, 0.2)',
    'rgba(25, 5, 87, 0.2)',
    'rgba(243, 57, 169, 0.4)',
    'rgba(255, 206, 86, 0.2)',
    'rgba(36, 27, 65, 0.2)',
    'rgba(75, 192, 192, 0.2)',
    'rgba(153, 102, 255, 0.2)',
    'rgba(31, 7, 125, 0.2)',
    'rgba(255, 159, 64, 0.2)',
    'rgba(7, 58, 125, 0.2)',
    'rgba(125, 106, 7, 0.2)',
    'rgba(14, 110, 236, 0.2)',
    'rgba(255, 41, 48, 0.2)',
    'rgba(130, 3, 113, 0.2)',
    'rgba(80, 2, 70, 0.2)',
    'rgba(14, 29, 236, .2)',
    'rgba(14, 29, 236, 0.2)',
    'rgba(14, 110, 236, 0.2)',
    'rgba(11, 85, 183, 0.2)'
];
var getTeamChart = function () {
    $.ajax({
        url: getUrl() + '/plan/config/stats/Team',
        method: 'Get',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer '
                + getAccessInfo().access_token

        },
        beforeSend: function (xhr) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            var dataLabel = [],
                dataValue = [];
            $.each(data, function (index, value) {
                dataLabel.push(value.Key);
                dataValue.push(value.Count);
            });
            getPlanTeamLineChart(dataLabel, dataValue);
        },
        error: function (jqXHR) {
            //$('#divErrorText').text(jqXHR.responseText);
            //$('#divError').show('fade');
            console.log(jqXHR);
        }
    });
};

var chartTest = function () {
    $.ajax({
        url: getUrl() + '/plan/config/stats/Year',
        method: 'Get',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer '
                + getAccessInfo().access_token

        },
        beforeSend: function (xhr) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            var arrGenderDescEN = [],
                arGenderCount = [];
            $.each(data, function (index, value) {
                //var newObj = { GenderDescEN: value.GenderDescEN, GenderCount: value.GenderCount};
                arrGenderDescEN.push(value.Key);
                arGenderCount.push(value.Count);
            });
            //generateChart('ctxGender', 'bar', mybGColor, myBorderColor,
            //   arrGenderDescEN, arGenderCount);
            generateChart2('ctxGender2', 'pie',
                arrGenderDescEN, arGenderCount);
            //generateChart3('ctxGender3', 'pie', mybGColor, myBorderColor,
            //    arrGenderDescEN, arGenderCount);
        },
        error: function (jqXHR) {
            //$('#divErrorText').text(jqXHR.responseText);
            //$('#divError').show('fade');
            console.log(jqXHR);
        }
    });
};

var chartTest2 = function () {
    $.ajax({
        url: getUrl() + '/plan/config/stats/Country',
        method: 'Get',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer '
                + getAccessInfo().access_token

        },
        beforeSend: function (xhr) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            var arrGenderDescEN = [],
                arGenderCount = [];
            $.each(data, function (index, value) {
                //var newObj = { GenderDescEN: value.GenderDescEN, GenderCount: value.GenderCount};
                arrGenderDescEN.push(value.Key);
                arGenderCount.push(value.Count);
            });

            generateChart('ctxGender', 'bar',
                arrGenderDescEN, arGenderCount);

            //generateChart3('ctxGender3', 'pie', mybGColor, myBorderColor,
            //    arrGenderDescEN, arGenderCount);
        },
        error: function (jqXHR) {
            //$('#divErrorText').text(jqXHR.responseText);
            //$('#divError').show('fade');
            console.log(jqXHR);
        }
    });
};
var chartTest3 = function () {
    $.ajax({
        url: getUrl() + '/plan/config/stats/sponsor',
        method: 'Get',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer '
                + getAccessInfo().access_token

        },
        beforeSend: function (xhr) {
            $("#loading").show();
        },
        complete: function () {
            $("#loading").hide();
        },
        success: function (data) {
            var arrGenderDescEN = [],
                arGenderCount = [];
            $.each(data, function (index, value) {
                //var newObj = { GenderDescEN: value.GenderDescEN, GenderCount: value.GenderCount};
                arrGenderDescEN.push(value.Key);
                arGenderCount.push(value.Count);
            });

            generateChart('ctxGender3', 'bar',
                arrGenderDescEN, arGenderCount);

            getPlanLineChart(arrGenderDescEN, arGenderCount);
        },
        error: function (jqXHR) {
            //$('#divErrorText').text(jqXHR.responseText);
            //$('#divError').show('fade');
            console.log(jqXHR);
        }
    });
};
//#region

generateChart = function (chartId, chartType, arrGenderDescEN, arGenderCount) {
    var ctx = document.getElementById(chartId);
    var myChart = new Chart(ctx, {
        type: chartType,
        data: {
            labels: arrGenderDescEN,
            datasets: [{
                showLine: true, // disable for a single dataset
                label: '',
                data: arGenderCount,
                backgroundColor: backgroundColor,
                borderColor: backgroundColor,
                borderWidth: 1
            }]
        },
        options: {
            layout: {
                padding: {
                    left: 100,
                    right: 0,
                    top: 0,
                    bottom: 0
                }
            },
            title: {
                display: true,
                text: ''
            },
            showLines: false, // disable for all datasets
            animation: {
                duration: 500 // general animation time
            },
            hover: {
                animationDuration: 500 // duration of animations when hovering an item
            },
            responsiveAnimationDuration: 500, // animation duration after a resize
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontColor: 'black',
                    defaultFontFamily: 'Cairo , sans-serif',
                    defaultFontColor: '#666',
                    defaultFontSize: 14
                }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
};
var generateChart2 = function (chartId, chartType, arrGenderDescEN, arGenderCount) {
    var ctx = document.getElementById(chartId);
    ctx.height = 300;
    var myChart = new Chart(ctx, {
        type: chartType,
        data: {
            labels: arrGenderDescEN,
            datasets: [{
                showLine: true, // disable for a single dataset
                label: '',
                data: arGenderCount,
                backgroundColor: backgroundColor,
                borderColor: backgroundColor,
                borderWidth: 1
            }]
        },
        options: {
            layout: {
                padding: {
                    left: 100,
                    right: 0,
                    top: 0,
                    bottom: 0
                }
            },
            title: {
                display: true,
                text: ''
            },
            showLines: false, // disable for all datasets
            animation: {
                duration: 500 // general animation time
            },
            hover: {
                animationDuration: 500 // duration of animations when hovering an item
            },
            responsiveAnimationDuration: 500, // animation duration after a resize
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontColor: 'black',
                    defaultFontFamily: 'Cairo , sans-serif',
                    defaultFontColor: '#666',
                    defaultFontSize: 14
                }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
};
var generateChart3 = function (chartId, chartType, arrGenderDescEN, arGenderCount) {
    var ctx = document.getElementById(chartId);
    ctx.height = 300;
    var myChart = new Chart(ctx, {
        type: chartType,
        data: {
            labels: arrGenderDescEN,
            datasets: [{
                showLine: true, // disable for a single dataset
                label: '',
                data: arGenderCount,
                backgroundColor: backgroundColor,
                borderColor: backgroundColor,
                borderWidth: 1
            }]
        },
        options: {
            layout: {
                padding: {
                    left: 100,
                    right: 0,
                    top: 0,
                    bottom: 0
                }
            },
            title: {
                display: true,
                text: 'ذكور واناث'
            },
            showLines: false, // disable for all datasets
            animation: {
                duration: 500 // general animation time
            },
            hover: {
                animationDuration: 500 // duration of animations when hovering an item
            },
            responsiveAnimationDuration: 500, // animation duration after a resize
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    fontColor: 'black',
                    defaultFontFamily: 'Cairo , sans-serif',
                    defaultFontColor: '#666',
                    defaultFontSize: 14
                }
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
};





/*
var gen7 = function (chartId, x, y) {
    var ctx = document.getElementById(chartId);
    var myChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: x,
            datasets: [{
                label: 'apples',
                backgroundColor: "rgba(153,255,51,0.4)",
                borderColor: "rgba(153,255,51,1)",
                data: y
            }, {
                label: 'oranges',
                backgroundColor: "rgba(255,153,0,0.4)",
                borderColor: "rgba(255,153,0,1)",
                data: y
            }]
        }
    });
};
var gen6 = function (chartId, x, y) {

    var ctx = document.getElementById(chartId).getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: x,
            datasets: [{
                label: 'apples',
                data: [12, 19, 3, 17, 28, 24, 7]
            }, {
                label: 'oranges',
                data: y
            }]
        }
    });
}
var gen5 = function (chartId, x, y) {
    var ctx = document.getElementById(chartId).getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: x,
            datasets: [{
                backgroundColor: [
                    "#2ecc71",
                    "#3498db",
                    "#95a5a6",
                    "#9b59b6",
                    "#f1c40f",
                    "#e74c3c",
                    "#34495e"
                ],
                data: y
            }]
        }
    });
};
var gen4 = function (chartId, x, y) {

    var ctx = document.getElementById(chartId).getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: x,
            datasets: [{
                backgroundColor: [
                    "#2ecc71",
                    "#3498db",
                    "#95a5a6",
                    "#9b59b6",
                    "#f1c40f",
                    "#e74c3c",
                    "#34495e"
                ],
                data: y
            }]
        }
    });
};
var gen3 = function (chartId, x, y) {
    var ctx = document.getElementById(chartId).getContext('2d');

    var original = Chart.defaults.global.legend.onClick;
    Chart.defaults.global.legend.onClick = function (e, legendItem) {
        update_caption(legendItem);
        original.call(this, e, legendItem);
    };

    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: x,
            datasets: [{
                label: 'apples',
                backgroundColor: "rgba(153,255,51,1)",
                data: y,
            }, {
                label: 'oranges',
                backgroundColor: "rgba(255,153,0,1)",
                data: y,
            }]
        }
    });

    var labels = {
        "apples": true,
        "oranges": true
    };

    var caption = document.getElementById("caption");

    var update_caption = function (legend) {
        labels[legend.text] = legend.hidden;

        var selected = Object.keys(labels).filter(function (key) {
            return labels[key];
        });

        var text = selected.length ? selected.join(" & ") : "nothing";

        caption.innerHTML = "The chart is displaying " + text;
    };
};
var gen2 = function (chartId, x, y) {
    var ctx = document.getElementById(chartId).getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: x,
            datasets: [{
                backgroundColor: [
                    "#2ecc71",
                    "#3498db",
                    "#95a5a6",
                    "#9b59b6",
                    "#f1c40f",
                    "#e74c3c",
                    "#34495e"
                ],
                data: y
            }]
        }
    });
};*/
        //#endregion