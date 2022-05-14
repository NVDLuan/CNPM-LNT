
function addToCart(productId){
    let url = "/CNPM_LNT_spring_war/api/cart/"+productId;
    fetch(url).then(res=>res.json()).then(data=>{
        var count = document.getElementById("cart-count");
        count.innerText= data;
        alert("Thêm vào giỏ hàng thành công");
    });
}

function deleteCart(productId){
    var tmp = confirm("bạn có chắc chắn muốn xóa sản phẩm này ra khỏi giỏ hàng không? ");
    if(tmp){
        let url = "/CNPM_LNT_spring_war/api/cart/delete/"+productId;
        fetch(url).then(res=>res.json()).then(data=>{
            var area = document.getElementById(`giohang--${productId}`);
            area.style.display= "none";
            var count = document.getElementById("cart-count");
            count.innerText= data;
        })
    }
}

function them(productId){
    let url = "/CNPM_LNT_spring_war/api/cart/add/"+productId;
    console.log(url);
    fetch(url).then(res=>res.json()).then(data=>{
        var area = document.getElementById(`count-cart-${productId}`);
        area.value= parseInt(area.value)+1;
        var count = document.getElementById("cart-count");
        count.innerText= data;
    })
}

function bot(productId){
    let area = document.getElementById(`count-cart-${productId}`);
    if(parseInt(area.value)>1){
        let url = "/CNPM_LNT_spring_war/api/cart/tru/"+productId;
        console.log(url);
        fetch(url).then(res=>res.json()).then(data=>{
            var area = document.getElementById(`count-cart-${productId}`);
            area.value= parseInt(area.value)-1;
            var count = document.getElementById("cart-count");
            count.innerText= data;
        })
    }
}
// var button = document.getElementById("Thongbao");
//     button.onclick = function(){
//     confirm("Thêm vào giỏ hàng thành công");
// }