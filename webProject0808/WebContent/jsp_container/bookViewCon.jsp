<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="inner-container">
		<div class="bookView">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="bookView-con">
							<div class="img-box">
								<img src="./img/upload/${book.bookNo}/${book.cover}" alt="cover" />
							</div>
							<div class="book-con">
								<ul>
									<li>
										<span>Title : </span>
										<span>${book.b_title}</span>
									</li>
									<li>
										<span>Author : </span>
										<span>${book.author}</span>
									</li>
									<li>
										<span>Publisher : </span>
										<span>${book.publisher}</span>
									</li>
									<li>
										<span>Published Date : </span>
										<span>${book.p_date}</span>
									</li>
									<li>
										<span>ISBN13 : </span>
										<span>${book.bookNo}</span>
									</li>
									<li>
										<p>Introduction</p>
										<p>${book.introduction}</p>
									</li>
								</ul>
								<ul>
									<li class="btn-box"><a href="articleWrite.bo?b_title=${book.b_title}" class="btn">Writing about this book→</a></li>
									<li class="btn-box"><a href="searchArticle.bo?category=b_title&searching=${book.b_title}" class="btn">Articles about this book→</a></li>
								</ul>			
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>