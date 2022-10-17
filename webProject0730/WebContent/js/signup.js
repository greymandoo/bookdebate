"use strict";

const signupForm = document.querySelector('#signupForm');
const IDcheckBtn = document.querySelector('#IDcheckBtn');
const signupBtn = document.querySelector('#signupBtn');
const pwCheck = document.querySelector('.pwCheck');

const userId = signupForm.userId;
const userPw = signupForm.userPw;
const userPw2 = signupForm.userPw2;
const userName = signupForm.userName;
const email = signupForm.email;

/*         ----------ID check--------            */

const xhr = new XMLHttpRequest();
let IDchecked = 0;

IDcheckBtn.addEventListener('click',(e)=>{
	e.preventDefault();
	
	if(userId == null || userId.value == "") {
		alert('아이디를 입력해주세요');
		userId.focus();
		return false;
	}
	
	var param = "userId="+userId.value;
	xhr.open("post","ajaxIDCheck.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = IDcheckfn;
	xhr.send(param);
});

function IDcheckfn() {
	
	if (xhr.readyState == 4 && xhr.status == 200) {
		var result = xhr.responseText;
		if(result == 0) {
			alert('중복 이름입니다. 다시 입력하세요.');
			userId.value = "";
			userId.focus();
			IDchecked = -1;
		} else if(result == 1) {
			alert('사용할 수 있습니다.');
			userId.focus();
			IDchecked = 1;
		}
	}
}


/*         ----------PW check--------            */

let PWchecked = false;

userPw2.addEventListener('keyup',(event)=>{
	const e1Val = event.target.value;
	const e2Val = userPw.value;
	
	if(e1Val == e2Val) {
		pwCheck.innerHTML='<i class="bi bi-check"></i>';
		pwCheck.style.color = "#007600";
		PWchecked = true;
	} else {
		pwCheck.innerHTML='<i class="bi bi-x"></i>';
		pwCheck.style.color = "#ee0000";
		PWchecked = false;
	}	
});


/*         ----------sign up--------            */

signupBtn.addEventListener('click',signup);

function signup () {
	if(userId == null || userId.value == "") {
		alert('아이디를 입력해주세요');
		userId.focus();
		return false;
	}
	
	if(IDchecked == 0) {
		alert('아이디 중복 체크를 해주세요');
		userId.focus();
		return false;
	} else if(IDchecked == -1) {
		alert('중복 아이디입니다');
		userId.focus();
		return false;
	}
	
	if(userPw == null || userPw.value == "") {
		alert('비밀번호를 입력해주세요');
		userPw.focus();
		return false;
	}
	
	if(userPw2 == null || userPw2.value == "") {
		alert('비밀번호 확인을 입력해주세요');
		userPw2.focus();
		return false;
	}
	
	if(PWchecked == false) {
		alert('비밀번호가 일치하지 않습니다');
		userPw2.focus();
		return false;
	}
	
	if(userName == null || userName.value == "") {
		alert('이름을 입력해주세요');
		userName.focus();
		return false;
	}
	
	if(email == null || email.value == "") {
		alert('E-mail을 입력해주세요');
		email.focus();
		return false;
	}
	
	var signupParam = "userId="+userId.value+"&userPw="+userPw.value+"&userName="+userName.value+"&email="+email.value;
	xhr.open("post","ajaxSignUp.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = signupFn;
	xhr.send(signupParam);
}

function signupFn () {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var signupResult = xhr.responseText;
		if(signupResult == 0) {
			alert('회원 가입 실패. 다시 시도해주세요');
			userId.value = "";
			userPw.value = "";
			userPw2.value = "";
			userName.value = "";
			email.value = "";
			phone.value = "";
			userId.focus();
		} else if(signupResult == 1) {
			alert('회원 가입 성공!');
			location.href = 'index.mo';
		}
	}
}


/*         ----------sign up by enter--------            */

const enterEvents = document.querySelectorAll('.enterEvent');
enterEvents.forEach(enterEvent => {
	
	enterEvent.addEventListener('keyup',(event)=>{
		if(event.keyCode == 13) {
			event.preventDefault();
			signup();
		}
	});
	
});
