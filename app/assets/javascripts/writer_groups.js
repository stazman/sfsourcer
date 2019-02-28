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

$(function () {
    $('form').submit(function(event) {
      event.preventDefault();
      let values = $(this).serialize();
      let writer_group = $.post('/writer_groups', values);
      writer_group.done(function(data) {
          let w_group = data;
          $("#writerGroupWgName").text(w_group["wg_name"]);
          $("#writerGroupWgCreator").text(w_group["wg_creator"]);
          $("#writerGroupWgDescription").text(w_group["wg_description"]);
        });
    });
});
   