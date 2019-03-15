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

class WgWork {
    constructor(obj){
        this.id = obj.id
        this.author = obj.author
        this.bio = obj.bio
        this.title = obj.title
        this.version = obj.version
        this.content = obj.content
        this.wg_comments = obj.wg_comments
    }
}