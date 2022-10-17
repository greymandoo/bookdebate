const modForAdminBtn = document.querySelector('#modForAdminBtn');
const userPwForAdmin = modForm.userPwForAdmin;

const xhr2 = new XMLHttpRequest();

modForAdminBtn.addEventListener('click',(e)=>{
	e.preventDefault();
	
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
	
	var param = "userId="+userId.value+"&userPw="+userPwForAdmin.value+"&userName="+userName.value+"&email="+email.value;
	xhr2.open("post","ajaxModify.ao?",true);
	xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr2.onreadystatechange = memberModifyfn;
	xhr2.send(param);
});

function memberModifyfn() {
	
	if (xhr2.readyState == 4 && xhr2.status == 200) {
		var result = xhr2.responseText;

		if(result == 0) {
			alert('회원 정보 수정 실패!');
		} else if(result == 1) {
			alert('회원 정보가 수정되었습니다');
			location.href = "memberList.mo";
		}
	}
	
}