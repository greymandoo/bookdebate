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
								<img id="preview" />
							</div>
							<form action="addBook.do" method="post" id="addBookForm" enctype="multipart/form-data">
								<h2 class="title">ADD BOOK</h2>
								<ul>
									<li class="one-line">
										<label for="bookNo">ISBN13</label>
										<input type="text" name="bookNo" id="bookNo" class="enterEvents" />
										<input type="button" value="check" id="ISBNcheckBtn" class="btn" />
									</li>
									<li class="one-line">
										<label for="b_title">title</label>
										<input type="text" name="b_title" id="b_title" class="enterEvents" />
									</li>
									<li class="one-line">
										<label for="author">author</label>
										<input type="text" name="author" id="author" class="enterEvents" />
									</li>
									<li class="one-line">
										<label for="publisher">publisher</label>
										<input type="text" name="publisher" id="publisher" class="enterEvents" />
									</li>
									<li class="one-line">
										<label for="p_date">published date</label>
										<input type="date" name="p_date" id="p_date" class="enterEvents" /></li>
									<li class="introduction-label"><label for="introduction">introduction</label></li>
									<li class="textarea-box"><textarea name="introduction" id="introduction"></textarea></li>
									<li class="file-box">
										<label for="cover">cover</label>
										<input type="file" name="cover" id="cover" accept="image/*" />
									</li>
									<li class="btn-box"><input type="button" value="ADD" id="addBtn" class="btn" /></li>									
								</ul>						
							</form>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>
</div>