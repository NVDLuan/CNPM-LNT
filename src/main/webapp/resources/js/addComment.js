function addComment(idMatHang){
    let url = "/CNPM-LNT-spring/api/add-comment"
    fetch(url,
        {
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
        document.getElementById("commentId").value= "";
        console.info(data);
        
        let area = document.getElementById("commentAral");
        link = data.idAccount.avatar;
        console.log(link);
        if(link==null || link =="") link = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngitem.com%2Fmiddle%2FTiJxm_user-staff-man-profile-user-account-icon-jpg%2F&psig=AOvVaw0nmNrpVPbRsvBDcgRc7NiY&ust=1652888539476000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOjI0Ojv5vcCFQAAAAAdAAAAABAU"
        area.innerHTML = `
        <div class="comment__user">
                                <div class="comment__user--maggin">

                        
                                    <img src="`+link+`" alt="" class="comment__user--img">
                                    
                                    <br>
                                    <div class="comment__user--div my_comment">
                                        <span class="comment__user--name">${data.idAccount.user}</span>

                                        <div class="home__product--items-rating">
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <span class="comment__user--phanloai">${data.content}</span>
                                        <br>
                                        <p class="comment__user--time">${moment(data.createdDate).subtract(3, 'days').calendar()}</p>
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