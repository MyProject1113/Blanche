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
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#commit_btn").click(function() {
					if (!chkSubmit($("#app_topic"), "주제소개를")) return;
					else if (!chkSubmit($("#app_fund"), "목표자금을")) return;
					else if (!chkSubmit($("#app_field"), "분야를")) return;
					else if (!chkSubmit($("#request_phone_1"), "연락처를")) return;
					else if (!chkSubmit($("#request_phone_2"), "연락처를")) return;
					else if (!chkSubmit($("#request_phone_3"), "연락처를")) return;
					else {
						
						$("#app_phone").val($("#request_phone_1").val() + "-" + $("#request_phone_2").val() + "-" + $("#request_phone_3").val());
						$("#us_index").val(2);
						
						$("#new_project_request").attr({
							"method":"POST",
							"action":"/establish/applicationInsert.do"
						});
						$("#new_project_request").submit();
					}
				});
			});
		</script>
		
	</head>
	<body>
		
		
		
		<div class="container">
			<div class="box">
				<h2>프로젝트 개설 신청하기</h2>
				
				<form class="new_project_request" id="new_project_request">
					<div class="app_form_question">
						<label class="app_form_label text-strong" for="app_topic">Q. 무엇을 만들려고 하나요?</label>
						<textarea class="app_form_item" id="app_topic" name="app_topic" cols="40" rows="3" placeholder=""></textarea>
						<p class="app_form_help">* 소소한 것이라도 좋습니다. 가급적 구체적으로만 말씀해주세요.</p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="app_fund">Q. 어느정도의 자금이 필요할까요?</label>
						<input class="app_form_item" id="app_fund" name="app_fund" type="number" />&nbsp;만원
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="app_field">Q. 어느 분야라고 볼 수 있을까요?</label>
						<select class="app_form_item" id="app_field" name="app_field"><option value="">분야 선택</option>
							<option value="movie">영화 ∙ 공연</option>
							<option value="music">음악</option>
							<option value="design">디자인</option>
							<option value="book">출판</option>
							<option value="cooking">요리</option>
						</select>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="app_reference">Q. 참고할만한 기존 작업이 있나요?</label>
						<textarea class="app_form_item" cols="40" id="app_reference" name="app_reference" placeholder="" rows="3"></textarea>
						<p class="app_form_help">* 없어도 괜찮습니다. 참고할만한 링크가 있을 경우, 말씀해주세요</p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label">Q. 운영진이 연락드릴 수 있는 번호를 남겨주세요</label>
						<div class="app_form_item">
						<p>
						<input type="tel" class="app_form_tel" id="request_phone_1" name="request_phone_1" size="10" /> -
						<input type="tel" class="app_form_tel" id="request_phone_2" name="request_phone_2" size="10" /> -
						<input type="tel" class="app_form_tel" id="request_phone_3" name="request_phone_3" size="10" />
						<input type="hidden" id="app_phone" name="app_phone" />
						</p>
						</div>
						<p class="app_form_help">* 필요한 경우, 직접 전화로 답변을 드리는 것이 더 빠를 수도 있습니다 :)</p>
					</div>
					
					<input type="hidden" id="us_index" name="us_index" />
					<input type="hidden" id="appro_check" name="appro_check" value=0 />
					
					<input type="button" id="commit_btn" value="신청하기" />
					<input type="reset" value="다시 작성 하기" />
				</form>
			</div>
		</div>




	</body>
</html>
