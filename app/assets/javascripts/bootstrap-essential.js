$(document).ready(function(){
    'use strict';

    $('#nwCarousel').carousel({});

    $('.collapse').collapse();

    $('#nw-tabs a:active').tab('show');
    $('.nav-link').on('click', function (event) {
        $('.active').removeClass('active');
        console.log(this.href)
    });
});