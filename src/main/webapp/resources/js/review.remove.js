document.getElementById('reviewRemove').addEventListener('click', (e) => {
    e.preventDefault();

    let rnoVal = document.getElementById('rnoVal').innerText;
    document.getElementById('rno_1').value = rnoVal;
    const delForm = document.getElementById('reviewRemoveForm');
    delForm.setAttribute('action', '/review/reportremove');
    delForm.submit();
});
