const deletePopUpBtn = document.querySelector('#deletePopUpBtn');
const deletePopUp = document.querySelector('.deletePopUp');
const deleteForm = document.querySelector('#deleteForm');
const closePopUpBtn = document.querySelector('#closePopUpBtn');
const deleteBtn = document.querySelector('#deleteBtn');
const userPwForDelete = deleteForm.userPw;

deletePopUpBtn.addEventListener('click',()=>{
	deletePopUp.style.display = 'block';
});
closePopUpBtn.addEventListener('click',()=>{
	deletePopUp.style.display = 'none';
});

const xhr = new XMLHttpRequest();

deleteBtn.addEventListener('click',deleteFn);

function deleteFn () {
	
	if(userPwForDelete == null || userPwForDelete.value == "") {
		alert('비밀번호를 입력해주세요');
		userPwForDelete.focus();
		return false;
	}
	
	var param = "userId="+userId.value+"&userPw="+userPwForDelete.value;
	xhr.open("post","ajaxDelete.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = memberDeletefn;
	xhr.send(param);
}

function memberDeletefn() {
	
	if (xhr.readyState == 4 && xhr.status == 200) {
		var result = xhr.responseText;

		if(result == 0) {
			alert('탈퇴 실패! 비밀번호가 틀립니다.');
			userPw.value = "";
			userPw.focus();
		} else if(result == 1) {
			alert('탈퇴 성공!');
			location.href = "index.mo";
		}
	}
	
}


document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/*         ----------delete by enter--------            */

userPwForDelete.addEventListener('keyup',(event)=>{
	if(event.keyCode == 13) {
		event.preventDefault();
		deleteFn();
	}
});
