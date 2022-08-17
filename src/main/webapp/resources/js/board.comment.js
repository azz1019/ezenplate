

async function postCommentToServer(cmtData){
  try {
    const url = '/comment/post';
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify(cmtData)
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;  
  } catch (error) {
    console.log(error);
  }  
}

document.getElementById('cmtSbmBtn').addEventListener('click', (e) => {
  const cmtInputObj = document.getElementById('cmtText');
  if(cmtInputObj.value == null || cmtInputObj.value == ''){
    alert('댓글 내용을 입력해 주세요');
    cmtInputObj.focus();
    return false;
  }else {
    let cmtData = {
      bno : document.getElementById('bnoVal').innerText,
      writer : document.getElementById('cmtWriter').innerText,
      content : cmtInputObj.value
    };
    console.log(cmtData);
    postCommentToServer(cmtData).then(result => {
      if(parseInt(result)) {
        alert('댓글이 등록되었습니다.');
        cmtInputObj.value = "";
        getCommentList(document.getElementById('bnoVal').innerText);
      }
    });
  }
});

async function spreadCommentFromServer(bnoVal, pageNo) {
  try {
      const resp = await fetch('/comment/'+bnoVal+"/"+pageNo); 
      const pagingHandler = await resp.json();
      return await pagingHandler; 
  } catch (error) {
    console.log(error);
  }
}


function getCommentList(bnoVal, pageNo=1){ // 없으면 1로 세팅한다 
  spreadCommentFromServer(bnoVal, pageNo).then(result => {
    console.log(result);
    const sesWriter = document.getElementById('cmtWriter').innerText;
    if (result.cmtList.length && pageNo == 1) {
      let tag = `<div class="commentForm">`;
      tag += `<div class="entry-comments-body">`;
      for (const cvo of result.cmtList) {
        console.log(cvo.modAt);
      tag += `<div>`;
      tag += `<span class="entry-comments-author">${cvo.writer}</span> `;
      tag += `<span class="entry-comments-date">${cvo.modAt}</span>`;
      if(sesWriter.trim() == cvo.writer.trim()){
      tag += `<span class ="buttons">`;
      tag += `<button class="btn cmtMod" data-cno="${cvo.cno}">수정</button> &ensp; `;
      tag += `<button class="btn cmtDel" data-cno="${cvo.cno}">삭제</button>`;
      tag += `</span>`;
      tag += `</div>`;
      }
      tag += `<p id="contents">${cvo.content}</p>`;
      }
      tag += '</div></div>';
      document.getElementById('cmtZone').innerHTML = tag;
    } else if(pageNo > 1){
      console.log(pageNo);
      const tbodyTag = document.querySelector('.entry-comments-body');
      let tag = '';
      console.log(result.cmtList);
      for (const cvo of result.cmtList) {
      tag += `<div>`;
      tag += `<span class="entry-comments-author">${cvo.writer}</span> `;
      tag += `<span class="entry-comments-date">${cvo.modAt}</span>`;
      console.log(sesWriter,cvo.writer.trim());
        if(sesWriter.trim() == cvo.writer.trim()){
          tag += `<span class ="buttons">`;
          tag += `<button class="btn cmtMod" data-cno="${cvo.cno}">수정</button> &ensp; `;
          tag += `<button class="btn cmtDel" data-cno="${cvo.cno}">삭제</button>`;
          console.log(cvo.cno);
          tag += `</span>`;
          tag += `</div>`;
          }
        tag += `<p id="contents">${cvo.content}</p>`;
        tag += `</div>`;
      }
      tag += '</div>';
      tbodyTag.innerHTML += tag;
    }else {
      // 리스트가 존재하지 않을 때 DOM
      let tag = `<div>`;
          tag += `댓글이 존재하지 않습니다. 새로운 댓글을 등록시켜보세요.`
          tag += '</div>';
          document.getElementById('cmtZone').innerHTML = tag;
    }

    const moreBtn = document.getElementById('moreBtn');
    if(pageNo < parseInt(Math.ceil(result.totalCount / 10.0))){
      moreBtn.style.visibility = 'visible';
      let pageIdx = moreBtn.dataset.page;
      moreBtn.dataset.page = parseInt(pageIdx) + 1; // ++ or +1 -> 1개 올려줘야함 
    } else {
      moreBtn.style.visibility = 'hidden';
    }
  });
}
async function commentUpdateToServer(cmtData) {
  try {
    const url = "/comment/"+cmtData.cno;
    const config = {
      method: 'PUT', // PATCH도 가능
      headers: {
        'Content-Type':'application/json; charset=utf-8'
      },
      body: JSON.stringify(cmtData)
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;  
  } catch (error) {
    console.log(error);
  }
}

async function commentRemoveFromServer(cnoVal){
  try {
    const url = "/comment/" + cnoVal;
    const config ={
      method: 'DELETE'
    }
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;  
  } catch (error) {
    console.log(error);
  }
}

document.addEventListener('click', (e) => {
  if(e.target.classList.contains('cmtMod')){ 
    console.log("hello-1");
    const cnoVal = e.target.dataset.cno; 
    const contentVal = document.getElementById('contents').innerText;  
    console.log(contentVal);
    document.querySelector('.modal-body').innerHTML
     = `<input type="text" class="form-control cmtModifiedText" value="${contentVal}">`;
     console.log("hello-2");
     document.querySelector(".modSbmBtn").dataset.cno = cnoVal;
     document.getElementById('modalBtn').click();    
  }
  if(e.target.classList.contains('modSbmBtn')){
    const cmtModInput = document.querySelector('.cmtModifiedText'); 
    const cmtTextVal = cmtModInput.value;
    if(cmtTextVal == '') {
      alert('수정할 댓글 내용을 입력하세요!');
      cmtModInput.focus();
      return false;
    }else{
      const cmtData = {
        cno: e.target.dataset.cno,
        content: cmtTextVal
      };
      commentUpdateToServer(cmtData).then(result => {
        if(parseInt(result)){
          document.querySelector('.btn-close').click();        
        }
        getCommentList(document.getElementById('bnoVal').innerText);
      });
    }
  }
  if(e.target.classList.contains('cmtDel')){
    const cnoVal = e.target.dataset.cno;
    commentRemoveFromServer(cnoVal).then(result => {
      if(parseInt(result)){
        alert("댓글이 삭제되었습니다");
        getCommentList(document.getElementById('bnoVal').innerText);
      }
    });
  }
  

  if(e.target.id == 'moreBtn'){
    e.preventDefault();
    const bnoVal = document.getElementById('bnoVal').innerText;
    const page = e.target.dataset.page;
    getCommentList(bnoVal, parseInt(page));
  }
});





