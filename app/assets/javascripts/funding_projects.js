$(function(){
  $("form#new_funding_project").on("submit", function(e){
    alert("You've created a new project!");
    e.preventDefault();

    let $form = $(this);
    let action = $form.attr("action");
    let params = $form.serialize()

    $.post(action, params)
    // console.log("A Project is Born!");
  })
})



$(function () {
    $(".js-more").on('click', function() {
      let id = $(this).data("id");
      $.get("/funding_projects/", function(data) {
        // Replace text of body-id div
        $("#description-" + id).text(data);
      });
    });
  });


// $('a.load_fps').on('click', function(e) {
//     alert("Here are all the projects!");
//     e.preventDefault();
// })

// $(function () {
//   $(".js-more").on('click', function() {
//     // get the id from the data attribute
//     let id = $(this).data("id");
//     $.get("/funding_projects/" + id + "/body", function(data) {
//       alert(data);
//     });
//   });
// });

