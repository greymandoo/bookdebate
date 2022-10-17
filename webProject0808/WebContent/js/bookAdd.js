"use strict";
const addBookForm = document.querySelector('#addBookForm');
const ISBNcheckBtn = document.querySelector('#ISBNcheckBtn');
const addBtn = document.querySelector('#addBtn');

const bookNo = addBookForm.bookNo;
const b_title = addBookForm.b_title;
const author = addBookForm.author;
const publisher = addBookForm.publisher;
const p_date = addBookForm.p_date;
const introduction = addBookForm.introduction;
const cover = addBookForm.cover;

const enterEvents = document.querySelectorAll('.enterEvent');

const xhr = new XMLHttpRequest();

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

/*      -------isbn 중복 체크------             */


let ISBNchecked = 0;

ISBNcheckBtn.addEventListener('click',ISBNcheck);

/*엔터로 아이디 확인*/
ISBNcheckBtn.addEventListener('keyup',(event)=>{
	if(event.keyCode == 13) {
		event.preventDefault();
		ISBNcheck();
	}	
});

function ISBNcheck() {
	
	if(bookNo == null || bookNo.value == "") {
		alert('ISBN을 입력해주세요');
		bookNo.focus();
		return false;
	}
	
	var param = "bookNo="+bookNo.value;
	xhr.open("post","ISBNCheck.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = ISBNcheckResult;
	xhr.send(param);
}

function ISBNcheckResult() {
	
	if (xhr.readyState == 4 && xhr.status == 200) {
		var result = xhr.responseText;
		if(result == 0) {
			alert('이미 등록된 책입니다.');
			bookNo.value = "";
			bookNo.focus();
			ISBNchecked = -1;
		} else if(result == 1) {
			alert('등록할 수 있습니다.');
			ISBNchecked = 1;
		}
	}
}


/*         ----------add--------            */
addBtn.addEventListener('click',signup);

function signup () {
	if(bookNo == null || bookNo.value == "") {
		alert('ISBN을 입력해주세요');
		bookNo.focus();
		return false;
	}
	
	if(ISBNchecked == 0) {
		alert('ISBN 중복 체크를 해주세요');
		bookNo.focus();
		return false;
	} else if(ISBNchecked == -1) {
		alert('이미 등록된 책입니다');
		bookNo.focus();
		return false;
	}
	
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
	
	alert('책을 등록합니다');
	addBookForm.submit();
}

/* 엔터키로 유효성 검사 없이 전송 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/*         ----------sign up by enter--------            */

enterEvents.forEach(enterEvent => {
	
	enterEvent.addEventListener('keyup',(event)=>{
		if(event.keyCode == 13) {
			event.preventDefault();
			signup();
		}
	});
	
});

