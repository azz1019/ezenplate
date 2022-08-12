document.getElementById('boardRemove').addEventListener('click', (e) => {
    e.preventDefault();
    const bnoVal = document.getElementById('bnoVal').innerText;
    document.getElementById('bno').value = bnoVal;
    const delForm = document.getElementById('boardRmForm');
    delForm.setAttribute('action', '/board/remove');
    alert("게시물이 삭제되었습니다");
    delForm.submit();
});