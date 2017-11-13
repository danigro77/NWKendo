document.addEventListener("turbolinks:load", function() {
    $('.accordion-actions i').on('click', function() {
        var classes = this.className.split(/\s+/);
        var areaName = classes[2];
        if (classes.includes('arrow-up')) {
            $('#' + areaName + ' .accordion-actions i.arrow-up').hide();
            $('#' + areaName + ' .accordion-actions i.arrow-down').show();
            $('#' + areaName + ' .result-block').hide();
            $('#' + areaName + ' .sub-header').addClass('collapsed');
        } else {
            $('#' + areaName + ' .accordion-actions i.arrow-up').show();
            $('#' + areaName + ' .accordion-actions i.arrow-down').hide();
            $('#' + areaName + ' .result-block').show();
            $('#' + areaName + ' .sub-header').removeClass('collapsed');
        }
    });
});