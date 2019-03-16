$(function () {
  $(".js-more").on('click', function() {
    // get the id from the data attribute
    let id = $(this).data("id");
    $.get("/funding_projects/" + id + "/body", function(data) {
      $("#body-" + id).text(data);
    });
  });
});

$(function () {
  $("#all_pledges").on('click', function(e) {
    
    let $ul = $("div.fpPledges ul");

    $ul.html = "";

    $.ajax({
      method: "GET",
      url: "/funding_projects/1/pledges",
      //is not dynamic; only renders the exact url for first funding_project
      dataType: "json",
      }).done(function(json){
        json.forEach(function(pledge){
        $ul.append("<li>" + pledge.amount + "</li>");
      });
    });
    e.preventDefault();
  });
});