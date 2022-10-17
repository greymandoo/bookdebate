<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="inner-container">
		<div class="bookAdd">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="bookAdd-con">
							<div class="img-box">
								<img src="./img/upload/${book.bookNo}/${book.cover}" id="preview" />
							</div>
							<form action="bookModify.do" method="post" id="modifyBookForm" enctype="multipart/form-data">
								<h2 class="title">EDIT BOOK</h2>
								<ul>
									<li class="one-line">
										<label for="bookNo">ISBN13</label>
										<input type="text" name="bookNo" id="bookNo" class="enterEvents" value="${book.bookNo}" readonly />
									</li>
									<li class="one-line">
										<label for="b_title">title</label>
										<input type="text" name="b_title" id="b_title" class="enterEvents" value="${book.b_title }" />
									</li>
									<li class="one-line">
										<label for="author">author</label>
										<input type="text" name="author" id="author" class="enterEvents" value="${book.author }" />
									</li>
									<li class="one-line">
										<label for="publisher">publisher</label>
										<input type="text" name="publisher" id="publisher" class="enterEvents" value="${book.publisher }" />
									</li>
									<li class="one-line">
										<label for="p_date">published date</label>
										<input type="date" name="p_date" id="p_date" class="enterEvents" value="${book.p_date }" /></li>
									<li class="introduction-label"><label for="introduction">introduction</label></li>
									<li class="textarea-box"><textarea name="introduction" id="introduction">${book.introduction }</textarea></li>
									<li class="file-box">
										<label for="cover">cover</label>
										<input type="hidden" name="org_cover" id="org_cover" value="${book.cover}" />
										<input type="file" name="cover" id="cover" accept="image/*" />
									</li>
									<li class="btn-box">
										<input type="button" value="EDIT" id="modifyBtn" class="btn" />
										<input type="button" value="DELETE" id="deletePopUpBtn" class="btn" />
									</li>									
								</ul>						
							</form>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="deletePopUp">
	<div class="delete">
		<div class="cont">
			<h2>Delete Book</h2>
			<form action="#" method="post" id="deleteForm">
				<ul>
					<li>If you delete this book, all the articles related to this book will be deleted.</li>
					<li>Are you sure you want to delete this book?</li>
					<li>
						<input type="hidden" name="b_title2" value="${book.b_title}" />
						<input type="hidden" name="bookNo2" value="${book.bookNo}" />
					</li>
					<li>
						<input type="button" value="cancel" id="closePopUpBtn" />
						<input type="button" value="delete" id="deleteBtn" />
					</li>
				</ul>
			</form>
		</div>	
	</div>
</div>