async function spread_review_sno(sno) {
    try {
    
        
        const resp = await fetch('/review/' + sno);
        const result = await resp.json();
        return await result;
    } catch (error) {
        console.log(error);
    }
}

function get_review_list() {

    let sno = document.getElementById('sno').value;
    let email = document.getElementById('email').value
    
    spread_review_sno(sno).then(result => {
        if (result != null) {
            for (const list of result) {

                let review_list = document.getElementById('review_list');
                let review_inner = '';
                review_inner += `<div class="customer-review_wrap">`;
                review_inner += `<div class="customer-img">`;
                review_inner += `<p>${list.rvo.writer}</p>`;
                review_inner += `</div>`;
                review_inner += `<div class="customer-content-wrap">`;
                review_inner += `<div class="customer-content">`;
                review_inner += `<div class="customer-review">`;
                if(list.rvo.title == null){
                    review_inner += `<h6>제목 없음</h6>`;
                } else {
                    
                    review_inner += `<a style="inherited:no; border:0px;" href="/review/mydetail?rno=${list.rvo.rno}"><h6>${list.rvo.title}</h6></a>`;
                    
                }
                let rate = Math.floor(list.rvo.rate);
                console.log(rate);
                for (let i = 1; i <= 5; i++) {          
                    if(rate<2 && rate >= i){
                        review_inner += `<span class="bg-danger"></span>`;
                    } else if (rate<4 && rate >= i){
                        review_inner += `<span class="bg-warning"></span>`;
                    } else if (rate >=4 && rate >= i){
                        review_inner += `<span></span>`;
                    } else {
                        review_inner += `<span class="round-icon-blank"></span>`;
                    }
                }
                
                
                review_inner += `<p>${list.rvo.modAt}</p>`;
                review_inner += `</div>`;
                if (list.rvo.rate < 2) {
                    review_inner += `<div class="customer-rating bg-danger">${list.rvo.rate}</div>`;
                } else if (list.rvo.rate >= 2 && list.rvo.rate < 4) {
                    review_inner += `<div class="customer-rating bg-warning">${list.rvo.rate}</div>`;
                } else {
                    review_inner += `<div class="customer-rating">${list.rvo.rate}</div>`;
                }
                review_inner += `</div>`;
                review_inner += `<p class="customer-text">${list.rvo.content}`;
                review_inner += `</p>`;
                review_inner += `<ul>`;
                if (list.fileList != null) {
                    for (const fvo of list.fileList) { 
                        let dir = fvo.saveDir.toString();
                        let saveDir = dir.replace("/\\/g",'/');
                        review_inner += `<li><img src="/upload/${saveDir}/${fvo.uuid}_th_${fvo.fileName}" class="img-fluid" alt="#"></li>`;

                    }

                }
                review_inner += `</ul>`;
                review_inner += `<span>28 people marked this review as helpful</span>`;
                console.log(list.rvo.writer == email);
                console.log(list.rvo.writer);
                console.log(email);
                if(list.rvo.writer == email){
                    review_inner += `<form action = "/review/mymodify" method="get">`;
                    review_inner += `<input type="hidden" value="${list.rvo.rno}" name="rno">`;
                    review_inner += `<input type="hidden" value="${list.rvo.sno}" name="sno">`;
                    review_inner += `<button type="submit" class="bg-warning"><a id="report"><span class="icon-like"></span>modify</a></button>`;
                    review_inner += `</form>`;
                    review_inner += `<form action = "/review/remove" method="post">`;
                    review_inner += `<input type="hidden" value="${list.rvo.rno}" name="rno">`;
                    review_inner += `<input type="hidden" value="${list.rvo.sno}" name="sno">`;
                    review_inner += `<button type="submit" class="bg-danger"><a id="report"><span class="icon-like"></span>Remove</a></button>`;
                    review_inner += `</form>`;
                    
                }
                if(email != ''){
                    
                    review_inner += `<form action = "/review/report" method="post">`;
                    review_inner += `<input type="hidden" value="${list.rvo.rno}" name="rno">`;
                    review_inner += `<input type="hidden" value="${list.rvo.sno}" name="sno">`;
                    review_inner += `<button type="submit"><a id="report"><span class="icon-like"></span>reprot</a></button>`;
                    review_inner += `</form>`;
                }
                review_inner += `</div>`;
                review_inner += ` </div>`;
                review_inner += `<hr>`;
                review_list.innerHTML += review_inner;
            }
        }
    }
    );
}

