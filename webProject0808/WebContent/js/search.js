"use strict";
const searchForm = document.querySelector('#searchForm');
const searchBtn = document.querySelector('#searchBtn');
const category = searchForm.category;
const searching = searchForm.searching;

searchBtn.addEventListener('click',search);

function search() {
	if(category == null || category.value == "") {
		alert('카테고리를 선택해주세요');
		category.focus();
		return false;
	}
	
	searchForm.submit();
}

/* 엔터키로 유효성 검사 없이 전송 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/*      엔터키로 전송        */
searchForm.addEventListener('keyup',(event)=>{
	if(event.keyCode == 13) {
		event.preventDefault();
		search();
	}
});