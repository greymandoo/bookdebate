const loginForm = document.querySelector('#loginForm');
const loginBtn = document.querySelector('#loginBtn');
const userId = loginForm.userId;
const userPw = loginForm.userPw;

const xhr3 = new XMLHttpRequest();

loginBtn.addEventListener('click',login);

function login() {
	
	if(userId == null || userId.value == "") {
		alert('아이디를 입력해주세요');
		userId.focus();
		return false;
	}
	if(userPw == null || userPw.value == "") {
		alert('비밀번호를 입력해주세요');
		userPw.focus();
		return false;
	}
	
	var param = "userId="+userId.value+"&userPw="+userPw.value;
	xhr3.open("post","ajaxLogin.ao?",true);
	xhr3.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr3.onreadystatechange = memberLoginfn;
	xhr3.send(param);
}

function memberLoginfn() {
	
	if (xhr3.readyState == 4 && xhr3.status == 200) {
		var result = xhr3.responseText;

		if(result == 0) {
			alert('아이디나 비밀번호가 틀립니다. 다시 시도해주세요');
			userId.value = "";
			userPw.value = "";
			userId.focus();
		} else if(result == 1) {
			location.href = "index.mo";
		}
	}
	
}

/*         ----------log in by enter--------            */

loginForm.addEventListener('keyup',(event)=>{
	if(event.keyCode == 13) {
		event.preventDefault();
		login();
	}
});
