<%@ page import="com.blanche.board.ckediter.ConfigurationHelper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
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
		
		<style type="text/css">
			label.app_form_label_data {
			    color: red;
			    font-size: 1.1em;
			    font-style: italic;
			    margin-left: 1em;
			    margin-top: -0.5em;
			}
		</style>
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#commit_btn").click(function() {
					if (!chkSubmit($("#intro_title"), "제목을")) return;
					else if (!chkSubmit($("#intro_refund"), "환불 및 교환정책을")) return;
					else if (!chkSubmit($("#plan_name"), "기획자 이름을")) return;
					else if (!chkSubmit($("#plan_area"), "프로젝트 실행 지역을")) return;
					else if (!chkSubmit($("#plan_account"), "계좌번호를")) return;
					else {
						$("#new_project_detail").attr({
							"method":"POST",
							"action":"/establish/introductionInsert.do"
						});
						$("#new_project_detail").submit();
					}
				});
			});
		</script>
		
	</head>
	<body>
		
		
		
		<div class="container">
			<div class="box">
				<h2>프로젝트 상세 내용 수정하기</h2>
				
				<form class="new_project_detail" id="new_project_detail">
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="intro_title">프로젝트 명</label>
						<input type="text" class="app_detail_item" id="intro_title" name="intro_title" value="${introDetail.intro_title}" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="intro_subtitle">주제</label>
						<input type="text" class="app_detail_item" id="intro_subtitle" name="intro_subtitle" value="${introDetail.intro_subtitle}" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="app_field">분야</label>
						<label class="app_form_label_data">
							<c:choose>
								<c:when test="${appDetail.app_field == 'movie'}">영화 ∙ 공연</c:when>
								<c:when test="${appDetail.app_field == 'music'}">음악</c:when>
								<c:when test="${appDetail.app_field == 'design'}">디자인</c:when>
								<c:when test="${appDetail.app_field == 'book'}">출판</c:when>
								<c:when test="${appDetail.app_field == 'cooking'}">요리</c:when>
							</c:choose>
						</label>
						
						
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="app_fund">목표 금액</label>
						<label class="app_form_label_data">${appDetail.app_fund} 만원</label>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="intro_image">메인 이미지</label>
						<input type="file" class="app_detail_item" id="intro_image" name="intro_image" value="${introDetail.intro_image}" />
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="intro_date">프로젝트 기간</label>
						<input type="date" class="app_detail_item" id="intro_startDate" name="intro_startDate" value="${introDetail.intro_startDate}" /> ~ 
						<input type="date" class="app_detail_item" id="intro_endDate" name="intro_endDate" value="${introDetail.intro_endDate}" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="intro_details">프로젝트 소개</label>
						<textarea class="app_form_item" cols="40" id="intro_details" name="intro_details" placeholder="" rows="3">${introDetail.intro_details}</textarea>
						<p class="app_form_help"></p>
					</div>
					
					<%-- <div class="app_form_question">
						<label class="app_form_label" for="intro_abbreviation">프로젝트 간략소개</label>
						<textarea class="app_form_item" cols="40" id="intro_abbreviation" name="intro_abbreviation" placeholder="" rows="3">${introDetail.intro_abbreviation}</textarea>
						<p class="app_form_help"></p>
					</div> --%>
					
					<%-- <div class="app_form_question">
						<label class="app_form_label" for="intro_plan">프로젝트 계획</label>
						<textarea class="app_form_item" cols="40" id="intro_plan" name="intro_plan" placeholder="" rows="3">${introDetail.intro_title}</textarea>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="intro_purpose">프로젝트 목표</label>
						<textarea class="app_form_item" cols="40" id="intro_purpose" name="intro_purpose" placeholder="" rows="3">${introDetail.intro_title}</textarea>
						<p class="app_form_help"></p>
					</div> --%>
					
					<div class="app_form_question">
						<label class="app_form_label" for="intro_refund">환불 및 교환정책</label>
						<input type="text" class="app_detail_item" id="intro_refund" name="intro_refund" value="${introDetail.intro_refund}" />
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="plan_image">기획자 사진</label>
						<input type="file" class="app_detail_item" id="plan_image" name="plan_image" value="${plannerDetail.plan_image}" />
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="plan_name">기획자 이름</label>
						<input type="text" class="app_detail_item" id="plan_name" name="plan_name" value="${plannerDetail.plan_name}" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_detail">
						<label class="app_detail_label text-strong" for="plan_area">프로젝트 실행 지역</label>
						<input type="text" class="app_detail_item" id="plan_area" name="plan_area" value="${plannerDetail.plan_area}" />
						<p class="app_detail_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="intro_effect">프로젝트 성공 시 투자자들에게의 혜택</label>
						<textarea class="app_form_item" cols="40" id="intro_effect" name="intro_effect" placeholder="" rows="3">${introDetail.intro_effect}</textarea>
						<p class="app_form_help"></p>
					</div>
					
					<div class="app_form_question">
						<label class="app_form_label" for="plan_account">프로젝트 성공 시 입금될 계좌번호</label>
						<input type="text" class="app_detail_item" id="plan_account" name="plan_account" value="${plannerDetail.plan_account}" />
						<p class="app_form_help"></p>
					</div>
					
					<input type="button" id="commit_btn" value="신청하기" />
				</form>
				<ckeditor:replace replace="intro_details" basePath="/ckeditor/" config="<%= ConfigurationHelper.createConfig() %>" />
			</div>
		</div>




	</body>
</html>
