$('a.load_fps').on('click', function(e) {
    alert("Here are all the projects!");
    e.preventDefault();
})

// $(function () {
//   $(".js-more").on('click', function() {
//     // get the id from the data attribute
//     let id = $(this).data("id");
//     $.get("/funding_projects/" + id + "/body", function(data) {
//       alert(data);
//     });
//   });
// });


$(function () {
    $(".js-more").on('click', function() {
      let id = $(this).data("id");
      $.get("/funding_projects/" + id + "/body", function(data) {
        // Replace text of body-id div
        $("#body-" + id).text(data);
      });
    });
  });


