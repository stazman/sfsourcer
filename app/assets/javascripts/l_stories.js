$(function(){
    $("form").submit(function(e){
        e.preventDefault();

        let values = $(this).serialize();
        let l_story = $.post('/l_stories', values)

        l_story.done(function(ls){
            $("#ls_title").text(ls["title"]);
            $("#ls_content").text(ls["content"]);
        });
    });
});