<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>프로젝트 상세 내용 작성하기</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
	</head>
	<body>
		
		
		
		<div class="container">
			<div class="box">
				<h2>프로젝트 상세 내용 작성하기</h2>
				
				<form class="new_project_detail" id="new_project_detail">
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="project_request_detail_01">프로젝트 명</label>
						<input type="text" class="app_detail_item" id="project_request_detail_01" name="project_request_detail_01" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="project_request_detail_02">주제</label>
						<input type="text" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_03">분야</label>
						<select class="app_form_item" id="project_request_question_03" name="project_request_question_03"><option value="">분야 선택</option>
							<option value="27">만화</option>
							<option value="44">영화 ∙ 공연</option>
							<option value="50">요리</option>
							<option value="51">게임</option>
							<option value="54">음악</option>
							<option value="56">사진</option>
							<option value="57">출판</option>
						</select>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_02">목표 금액</label>
						<input class="app_form_item" id="project_request_question_02" name="project_request_question_02" type="number" />&nbsp;만원
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">메인 이미지</label>
						<input type="file" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="project_request_detail_02">프로젝트 기간</label>
						<input type="date" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" /> ~ 
						<input type="date" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">프로젝트 소개</label>
						<textarea class="app_form_item" cols="40" id="project_request_question_04" name="project_request_question_04" placeholder="" rows="3"></textarea>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">Synopsis</label>
						<textarea class="app_form_item" cols="40" id="project_request_question_04" name="project_request_question_04" placeholder="" rows="3"></textarea>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">Purpose</label>
						<textarea class="app_form_item" cols="40" id="project_request_question_04" name="project_request_question_04" placeholder="" rows="3"></textarea>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">기획자 사진</label>
						<input type="file" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="project_request_detail_02">기획자 이름</label>
						<input type="text" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="project_request_detail_02">프로젝트 실행 지역</label>
						<input type="text" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">프로젝트 성공 시 투자자들에게의 혜택</label>
						<textarea class="app_form_item" cols="40" id="project_request_question_04" name="project_request_question_04" placeholder="" rows="3"></textarea>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_04">프로젝트 성공 시 입금될 계좌번호</label>
						<input type="text" class="app_detail_item" id="project_request_detail_02" name="project_request_detail_02" />
						<p class="app_form_help"></p>
					</div>
					
					<input type="button" id="commit_btn" value="신청하기" />
				</form>
			</div>
		</div>




	</body>
</html>
