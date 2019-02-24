$(function(){
    $("a.load_writer_groups").on("click", function(e){
        // alert("This is a test");
        $.get(this.href).success(function(json){
            // console.log(data);
            // $("body").append(data);
            // $("div.writer_groups.ul").
            let $ul = $("div.writer_groups ul")

            $ul.html("");

            json.forEach(function(writer_group){
                $ul.append("<li>" + writer_group.wg_name + " - " + writer_group.wg_creator + "</li>");
            });
        });
        e.preventDefault();
    })
})