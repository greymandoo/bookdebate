"use strict";
const modifyBookForm = document.querySelector('#modifyBookForm');
const modifyBtn = document.querySelector('#modifyBtn');

const b_title = modifyBookForm.b_title;
const author = modifyBookForm.author;
const publisher = modifyBookForm.publisher;
const p_date = modifyBookForm.p_date;
const introduction = modifyBookForm.introduction;
const org_cover = modifyBookForm.org_cover;
const cover = modifyBookForm.cover;



cover.addEventListener('change',(e)=>{
	readURL(e.target);
});

function readURL(input) {
	if(input.files && input.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e) {
			document.querySelector('#preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.querySelector('#preview').src = "";
	}
}


modifyBtn.addEventListener('click',modify);

function modify () {
	
	if(b_title == null || b_title.value == "") {
		alert('제목을 입력해주세요');
		b_title.focus();
		return false;
	}
	
	if(author == null || author.value == "") {
		alert('작가를 입력해주세요');
		author.focus();
		return false;
	}
	
	if(publisher == null || publisher.value == "") {
		alert('출판사를 입력해주세요');
		publisher.focus();
		return false;
	}
	
	if(p_date == null || p_date.value == "") {
		alert('출판일을 입력해주세요');
		p_date.focus();
		return false;
	}
	
	alert('책 정보를 수정합니다');
	modifyBookForm.submit();
}

/* 엔터키로 유효성 검사 없이 전송 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/*         ----------modify by enter--------            */

enterEvents.forEach(enterEvent => {
	
	enterEvent.addEventListener('keyup',(event)=>{
		if(event.keyCode == 13) {
			event.preventDefault();
			modify();
		}
	});
	
});
