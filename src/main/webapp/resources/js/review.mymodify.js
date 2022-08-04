const regExpPrevent = new RegExp("\.(exe|sh|bat|js|msi|dll)$"); // 실행파일 막기
const regExpImage = new RegExp("\.(jpg|jpeg|png|gif)"); // 이미지 파일만 허용
const maxSize = 2 * 1024 * 1024; // 2MB

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
    if(e.target.id == 'files') {
        document.getElementById('regBtn').disabled = false;
        // input type file element에 저장된 file정보를 가져오는 property, 리턴은 객체형
        const fileObjects = document.getElementById('files').files;
        console.log(fileObjects);

        let div = document.getElementById('fileZone');
        div.innerHTML = '';
        let ul = `<ul class="list-group list-group-flush">`;
        let isOk = 1;

        for (const file of fileObjects) {
            let vaildFile = fileSizeAndTypeValidation(file.name, file.size);
            isOk *= vaildFile;

            ul += `<li class="${vaildFile ? "bg-success text-white" : "bg-danger text-white"} list-group-item d-flex justify-content-between align-items-start">`;
            ul += `<div class="ms-2 me-auto">${file.name}</div>`;
            ul += `<span class="badge bg-primary rounded-pill">${file.size}</span></li>`;
        }
        ul += `</ul>`;
        div.innerHTML = ul;

        if(isOk == 0) {
            document.getElementById('regBtn').disabled = true;
        }
    }
});

async function removeFileAtServer(uuid) {
    try {
        const url = '/review/file/'+uuid;
        const config = {
            method: 'delete'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click', (e) => {
    if(e.target.classList.contains('fileDelBtn')){
        removeFileAtServer(e.target.dataset.uuid).then(result => {
            console.log(result);
            alert('파일 삭제'+ (parseInt(result) > 0 ? "완료" : "실패"));
            if(parseInt(result)){
                e.target.closest('li').remove();
            }
        });
    }
});