document.addEventListener("turbolinks:load", function() {
    $('.res-faq').on('click', function () {
        var identifier = this.className.split(' ')[0];
        var currentOpen = $('.open-card');
        if (currentOpen.length > 0) {
            currentOpen.removeClass('col-12 open-card').addClass('col-5');
            if (!currentOpen.hasClass(identifier)) {
                $(`.${identifier}`).removeClass('col-5').addClass('col-12 open-card');
            }
        } else {
            $(`.${identifier}`).removeClass('col-5').addClass('col-12 open-card');
        }
        $('html, body').animate({
            scrollTop: $(`#${identifier}`).offset().top -100
        }, 2000);
    });
});