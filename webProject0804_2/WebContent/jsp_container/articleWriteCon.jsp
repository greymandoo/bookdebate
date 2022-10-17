<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="inner-container">
		<div class="articleWrite">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<form action="#" method="post" id="writeForm">
							<ul>
								<li class="title">
									<label for="title">Title:</label>
									<input type="text" name="title" id="title" />
								</li>
								<li class="content">
									<textarea name="content" id="content"></textarea>
									<input type="hidden" name="userId" value="${sessionScope.sessionUser}" />
									<input type="hidden" name="parentNo" value="${not empty param.articleNo ? param.articleNo:'0'}" />
								</li>
								<li class="btn-box">
									<input type="button" value="WRITE" id="writeBtn" class="btn" />
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>