document.getElementById('storeRemove').addEventListener('click', (e) => {
    e.preventDefault();

    let snoVal = document.getElementById('snoVal').innerText;
    document.getElementById('sno').value = snoVal;
    const delForm = document.getElementById('storeRmForm');
    delForm.setAttribute('action', '/store/myremove');
    delForm.submit();
});