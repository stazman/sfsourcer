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

//this function kept here for sourcer credit feature to be completed

// $(function () {

//   let pledgeId = parseInt($("#sourcer_credit").attr("data-id"));

//   $.get("/pledges/" + pledgeId + ".json", function(data) {

//     let $getCredit = $("#sourcer_credit")

//     let pledge = data;

//     let pledgeAmount = pledge["amount"]

//     function creditMaker (multiplier){
//       return function creditMultiplier (pledgeAmount){
//           multiplier * pledgeAmount
//       };
//     };

//     const multiplyByOnePercent = creditMaker(.01);

//     multiplyByOnePercent(pledgeAmount);

//     if (pledgeAmount <= 50 ){

//     $getCredit.append(multiplyByOnePercent);

//     } else if (pledgeAmount > 50 ){
      
//       const multiplyByTwoPercent = creditMaker(.02);
      
//       multiplyByTwoPercent(pledgeAmount);
      
//       $getCredit.append(multiplyByTwpPercent);
//     };
//   });
// });

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