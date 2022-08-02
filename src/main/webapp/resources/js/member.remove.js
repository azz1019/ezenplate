document.getElementById('memberRemove').addEventListener('click', (e) => {
    e.preventDefault();

    let emailVal = document.getElementById('emailVal').innerText;
    document.getElementById('email').value = emailVal;
    const delForm = document.getElementById('memberRmForm');
    delForm.setAttribute('action', '/member/remove');
    delForm.submit();
});