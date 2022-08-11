document.addEventListener('click', (e) => {
if (e.target.classList.contains("img")) {
    let modalZoneTag = document.getElementById('modalZone2');
    let thsrc = e.target.getAttribute("src").toString();
    let imgsrc = thsrc.replace("_th_", "_");
    console.log(imgsrc);
    modalZoneTag.innerHTML = `<img src="${imgsrc}" class="mx-auto d-block">`

    document.getElementById('modalBtn2').click();

      }
});

document.getElementById('boardRemove').addEventListener('click', (e) => {
    e.preventDefault();
    const bnoVal = document.getElementById('bnoVal').innerText;
    document.getElementById('bno').value = bnoVal;
    const delForm = document.getElementById('boardRmForm');
    delForm.setAttribute('action', '/board/remove');
    delForm.submit();
});