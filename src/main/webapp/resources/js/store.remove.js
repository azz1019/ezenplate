document.getElementById('storeRemove').addEventListener('click', (e) => {
    console.log("왜안돼");
    e.preventDefault();

    let snoVal = document.getElementById('snoVal').innerText;
    console.log(snoVal);
    document.getElementById('sno').value = snoVal;
    const delForm = document.getElementById('storeRemoveForm');
    delForm.setAttribute('action', '/store/remove');
    delForm.submit();
});