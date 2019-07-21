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

$(function(){
    $('a#return-all-events').on('click', function(e){
        e.preventDefault();

        let $ul = $('#all-events');

        $ul.html('');

        $.ajax({
            method: 'GET',
            url: '/events',
            dataType: 'json'
        }).done(function(data){
            data.forEach(function(ev){
                $ul.append('<li><h4><a href="/events/' +  ev.id + '">' + ev.title + '</a><h4></h4></li>');
            });
        });
    });
});
