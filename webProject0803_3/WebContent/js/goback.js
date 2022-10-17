const gobackBtn = document.querySelector('#gobackBtn');

gobackBtn.addEventListener('click',()=>{
	history.go(-1);
});