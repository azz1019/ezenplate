async function view_all() {
    try {
        const url = '/async/view_more';
        const config = {
            method: 'post',
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('view_all').addEventListener('click', (e) => {
    let list_zone = document.getElementById('list_zone');
    list_zone.innerHTML='';
    view_all().then(result => {
        for (const list of result) {
            let view = '';
            view =`<div class="col-md-4 featured-responsive">`;
            view +=`<div class="featured-place-wrap">`;
            view +=`<a href="/store/detail?sno=${list.svo.sno }">`;
            if(list.fileList != null){
                
                for (const fvo of list.fileList) {
                    let dir = fvo.saveDir.toString();
                    let saveDir = dir.replace("/\\/g",'/');
                    view +=`<img src="/upload/${saveDir}/${fvo.uuid}_th_${fvo.fileName}" class="img-fluid">`;
                    
                }   
            }
            view +=`<c:choose>`;
            view +=`<c:when test="${list.svo.rateAvg <= 2.0 }">`;
    
            view +=`<span class="featured-rating">${Math.round(list.svo.rateAvg * 10) / 10.0}</span>`;
            view +=`</c:when>`;
            view +=`<c:when test="${list.svo.rateAvg > 2.0 && list.svo.rateAvg < 4.0}">`;
            view +=`<span class="featured-rating-orange">${Math.round(list.svo.rateAvg * 10) / 10.0}</span>`;
            view +=`</c:when>`;
            view +=`<c:when test="${list.svo.rateAvg >= 4.0}">`;
            view +=`<span class="featured-rating-green">${Math.round(list.svo.rateAvg * 10) / 10.0}</span>`;
            view +=`</c:when>`;
            view +=`</c:choose>`;
            view +=`<div class="featured-title-box">`;
            view +=`<h6>${list.svo.sname}</h6>`;
            view +=`<p>${list.svo.category} </p> <span>• </span>`;
            view +=`<p>${list.svo.cmtQty}</p> <span> • </span>`;
            view +=`<p><span>$$$</span>$$</p>`;
            view +=`<ul>`;
            view +=`<li><span class="icon-location-pin"></span>`;
            view +=`<p>${list.svo.locate}</p>`;
            view +=`</li>`;
            view +=`<li><span class="icon-screen-smartphone"></span>`;
            view +=`<p>${list.svo.tel}</p>`;
            view +=`</li>`;
    
    
            view +=`</ul>`;
            view +=`<div class="bottom-icons">`;
            view +=`<div class="closed-now">CLOSED NOW</div>`;
            view +=`<span class="ti-heart"></span>`;
            view +=`<span class="ti-bookmark"></span>`;
            view +=`</div>`;
            view +=`</div>`;
            view +=`</a>`;
            view +=`</div>`;
            view +=`</div>`; 
            list_zone.innerHTML += view;
        }
        
    });

});