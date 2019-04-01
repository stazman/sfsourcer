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
  $("#largest_pledge_btn").on('click', function(e) {
      e.preventDefault();

      let fpId = parseInt($("#largest_pledge_btn").attr("data-id"));

      $.get("/funding_projects/" + fpId + "/pledges" + ".json", function(data) {
        
        const dataArray = data

        dataArray.map(pledge => pledge.amount)

        let amountsArr = dataArray.map(pledge => pledge.amount)
            
        let largestPledge = Math.max(...amountsArr)

        $("#largest_pledge").append(largestPledge)
      })
  })
})

$(function () {
  let pledgeId = parseInt($("#sourcer_credit").attr("data-id"));
  $.get("/pledges/" + pledgeId + ".json", function(data) {

    let $getCredit = $("#sourcer_credit")

    let pledge = data;

    let pledgeAmount = pledge["amount"]

    function creditMaker (multiplier){
      return function creditMultiplier (pledgeAmount){
          multiplier * pledgeAmount
      }
    }

    const multiplyByOnePercent = creditMaker(.01);

    multiplyByOnePercent(pledgeAmount);

    if (pledgeAmount <= 50 ){
    $getCredit.append(multiplyByOnePercent);
    } else if (pledgeAmount > 50 ){
      const multiplyByTwoPercent = creditMaker(.02);
      multiplyByTwoPercent(pledgeAmount);
      $getCredit.append(multiplyByTwpPercent);
    }
  });
});

  
      //   dataArray.forEach(function(element, index, array) {
      //     console.log(element.amount); // 100, 200, 300
      //     debugger
      //     console.log(index); // 0, 1, 2
      //     console.log(array); // same myArray object 3 times
      // });
        // var myMap = new Map(data);
        // debugger

        // myMap.get("amount")

          // data.map(function(pledge){ 
          //   debugger

          //   var pledgeKey = []
          //   pledgeKey[pledge] = pledge.value
          //   for (const nestedKey in pledgeKey) {
          //     debugger
          //       return pledgeKey[nestedKey];
          //   }

          // return pledge.amount                                    

            // var rObj = {};
            // debugger
            // rObj[obj.amount] = obj.value;
            //   debugger

        // var arr = [
        //   { id: 15 },
        //   { id: -1 },
        //   { id: 0 },
        //   { id: 3 },
        //   { id: 12.2 },
        //   { },
        //   { id: null },
        //   { id: NaN },
        //   { id: 'undefined' }
        // ];
        
        // var invalidEntries = 0;
        
        // function isNumber(obj) {
        //   return obj !== undefined && typeof(obj) === 'number' && !isNaN(obj);
        // }
        
        // function filterByID(item) {
        //   if (isNumber(item.id) && item.id !== 0) {
        //     return true;
        //   } 
        //   invalidEntries++;
        //   return false; 
        // }
        
        // var arrByID = arr.filter(filterByID);
        
        // forEach(function(fp_pledge){
        //   debugger

        //   if (fp_pledge.amount === fp_pledge.amount.max){
            
        //   $result.append(fp_pledge.amount);
        //   }
        // })

        // let fpPledges = data;
          // const digDeep = function  (data) {
          //   for (const key in data) {
          //     if (typeof data[key] === 'object') {
          //       for (const nestedKey in data[key]) {
          //         return data[key][nestedKey];
        
          //       }
          //       debugger
          //     } else {
          //       console.log(target[key]);
          //     }
          //   }
          // })
          // $("#largest_pledge").text(digDeep.amount);             
            // filter( pledge => pledge.amount === 20)
