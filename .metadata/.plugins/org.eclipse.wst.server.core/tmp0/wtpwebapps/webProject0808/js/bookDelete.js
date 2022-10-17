const deletePopUpBtn = document.querySelector('#deletePopUpBtn');
const deletePopUp = document.querySelector('.deletePopUp');
const deleteForm = document.querySelector('#deleteForm');
const closePopUpBtn = document.querySelector('#closePopUpBtn');
const deleteBtn = document.querySelector('#deleteBtn');
const b_title2 = deleteForm.b_title2;
const bookNo2 = deleteForm.bookNo2;


deletePopUpBtn.addEventListener('click',()=>{	
	deletePopUp.style.display = 'block';
});
closePopUpBtn.addEventListener('click',()=>{	
	deletePopUp.style.display = 'none';
});

const xhr = new XMLHttpRequest();

deleteBtn.addEventListener('click',deleteFn);

function deleteFn() {	
	
	var param = "b_title="+b_title2.value+"&bookNo="+bookNo2.value;
	xhr.open("post","bookDelete.ao?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = bookDeletefn;
	xhr.send(param);
}

function bookDeletefn() {
	
	if (xhr.readyState == 4 && xhr.status == 200) {
		var result = xhr.responseText;

		if(result == 0) {
			alert('삭제 실패!');
			userPw.value = "";
			userPw.focus();
		} else if(result == 1) {
			alert('삭제 성공!');
			location.href = "bookListForAdmin.do";
		}
	}
	
}

