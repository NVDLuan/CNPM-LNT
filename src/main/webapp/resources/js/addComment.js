function addComment(idMatHang){
    fetch("/CNPM_LNT_spring_war/api/add-comment", {
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("commentId").value,
            "idMatHang": idMatHang
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res){
        console.info(res)
        return res.json();
    }).then(function (data){
        console.info(data);
        
        let area = document.getElementById("commentAral");
        area.innerHTML = `
        <div class="comment__user">
                                <div class="comment__user--maggin">
                                    <img src="<c:url value="/images/1.jpg"/>" alt="" class="comment__user--img">
                                    <br>
                                    <div class="comment__user--div my_comment">
                                        <span class="comment__user--name">TNhan.ITTechnology@gmail.com</span>
                                        <div class="home__product--items-rating">
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <span class="comment__user--phanloai">${data.content}</span>
                                        <br>
                                        <p class="comment__user--time">${moment(data.createdDate).fromNow()}</p>
                                        <br>
                                        <span class="comment__user--huuich"><i class="fa-solid fa-thumbs-up mau"></i>
                                            Hữu
                                            ích</span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="comment__user--duongke"></div>
                            </div>  
        ` + area.innerHTML
    })

}