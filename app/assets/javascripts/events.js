$(function(){
    $('form').submit(function(e){
        e.preventDefault();

        let values = $(this).serialize();

        let event = $.post('/events', values);

        event.done(function(ev){
            $('#show-event-title').text(ev["title"]);
            $('#show-event-description').text(ev["description"]);
            $('#show-event-location').text(ev["location"]);
            $('#show-event-date').text(ev["date"]);
            $('#show-event-start-time').text(ev["start_time"]);
            $('#show-event-cost').text(ev["cost"]);
            $('#show-event-contact-info').text(ev["contact_info"]);
        });
    });
});
