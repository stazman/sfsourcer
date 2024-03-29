$(function(){
    wgCommentsListener();
})


function wgCommentsListener(){
    $("#load-wg-work-comments").on('click', function(event){
        getWgWorks();
        event.preventDefault();
    })
}

function getWgWorks(){
    $.ajax({
        url: "http://localhost:8080/wg_works",
        method: 'get',
        dataType: 'json'
    }).done(function(data){
        // debugger
 
    //Dynamically renders data from specific instance through JavaScript Object Model
        let wgWorkData = new WgWork(data[5]);
       
        let wgWorkDataHTML = wgWorkData.wgWorkCommentsHTML();
 
        document.getElementById("show-wg-work-comments").innerHTML += wgWorkDataHTML;
        // debugger
    });
 }
 
 //Dynamically renders has_many relationship, wg_work/wg_comments
 //Translates JSON responses into Javascript Model Objects using class/constructor syntax  
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
 
 //Calls the wgWorkCommentsHTML method on a prototype of the WgWork class to dynmically render wg_comment data
 WgWork.prototype.wgWorkCommentsHTML = function (){

    let wgComments = this.wg_comments.map(wg_comment => {

        return (`
            <p>${wg_comment.content}</p>
            <br>
        `)
    });


    return (`
        <div>
            <h5>Title: ${this.title} - ${this.version}</h5>
            <p>Author: ${this.author}</p>
            <p>${this.content}</p>
            <br>
            <h5>Current Feedback</h5>
            <p>${wgComments}</p>
        </div>`)
 };