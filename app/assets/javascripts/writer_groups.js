//Dynamically renders list of writer group links through Javascript Object Model
//Each link dynamically renders show page through Javascript Object Model
$(function(){
    $("a.load_writer_groups").on("click", function(e){
        $.get(this.href).success(function(json){
            debugger
            let $ul = $("div.writer_groups ul")

            $ul.html("");

            json.forEach(function(writer_group){
                $ul.append("<li>" + "<a " + "href='" + "/writer_groups/" + writer_group.id + "' >" + writer_group.wg_name + "</a>" + " - " + writer_group.wg_creator + "</li>");
            });
        });
        e.preventDefault();
    })
})

$(function(){
    $("#wg_sort").on("click", function(e){
        $.ajax({
            method: "get",
            url: "/writer_groups"
        }).success(function(data){
            debugger

            //traverse array and get each Object
            //
            // let sortGroups = json.sort(function(a, b) {
            //     let nameA = a.name.toUpperCase(); // ignore upper and lowercase
            //     let nameB = b.name.toUpperCase(); // ignore upper and lowercase
            //     if (nameA < nameB) {
            //       return -1;
            //     }
            //     if (nameA > nameB) {
            //       return 1;
            //     }
              
            //     // names must be equal
            //     return 0;
            //   });
            
            let $ul = $("div.writer_groups_sorted ul")

            $ul.html("");
            data.forEach(function(writer_group){
                $ul.append("<li>" + "<a " + "href='" + "/writer_groups/" + writer_group.id + "' >" + writer_group.wg_name + "</a>" + " - " + writer_group.wg_creator + "</li>");
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
   