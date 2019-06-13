$(function () {
    $("#karma-bucks").one("click", function(e){
 
    let pledgeId = parseInt($("#karma-bucks").attr("data-id"));
 
    $.get("/pledges/" + pledgeId + ".json", function(data) {
 
        let pledgeAmount = data["amount"]
 
        let newKarmaBucks;
 
        let karmaBucksFunc = () => {
            (pledgeAmount < 10) ? newKarmaBucks = 0 : newKarmaBucks = "$" + `${(.04 * pledgeAmount).toFixed(2)}`;
            $("#new-karma-bucks").text(newKarmaBucks);
        }
        karmaBucksFunc();
    });
    e.preventDefault();
  });
 });
 