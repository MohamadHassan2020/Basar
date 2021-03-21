$(function () {
    chartBar();
    chartLine();
    chartpie();
    polarAreaChart();

});

var myCountries = ['SUDAN', 'Pakistan', 'India', 'Mauritania', 'Djibouti', 'Somalia',
    'Eritrea', 'Morocco', 'Nigeria', 'South Africa', 'Yemen', 'Ethiopia', 'Bangladesh', 'Cameroon', 'Senegal'],
    myCountriesData = [12, 14, 3, 5, 2, 15, 7, 7, 9, 6, 3, 4, 9, 2, 7],
    myTeamLabel = ["Sudan", 'Pakistan', 'Yemen', 'Nigeria', 'Bangladesh'],
    myTeamData = [20, 18, 17, 22, 5],
    myTourLabel = ["Africa 1", 'Africa 2', 'Africa 3', 'Africa 4', 'Africa 5', 'Africa 6', 'Asia 1', 'Asia 2', 'Asia 3'],
    myTourData = [7, 8, 5, 4, 6, 9, 7, 8, 3],

    bgColor = [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(153, 206, 255, 0.2)',
        'rgba(153, 233, 233, 0.2)',
        'rgba(153, 159, 64, 0.2)',
        'rgba(119, 170, 21, 0.3)',
        'rgba(18, 90, 32, 0.3)',
        'rgba(159, 45, 58, 0.3)',
        'rgba(153, 159, 10, 0.3)',
        'rgba(64, 9, 35, 0.3)',
        'rgba(145, 22, 80, 0.3)',
        'rgba(138, 74, 203, 0.2)'
    ];
function chartBar() {
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: myCountries,
            datasets: [{
                label: '# of camps',
                data: myCountriesData,
                backgroundColor: bgColor,
                borderColor: bgColor,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}
function chartLine() {
    var ctx = document.getElementById('myChartLine');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: myTourLabel,
            datasets: [{
                label: '# of camps',
                data: myTourData,

                backgroundColor: [
                    'rgba(255, 255, 255, 0)'

                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)'

                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });
}
function chartpie() {

    var ctx = document.getElementById('myChartDoughnut');
    var myLineChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: myTeamLabel,
            datasets: [{
                label: '# of camps',
                data: myTeamData,

                backgroundColor: bgColor,
                borderColor: bgColor,
                borderWidth: 2
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });
}
function polarAreaChart() {

    var ctx = document.getElementById('sponsorChart');
    var myLineChart = new Chart(ctx, {
        type: 'polarArea',
        data: {
            labels: myTeamLabel,
            datasets: [{
                label: '# of camps',
                data: myTeamData,

                backgroundColor: bgColor,
                borderColor: bgColor,
                borderWidth: 2
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });
}
function bubbleChart() {

    var ctx = document.getElementById('bubbleChart');
    var myLineChart = new Chart(ctx, {
        type: 'scatter',
        data: {
            labels: myTeamLabel,
            datasets: [{
                label: '# of camps',
                data: myTeamData,

                backgroundColor: bgColor,
                borderColor: bgColor,
                borderWidth: 2
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });
}