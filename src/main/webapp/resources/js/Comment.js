/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload = function(){
    let date = document.querySelectorAll(".my_comment > p");
    for (let i = 0; i < date.length; i++) {
        let d = date[i];
        d.innerText = moment(d.innerText).fromNow();
    }
}



