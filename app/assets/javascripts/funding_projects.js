$(function () {
  $(".js-more").on('click', function() {
    // get the id from the data attribute
    let id = $(this).data("id");
    $.get("/funding_projects/" + id + "/body", function(data) {
      $("#body-" + id).text(data);
    });
  });
});

// $(function () {
//   $("#all_pledges").on('click', function(e) {
    
//     let $ul = $("div.fpPledges ul");

//     $ul.html = "";

//     let id = $(this).data("id");


//     $.get("/funding_projects/" + id + "/pledges", function(){
//         json.forEach(function(pledge){
//         $ul.append("<li>" + pledge.amount + "</li>");
//       });
//     });
//     e.preventDefault();
//   });
// });

function getFundingProjects(){
  $.ajax({
      url: "http://localhost:8080/funding_projects",
      method: 'get',
      dataType: 'json'
  }).done(function(data){

      let fpData = new WgWork(data);
     
      let fpDataHTML = fpData.wgWorkCommentsHTML();

      document.getElementById("show-wg-work-comments").innerHTML += fpDataHTML;
  });
}

class FundingProject {
  constructor(obj){
      this.id = obj.id
      this.title = obj.title
      this.description = obj.description
      this.funding_goal = obj.funding_goal
      this.pledges = obj.pledges
  }
}

//Calls the wgWorkCommentsHTML method on a prototype of the WgWork class to dynmically render wg_comment data
FundingProject.prototype.fpPledgesHTML = function (){

  let fpPledges = this.pledges.map(pledge => {

      return (`
          <p>${pledge.amount}</p>
          <br>
      `)
  });


  return (`
      <div>
          <h5>Title: ${this.title}</h5>
          <p>Funding Goal: ${this.funding_goal}</p>
          <p>${this.description}</p>
          <br>
          <h5>Current pledges</h5>
          <p>${fpPledges}</p>
      </div>`)
};