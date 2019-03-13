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

    $ul.append("<li>" + "hello" + "</li>");
  //  let fpId = $(this).data("id");


  //  $.get("/funding_projects/" + fpId)


  // console.log("This button makes a list of items.")
    e.preventDefault();
  });
});
 

// 

//               json object must be accessed
//               need to access id of funding project from json object
//                need to access pledges
//                  need to access id and amount of each pledge associated with the funding_project
//                  needs to render associated funding_project and pledges in a list on the funding_project 
//                      in the list provided below the link event



//  $("a.all_pledges").on("click", function(e){
//   $.get(this.href).success(function(json){

//     let $ul = $("div.fpPledges ul")


// //              needs to access pledges for the funding_project from json object

//   let $ul = $(this).data
//   $ul.html("");
//   json.forEach(function(funding_project, pledge){
//       $ul.append("<li>" + "<a " + "href='" + "/funding_projects/" + funding_project.id + "/pledges/" + "</a>" + "</li>");
//       // + pledge.id + "' >" + pledge.amount
//         });
//     });
//     e.preventDefault();
// })
// })


// $(document).ready(function() {
//   $("#text").append("this is a test.");
// });

// $(function () {
//     $(".js-more").on('click', function() {
//       let id = $(this).data("id");
//       $.get("/funding_projects/", function(data) {
//         // Replace text of body-id div
//         $("#description-" + id).text(data);
//       });
//     });
//   });


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

// $(function(){
//   $("form#new_funding_project").on("submit", function(e){
//     alert("You've created a new project!");
//     e.preventDefault();

//     let $form = $(this);
//     let action = $form.attr("action");
//     let params = $form.serialize()

//     $.post(action, params)
//     // console.log("A Project is Born!");
//   })
// })


// $(function(){

  //         // event handler
  
  //   $("a.all_pledges").on("click", function(e){
  //     $.get(this.href).success(function(json){
  
  //       let $ul = $("div.fpPledges ul")
  
  
  // //              needs to access pledges for the funding_project from json object
  
  //     let $ul = $(this).data
  //     $ul.html("");
  //     json.forEach(function(funding_project, pledge){
  //         $ul.append("<li>" + "<a " + "href='" + "/funding_projects/" + funding_project.id + "/pledges/" + "</a>" + "</li>");
  //         // + pledge.id + "' >" + pledge.amount
  //           });
  //       });
  //       e.preventDefault();
  //   })
  // })
  