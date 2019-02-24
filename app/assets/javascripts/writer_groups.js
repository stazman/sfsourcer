$(function(){
    $("a.load_writer_groups").on("click", function(e){
        $.get(this.href).success(function(json){

            let $ul = $("div.writer_groups ul")

            $ul.html("");
            json.forEach(function(writer_group){
                $ul.append("<li>" + "<a " + "href='" + "/writer_groups/" + writer_group.id + "' >" + writer_group.wg_name + "</a>" + " - " + writer_group.wg_creator + "</li>");
            });
        });
        e.preventDefault();
    })
})