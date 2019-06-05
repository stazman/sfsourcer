$(function(){
    $("form").submit(function(e){
        e.preventDefault();

        let values = $(this).serialize();
        let l_story = $.post('/l_stories', values)

        l_story.done(function(ls){
            $("#lsTitle").text(ls["title"]);
            $("#lsContent").text(ls["content"]);
        });
    });
});