document.getElementById('storeRemove').addEventListener('click', (e) => {
    e.preventDefault();

    let snoVal = document.getElementById('snoVal').innerText;
    document.getElementById('sno').value = snoVal;
    const delForm = document.getElementById('storeRemoveForm');
    delForm.setAttribute('action', '/store/remove');
    delForm.submit();
});
