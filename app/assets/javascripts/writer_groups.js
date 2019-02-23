$(function(){
    $("a.load_writer_groups").on("click", function(e){
        // alert("This is a test");
        $.get(this.href).success(function(json){
            // console.log(data);
            // $("body").append(data);
            // $("div.writer_groups.ul").
            let $ol = $("div.writer_groups ul")

            $ol.html("");

            json.forEach(function(writer_group){
            // debugger
            });
        });
        e.preventDefault();
    })
})