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
  $("a.load_all_fps").on("click", function(e){
    $.ajax({
      url: "http://localhost:8080/funding_projects",
      method: 'get',
      dataType: 'json'
    }).done(function(json){

      let $ul = $("div.all_fps ul");

      json.forEach(function(funding_project){
        $ul.append("<li>" + "<a " + "href='" + "/funding_projects/" + funding_project.id + "' >" + funding_project.title + "</a>" + "</li>");
      });
    });  
    e.preventDefault();
  });
});

$(function(){
  $("form").submit(function(e){
    e.preventDefault();
    $.ajax({
      method: "get",
      dataType: "json",
      url: "/funding_projects"
    }).success(function(data){

      const fp_input = $("#fps_search_input").val();

      data.filter(function(fp){

        if (fp.title.toLowerCase().includes(fp_input)){
          $("#fps_search_results").append("<li>" + fp.title + "</li>");
        };
      });
    });
  });
});
