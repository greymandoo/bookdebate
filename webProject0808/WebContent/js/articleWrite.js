"use strict";

const writeForm = document.querySelector('#writeForm');
const writeBtn = document.querySelector('#writeBtn');

const title = writeForm.title;
const userId = writeForm.userId;
const parentNo = writeForm.parentNo;
const content = writeForm.content;
const b_title = writeForm.b_title;

const xhr = new XMLHttpRequest();

writeBtn.addEventListener('click',()=>{
	
	if(title == null || title.value == "") {
		alert('제목을 입력하지 않았습니다.');
		title.focus();
		return false;
	}
	
	if(content == null || content.value == "") {
		alert('내용을 입력해주세요');
		content.focus();
		return false;
	}
	
	var articleParam = "title="+title.value+"&content="+content.value+"&userId="+userId.value+"&parentNo="+parentNo.value+"&b_title="+b_title.value;
	xhr.open("post","writeArticle.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = writeFn;
	xhr.send(articleParam);
	
});

function writeFn () {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var writeResult = xhr.responseText;
		
		if(writeResult == 0) {
			alert('게시글 등록 실패');
			location.href = 'index.mo';
		} else if(writeResult == 1) {
			location.href = 'articleList.bo';
		}
	}
}

document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);