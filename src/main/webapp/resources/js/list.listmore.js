async function spreadCommentFromServer(pageNo){
    try {
        const resp = await fetch('/list/reviewlist'+pageNo);
        const pagingHandler = await resp.json();
        return await pagingHandler;
    } catch (error) {
        console.log(error);
    }
}
function getCommentList(pageNo=1){
    spreadCommentFromServer(pageNo).then(result =>{
        console.log(result);
        if(result.rvwList.lenght && pageNo == 1){
            let tag = '<thead><tr><th>Writer</th><th>Content</th><th>Mod At</th><th>Feature</th></tr></thead>';
            tag += '<tbody id="cmtTbody">';
            for(const rvo of result.rvwList){
                tag += '<tr>'
                tag +=`<td>${rvo.witer}</td>`;
                tag +=`</tr>`
            }
            tag +='</tbody>';
            document.getElementById('cmtZone').innerHTML = tag;
        }else if(pageNo > 1){
            const tbodyTag = document.getElementById('cmtTbody');
            let tag = '';
            for(const rvo of result.rvwList){
                tag +='<tr>'
                tag +=`<td>${rvo.witer}</td>`;
                tag +=`</tr>`
            }
            tbodyTag.innerHTML += tag;
        }else{


        }
        const moreBtn = document.getElementById('moreBtn');
        if(pageNo < parseInt(Math.ceil(result.totalCount/10.0))){
            moreBtn.style.visibility = 'visible';
            let pageIdx = moreBtn.dataset.page;
            moreBtn.dataset.page = parseInt(pageIdx) +1;
        }else{
            moreBtn.style.visibility = 'hidden';
        }
    });
}


document.addEventListener('click',(e)=>{
    if(e.target.id == 'moreBtn'){
        e.preventDefault();
        const page = e.target.dataset.page;
        getCommentList(parseInt(page)+1);
      }
});