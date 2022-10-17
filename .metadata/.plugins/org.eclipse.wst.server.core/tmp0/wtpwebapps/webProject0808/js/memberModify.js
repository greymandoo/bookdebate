const modForm = document.querySelector('#modForm');
const modBtn = document.querySelector('#modBtn');
const userId = modForm.userId;
const userPw = modForm.userPw;
const userName = modForm.userName;
const email = modForm.email;

const xhr2 = new XMLHttpRequest();

modBtn.addEventListener('click', modify);

function modify() {	
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

	
	if(userPw == null || userPw.value == "") {
		alert('비밀번호를 입력해주세요');
		userPw.focus();
		return false;
	}
	
	var param = "userId="+userId.value+"&userPw="+userPw.value+"&userName="+userName.value+"&email="+email.value;
	xhr2.open("post","ajaxModify.ao?",true);
	xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr2.onreadystatechange = memberModifyfn;
	xhr2.send(param);
}

function memberModifyfn() {
	
	if (xhr2.readyState == 4 && xhr2.status == 200) {
		var result = xhr2.responseText;

		if(result == 0) {
			alert('회원 정보 수정 실패! 비밀번호를 확인해주세요');
			userPw.value = "";
			userPw.focus();
		} else if(result == 1) {
			alert('회원 정보가 수정되었습니다');
			location.href = "memberDetail.mo?userId="+userId.value;
		}
	}
	
}

/*         ----------modify by enter--------            */
modForm.addEventListener('keyup',(event)=>{
	if(event.keyCode == 13) {
		event.preventDefault();
		modify();
	}
});
