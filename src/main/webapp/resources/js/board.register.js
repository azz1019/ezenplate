const regExpPrevent = new RegExp("\.(exe|sh|bat|js|msi|dll)$");  
const regExpImage = new RegExp("\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$");
const maxSize = 2 * 1024 * 1024; 

function fileSizeAndTypeValidation(fileName, fileSize) {
    if(regExpPrevent.test(fileName)) {
        return 0;
    } else if(!regExpImage.test(fileName)) {
        return 0;
    } else if(fileSize > maxSize) {
        return 0;
    } else {
        return 1;
    }
}

document.addEventListener('change', (e) => {
    if(e.target.id == 'files'){
        document.getElementById('regBtn').disabled = false;

        const fileObjects = document.getElementById('files').files;
        console.log(fileObjects);

        let div = document.getElementById('fileZone');
        div.innerHTML = '';
        let ul =  ` <ul class="list-group">`;
        let isOk = 1;

        for(const file of fileObjects) {
            let validFile = fileSizeAndTypeValidation(file.name, file.size);
            isOk *= validFile;
            ul += `<li class="list-group-item ${validFile ? "list-group-item-light" : "list-group-item-danger"} col-md-12 justify-content-between align-items-start">`;
            ul += `<div class ="ms-2 me-auto">${file.name}</div>`;
            ul += `<span class="badge bg-primary rounded-pill">${file.size}</span></li>`;
        }
        ul += `</ul>`;
        div.innerHTML = ul;
        if(!isOk){
            alert("다른 파일로 올려주세요");
            document.getElementById('regBtn').disabled = true;
        }
    }

});