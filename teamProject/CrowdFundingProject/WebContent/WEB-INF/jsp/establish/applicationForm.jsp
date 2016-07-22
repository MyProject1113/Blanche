<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>프로젝트 개설 신청하기</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
	</head>
	<body>
		
		
		
		<div class="container">
			<div class="box">
				<h2>프로젝트 개설 신청하기</h2>
				
				<form class="new_project_request" id="new_project_request">
					<div class="app_form_question">
						<label class="app_form_label text-strong" for="project_request_question_01">Q. 무엇을 만들려고 하나요?</label>
						<textarea class="app_form_item" id="project_request_question_01" name="project_request_question_01" cols="40" rows="3" placeholder=""></textarea>
						<p class="app_form_help">* 소소한 것이라도 좋습니다. 가급적 구체적으로만 말씀해주세요.</p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_02">Q. 어느정도의 자금이 필요할까요?</label>
						<input class="app_form_item" id="project_request_question_02" name="project_request_question_02" type="number" />&nbsp;만원
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="project_request_question_03">Q. 어느 분야라고 볼 수 있을까요?</label>
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
						<label class="app_form_label" for="project_request_question_04">Q. 참고할만한 기존 작업이 있나요?</label>
						<textarea class="app_form_item" cols="40" id="project_request_question_04" name="project_request_question_04" placeholder="" rows="3"></textarea>
						<p class="app_form_help">* 없어도 괜찮습니다. 참고할만한 링크가 있을 경우, 말씀해주세요</p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label">Q. 운영진이 연락드릴 수 있는 번호를 남겨주세요</label>
						<div class="app_form_item">
						<p>
						<input type="tel" class="app_form_tel" id="project_request_phone_1" name="project_request_phone_1" size="10" /> -
						<input type="tel" class="app_form_tel" id="project_request_phone_2" name="project_request_phone_2" size="10" /> -
						<input type="tel" class="app_form_tel" id="project_request_phone_3" name="project_request_phone_3" size="10" />
						</p>
						</div>
						<p class="app_form_help">* 필요한 경우, 직접 전화로 답변을 드리는 것이 더 빠를 수도 있습니다 :)</p>
					</div>
					
					<input type="button" id="commit_btn" value="신청하기" />
				</form>
			</div>
		</div>




	</body>
</html>
