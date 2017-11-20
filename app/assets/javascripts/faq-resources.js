document.addEventListener("turbolinks:load", function() {
    $('.action-block').on('click', function (event) {
        $('.show-first').removeClass('show-first');
        $('.hidden-block').hide();
        $('.action-block').removeClass('highlight');
        var num = this.className.split(' ')[0];
        var block = $('.action-block.' + num);
        var hiddenBlock = $('.'+num+' .hidden-block');
        hiddenBlock.show();
        block.addClass('highlight');
    });
    $('.video-selector').on('click', function (event) {
        var index = this.className.split(' ')[0];
        var data = JSON.parse(event.target.dataset.video);
        $('.video-selector.selected').removeClass('selected');
        $('.video-selector.'+index).addClass('selected');
        $('.video-title').html(data.title);
        $('.video-date').html(data.taken_on);
        $('.video-preview').prop('src', data.url);
        if (data.description) {
            $('.video-description').css('display', 'block');
            $('.video-description').html(data.description);
        } else {
            $('.video-description').css('display', 'none');
        }
    });
});