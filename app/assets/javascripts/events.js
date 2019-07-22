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
                $ul.append('<li><h4><a href="/events/' +  ev.id + '">' + ev.title + '</a></h4></li>');
            });
        });
    });
});

$(function(){
    $('form#search-events').submit(function(e){
        e.preventDefault();

        let input = $('input#search-params').val();
                
        let $ul = $('#search-results');

        $ul.html('');

        $.ajax({
            method: 'GET',
            url: '/events',
            dataType: 'json'
        }).done(function(data){
            data.forEach(function(ev){
                if ( ev.title.includes(input) || ev.description.includes(input) || ev.location.includes(input) || ev.contact_info.includes(input) ){
                    $ul.append('<li><h5><a href="/events/' +  ev.id + '">' + ev.title + '</a><h5></li>');
                } else {
                    $ul.replaceWith(`<li>No results found for "${input}".</li>`);
                };
            });
        });
    });
});
