// $(function(){
//     console.log("wg_works.js is loading");
//     wgCommentsListener();
// })


function wgCommentsListener(){
    $("#load-wg-comments").on('click', function(event){
        // console.log('This button is working');
        getWgWorks();
        event.preventDefault();
    })
}

function getWgWorks () {
    $.ajax ({
        url: "http://localhost:8080/wg_works",
        method: 'get',
        dataType: 'json'
    }).done(function(data){
        // console.log(data);

    });
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

WgWork.prototype.wgWorkHTML = function (){

    let wgWorkComments = this.wg_comments.map(wg_comment => {
        return (
            `<ul>
                <li> + wg_comment.content + </li>
                <li> + wg_comment.author + </li>
            </ul>`)
    })
}