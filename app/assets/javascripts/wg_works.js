$(function(){
    wgCommentsListener();
})


function wgCommentsListener(){
    $("#load-wg-work-comments").on('click', function(event){
        // console.log('This button is working');
        getWgWorks();
        event.preventDefault();
    })
}

function getWgWorks(){
    //access specific instance
    $.ajax({
        url: "http://localhost:8080/wg_works",
        method: 'get',
        dataType: 'json'
    }).done(function(data){
        // debugger
 
        let wgWorkData = new WgWork(data[0]);
       
        let wgWorkDataHTML = wgWorkData.wgWorkCommentsHTML();
 
        document.getElementById("show-wg-work-comments").innerHTML += wgWorkDataHTML;
        // debugger
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
 
 WgWork.prototype.wgWorkCommentsHTML = function (){

    let wgComments = this.wg_comments.map(wg_comment => {

        return (`
            <p>${wg_comment.content}</p>
            <br>
        `)
    });


    return (`
        <div>
            <h5>${this.title} - ${this.version}</h5>
            <p>${this.author}</p>
            <p>${this.content}</p>
            <br>
            <p>${wgComments}</p>
            <br>
        </div>`)
 };