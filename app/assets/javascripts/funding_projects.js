$(function () {
  $(".js-more").on('click', function() {
    // get the id from the data attribute
    let id = $(this).data("id");
    $.get("/funding_projects/" + id + "/body", function(data) {
      $("#body-" + id).text(data);
    });
  });
});

