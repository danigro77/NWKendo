document.addEventListener("turbolinks:load", function() {
    'use strict';

    $('#nwCarousel').carousel({});

    $('.collapse').collapse();

    $('#nw-tabs a:active').tab('show');
    $('.nav-link').on('click', function (event) {
        $('.active').removeClass('active');
    });

    function formatTime(date) {
        var momentDate = moment(date);
        return {
            date: momentDate.format("MMM Do, YYYY"),
            time: momentDate.format("hh:mmA")
        }
    }

    function getMaps(address) {
        return "https://www.google.com/maps/place/" + address.replace(' ', '+');
    }

    $('#eventModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var eventData = button.data('item');
        var modal = $(this);
        var startTime = formatTime(new Date(eventData.start_time));
        var endTime = formatTime(new Date(eventData.end_time));
        if (startTime.date === endTime.date) {
            modal.find('.modal-event-start-date').text(startTime.date);
            modal.find('.modal-event-start-time').text(startTime.time);
            modal.find('.modal-event-end-date').text('');
            modal.find('.modal-event-end-time').text(endTime.time);
        } else {
            modal.find('.modal-event-start-date').text(startTime.date);
            modal.find('.modal-event-end-date').text(endTime.date);
            modal.find('.modal-event-start-time').text(startTime.time);
            modal.find('.modal-event-end-time').text(endTime.time);
        }
        modal.find('.modal-event-name').text(eventData.name);
        if (eventData.location) {
            var html = '<a class="event-location" href="'+ getMaps(eventData.location)+'" target="_blank">'+ eventData.location + '</a>';
            modal.find('.modal-event-location').html(html);
        } else {
            modal.find('.modal-event-location').text('');
        }
        if (eventData.description) {
            modal.find('.modal-event-description').html('<div class="highlight-event-description">'+eventData.description+'</div>');
        } else {
            modal.find('.modal-event-description').text('');
        }
    })
});