$(function () {
  $(".js-more").on('click', function() {
    let id = $(this).data("id");
    $.get("/funding_projects/" + id + "/body", function(data) {
      $("#body-" + id).text(data);
      $(".js-more").remove();
    });
  });
});

$(function () {
  $("#largest_pledge_btn").on('click', function(e) {
    e.preventDefault();

    let fpId = parseInt($("#largest_pledge_btn").attr("data-id"));

    $.get("/funding_projects/" + fpId + "/pledges" + ".json", function(data) {
      
      const dataArray = data

      dataArray.map(pledge => pledge.amount)

      let amountsArr = dataArray.map(pledge => pledge.amount)
          
      let largestPledge = Math.max(...amountsArr)

      $("#largest_pledge").append(largestPledge)
    });
  });
})

$(function(){
  $("form").submit(function(e){
    e.preventDefault();
    $.ajax({
      method: "get",
      dataType: "json",
      url: "/funding_projects"
    }).success(function(data){

      const fp_input = $("#fps_search_input").val();

      $("#fps_search_results").html("")

      data.filter(function(fp){
        
        if (fp.title.toLowerCase().includes(fp_input)){
          $("#fps_search_results").append("<li>" + "<a " + "href='" + "/funding_projects/" + fp.id + "' >" + fp.title + "</a>" + "</li>");
        };
      });
    });
  });
});
