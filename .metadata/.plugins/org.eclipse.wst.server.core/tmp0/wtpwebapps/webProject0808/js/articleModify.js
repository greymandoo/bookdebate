"use strict";

const modifyForm = document.querySelector('#modifyForm');
const editBtn = document.querySelector('#editBtn');
const backBtn = document.querySelector('#backBtn');

const articleNum = modifyForm.articleNum;
const title = modifyForm.title;
const content = modifyForm.content;
const b_title = modifyForm.b_title;

backBtn.addEventListener('click',()=>{
	history.go(-1);
});

const xhr = new XMLHttpRequest();

editBtn.addEventListener('click',()=>{
	
	if(title == null || title.value == "") {
		alert('제목을 입력해주세요.');
		title.focus();
		return false;
	}
	
	if(content == null || content.value == "") {
		alert('내용을 입력해주세요');
		content.focus();
		return false;
	}
	
	var articleParam = "articleNum="+articleNum.value+"&title="+title.value+"&content="+content.value+"&b_title="+b_title.value;
	xhr.open("post","modifyArticle.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = modifyFn;
	xhr.send(articleParam);
	
});

function modifyFn () {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var writeResult = xhr.responseText;
		
		if(writeResult == 0) {
			alert('게시글 수정 실패');
			location.href = 'articleList.bo';
		} else if(writeResult == 1) {
			alert('게시글이 수정되었습니다');
			location.href = 'articleView.bo?articleNo='+articleNum.value;
		}
	}
}

document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);