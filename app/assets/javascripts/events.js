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
    $('a.getEventLinks').on('click', function(e){
        e.preventDefault();

        let $ul = $('#all-events');

        $.ajax({
            method: 'GET',
            url: '/events',
            dataType: 'json'
        }).done(function(data){

            data.sort(function(a, b) {

                const nameA = a.title.toUpperCase();

                const nameB = b.title.toUpperCase();
                
                if (nameA < nameB) {
                  return -1;
                }

                if (nameA > nameB) {
                  return 1;
                }

                if (nameA === nameB) {
                    return 0;
                }
            });

            data.forEach(function(ev){

                let newEv = new Event(ev)

                $ul.append(newEv.renderLi());
            });
        });
    });
});

class Event {
    constructor(obj){
        this.id = obj.id
        this.title = obj.title
    };
};

Event.prototype.renderLi = function(){
    return '<li><h4><a href="/events/' +  this.id + '">' + this.title + '</a></h4></li>';
};

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
