/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const buyBtnsdk = document.querySelectorAll('.js-buy-dangnhap')
const modeldk = document.querySelector('.js-model-open')
const modelClosedk = document.querySelector('.js-model-close-dk')
const modelContainerdk = document.querySelector('.js-model-container-dk')

function showBuy(){
    modeldk.classList.add('open')
}
function hideBuy(){
    modeldk.classList.remove('open')
}
for(const buyBtndk of buyBtnsdk){
    buyBtndk.addEventListener('click', showBuy)
}
modelClosedk.addEventListener('click' , hideBuy)
modeldk.addEventListener('click', hideBuy)
modelContainerdk.addEventListener('click', function(event){
    event.stopPropagation()
})

function show(){
    var x = document.getElementById("hidden");
    if (x.style.display != "block"){
        x.style.display = "block";
    }else x.style.display = "none";
}