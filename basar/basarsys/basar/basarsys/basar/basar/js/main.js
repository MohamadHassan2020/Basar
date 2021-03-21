/*
 js file ver 2232020
 */
//#region height

$(function () {
    loadingOverlay();
    getTheme();
    'use strict';

    var windowHeight = $(window).height(),
        upperBarDivHeight = $('.upper-bar').innerHeight(),
        navDivHeight = $('.navbar ').innerHeight();
    $('.slider, .carousel-item').height(windowHeight - (upperBarDivHeight + navDivHeight));

});

/*featuredwork*/
/*$('.featured-work ul li').on('mouseover', function () {
    $(this).addClass('active').siblings().removeClass('active');
});*/

$('.featured-work ul li').on('click', function () {
    $(this).addClass('active').siblings().removeClass('active');
    if ($(this).data('class') === 'all') {
        $('.shuffle-image .col-md').css('opacity', 1);
    }
    else {
        $('.shuffle-image .row .col-md').css('opacity', '0.08');
        $($(this).data('class')).parent().css('opacity', '1');
    }
});
//#endregion

//#region   get theme
var getTheme = function () {
    var item = $('#main-navbar ul li a'),
        link = $('link[href*="speedline"]'),
        info = $('.info .get-quote');

    /*item.on('click', function () {
        $('link[href*="speedline"]').attr("href", $(this).data('linktheme'));

    });*/
    /* example 1*/

    //#region btn click change language 11-4-2020
    /*
    info.on('click', function () {
        var btnText = '';
        $(this).text(function (i, text) {
            console.log(text);
            if (text == "English") {
                btnText = "العربية";
            } else {

                btnText = "English";
            }
        });
        $(this).text(btnText);
        //link.attr("href", $(this).data('linktheme'));
        link.prop("href", $(this).data('linktheme'));
    });
    */
};

//#endregion
//#endregion   get theme

//#region loading overlay
var loadingOverlay = function () {
    $(window).on('load', function () {

        $('.loading-overlay .test').fadeOut(1000, function () {
            $(this).parent().fadeOut(1000, function () {
                $('body').css('overflow', 'auto');
                $(this).remove();
            });
        });
    });
};
//#region 