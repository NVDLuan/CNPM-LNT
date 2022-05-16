
function addToCart(productId){
    let url = "/CNPM-LNT-spring/api/cart/"+productId;
    fetch(url).then(res=>res.json()).then(data=>{
        var count = document.getElementById("cart-count");
        count.innerText= data;
        alert("Thêm vào giỏ hàng thành công");

    });
}

function deleteCart(productId){
    var tmp = confirm("bạn có chắc chắn muốn xóa sản phẩm này ra khỏi giỏ hàng không? ");
    if(tmp){
        let url = "/CNPM-LNT-spring/api/cart/delete/"+productId;
        fetch(url).then(res=>res.json()).then(data=>{
            var area = document.getElementById(`giohang--${productId}`);
            area.innerHTML="";
            area.style.display= "none";
            var count = document.getElementById("cart-count");
            count.innerText= data;
            capnhatSum();
        })
    }
}

function them(productId){
    let url = "/CNPM-LNT-spring/api/cart/add/"+productId;
    console.log(url);
    fetch(url).then(res=>res.json()).then(data=>{
        var area = document.getElementById(`count-cart-${productId}`);
        area.value= parseInt(area.value)+1;
        var count = document.getElementById("cart-count");
        count.innerText= data;
        capnhatSum();
    })
}

function bot(productId){
    let area = document.getElementById(`count-cart-${productId}`);
    if(parseInt(area.value)>1){
        let url = "/CNPM-LNT-spring/api/cart/tru/"+productId;
        console.log(url);
        fetch(url).then(res=>res.json()).then(data=>{
            var area = document.getElementById(`count-cart-${productId}`);
            area.value= parseInt(area.value)-1;
            var count = document.getElementById("cart-count");
            count.innerText= data;
            capnhatSum();
        })
    }
}
function capnhatSum (){
    var gia = document.getElementsByClassName("price");
    var counts = document.getElementsByClassName("counter-cart");
    var sum =0;
    for(i=0; i<gia.length; i++){
        console.log(gia[i].innerText);
        sum += parseInt(gia[i].innerText)* parseInt(counts[i].value);
        console.log(sum);
    }
    document.getElementById("sumMoney").innerText=viewMoney(sum.toString());
    document.getElementById("sumMoneytmp").innerText=viewMoney(sum.toString());
}
window.addEventListener("load", capnhatSum());
function viewMoney(money){
    result ="0đ";
    len = money.length/3;
    console.log(len)

    for(i=0; i<len; i++){
        console.log(i);
        if(i==0){
            tmp =money.slice(-3);
            if(tmp!=null){
                result= tmp+"VND";
            }
        }
        else{
            tmp= money.slice((i+1)*-3, i*(-3));
            console.log(tmp)
            if(tmp!=null || tmp!=""){
                result= tmp + "."+result;
            }
        }


    }
    return result;

}