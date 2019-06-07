$(function (){
    $("form").submit(function(e){
        e.preventDefault();

        let values = $(this).serialize();
        let l_story = $.post('/l_stories', values)

        l_story.done(function(ls){
            $("#lsTitle").text(ls["title"]);
            $("#lsContent").text(ls["content"]);

            document.getElementById("edit_new_story").onclick = () => 
            window.location.href = `http://localhost:8080/l_stories/${ls["id"]}/edit`;

            document.getElementById("go_to_new_story").onclick = () => 
            window.location.href = `http://localhost:8080/l_stories/${ls["id"]}`;
        });
    });
});