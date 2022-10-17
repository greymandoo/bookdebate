const deletePopUpBtn = document.querySelector('#deletePopUpBtn');
const deletePopUp = document.querySelector('.deletePopUp');
const deleteForm = document.querySelector('#deleteForm');
const closePopUpBtn = document.querySelector('#closePopUpBtn');
const deleteBtn = document.querySelector('#deleteBtn');
const articleNo = deleteForm.articleNo;

deletePopUpBtn.addEventListener('click',(e)=>{
	e.preventDefault();
	
	deletePopUp.style.display = 'block';
});
closePopUpBtn.addEventListener('click',(e)=>{
	e.preventDefault();
	
	deletePopUp.style.display = 'none';
});

const xhr = new XMLHttpRequest();

deleteBtn.addEventListener('click',(e)=>{
	e.preventDefault();
	
	var param = "articleNo="+articleNo.value;
	xhr.open("post","deleteArticle.ax?",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = articleDeletefn;
	xhr.send(param);
});

function articleDeletefn() {
	
	if (xhr.readyState == 4 && xhr.status == 200) {
		var result = xhr.responseText;

		if(result == 0) {
			alert('게시글 삭제 실패!');
		} else if(result == 1) {
			alert('게시글 삭제 성공!');
			location.href = "articleList.bo";
		}
	}
	
}
