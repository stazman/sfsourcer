//Dynamically renders list of writer group links through Javascript Object Model
//Each link dynamically renders show page through Javascript Object Model
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
    $(".wg-next").on("click", function() {
      let nextId = parseInt($(".wg-next").attr("data-id")) + 1;
      $.get("/writer_groups/" + nextId + ".json", function(data) {
        let writer_group = data;
        $(".writerGroupName").text(writer_group["wg_name"]);
        $(".writerGroupCreator").text(writer_group["wg_creator"]);
        $(".writerGroupDescription").text(writer_group["wg_description"]);
        $(".wg-next").attr("data-id", writer_group["id"]);
        });
    });
});

$(function(){
    $("#wg_sort").on("click", function(e){
        $.ajax({
            method: "get",
            url: "/writer_groups"
        }).success(function(data){

            data.sort(function(a, b) {

            let nameA = a.wg_name.toUpperCase();
            let nameB = b.wg_name.toUpperCase();
            
            if (nameA < nameB) {
                return -1;
            }
            if (nameA > nameB) {
                return 1;
            }
            
                return 0;
            });
            
            let $ul = $("div.writer_groups_sorted ul")

            $ul.html("");
            data.forEach(function(writer_group){
                $ul.append("<li>" + writer_group.wg_name + " - " + writer_group.wg_creator + "</li>");
            });
        });
        e.preventDefault();
    })
})

//Form submitted dynamically through Javascript Object Model
//Dynamically renders data from newly created instance through Javascript Object Model
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
   