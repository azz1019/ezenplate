document.getElementById('reviewRemove').addEventListener('click', (e) => {
    e.preventDefault();

    let rnoVal = document.getElementById('rnoVal').innerText;
    document.getElementById('rno').value = rnoVal;
    const delForm = document.getElementById('reviewRmForm');
    delForm.setAttribute('action', '/review/myremove');
    delForm.submit();
});