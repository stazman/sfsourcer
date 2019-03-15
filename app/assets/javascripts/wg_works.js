// $(function(){
//     console.log("wg_works.js is loading");
//     wgCommentsListener();
// })


function wgCommentsListener(){
    $("#load-wg-comments").on('click', function(event){
        console.log('This button is working');
        event.preventDefault();
    })
}