<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>신청 성공</title>
		
		<style type="text/css">
			label {
			    display: inherit;
			}
			input#radioUp {
			    margin-top: 5px;
			}
			span#laUp {
			    margin-left: 25px;
			}
			input#radioDel {
				margin-top: 5px;
			}
			span#laDel {
			    margin-left: 25px;
			}
		</style>
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			var intapp_index = "";
			$(function() {
				/* 수정/삭제 요청 클릭 시 요청 사유 화면을 띄우기 위한 처리 이벤트 */
				$("#intapp_request").click(function() {
					var intro_index = $(this).parents("tr").attr("data-num");
					$("#intro_index").val(intro_index);
					console.log("승인번호 : " + intro_index);
					
					
					intapp_index = $(this).parents("tr").attr("data-index");
					console.log("프로젝트 승인번호 : " + intapp_index);
					
					addNewItem(intro_index);
					
					/* // 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/establish/applicationAdminDetail.do"
					});
					$("#detailForm").submit(); */
				});
				
				/** 요청버튼 클릭시 DB 업데이트를 위한 처리 이벤트 **/
				$(document).on("click", ".requestBtn", function() {
					if (!chkSubmit($("#intapp_reason"), "요청이유를")) return;
					
					var request = $(':input[name=requestRadio]:radio:checked').val();
					
					console.log("프로젝트 승인번호 재확인 : " + intapp_index);
		        	$("#intapp_index").val(intapp_index);
			         
			        if (request == 'update') {
			        	$("#intapp_check").val(1);
			        } else if (request =='delete'){
			        	$("#intapp_check").val(3);
			        }
			        
			        updateData();
				});
			});
			
			/* 회원 프로젝트 수정/삭제 요청 ajax */
			function updateData() {
				$.ajax ({
					url : "/establish/projectApprovalRequest.do",	// 전송 url
					type : "POST",	// 전송 시 method 방식
					data : $("#detailForm").serialize(),	// 폼전체 데이터 전송
					/* dataType : "text", */
					error : function() {	// 실행시 오류가 발생하였을 경우
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},	// 정상적으로 실행이 되었을 경우
					success : function(resultData) {
						if (resultData == 0) {	// 일치하지 않는 경우
							alert('승인 실패');
						} else if (resultData == 1) {	// 일치할 경우
							alert('승인 성공');
							location.href = "/establish/projectMyPage.do";
						}
					}
				});
			}

			/** 새로운 글을 화면에 추가하기 위한 함수 **/
			function addNewItem(intro_index) {
				var data_form = $("<form>");
				data_form.attr({"id" : "detailForm", "name" : "detailForm"});
				
				// 요청 버튼
				var req_input = $("<input>");
				req_input.attr({"type" : "button", "value" : "요청"});
				req_input.addClass("requestBtn");
				
				// 테이블 생성
				var req_table = $("<table>");
				var col = $("<colgroup>");
				var col_01 = $("<col>");
				col_01.attr({"width" : "15%"});
				var col_02 = $("<col>");
				col_02.attr({"width" : "15%"});
				var col_03 = $("<col>");
				col_03.attr({"width" : "15%"});
				var col_04 = $("<col>");
				col_04.attr({"width" : "40%"});
				var col_05 = $("<col>");
				col_05.attr({"width" : "15%"});
				
				var tbody = $("<tbody>");
				var tr_01 = $("<tr>");
				var th_01 = $("<th>");
				var num_span  = $("<span>");
				num_span.html("프로젝트 번호");
				var td_01 = $("<td>");
				var index_span  = $("<span>");
				index_span.html(intro_index);
				var th_02 = $("<th>");
				var type_span  = $("<span>");
				type_span.html("신청종류");
				var td_02 = $("<td>");
				
				var up_div = $("<label>");
				
				var up_radio_label = $("<span>");
				up_radio_label.attr({"id" : "laUp"});
				up_radio_label.html("수정요청");
				
				// 수정 라디오 버튼
				var up_radio_input = $("<input>");
				up_radio_input.attr({"type" : "radio", "id" : "radioUp", "name" : "requestRadio", "value" : "update", "checked" : "checked"});
				
				var up_radio_span  = $("<span>");
				up_radio_span.html("수정요청");
				
				var del_div = $("<label>");
				
				var del_radio_label = $("<span>");
				del_radio_label.attr({"id" : "laDel"});
				del_radio_label.html("삭제요청");
				
				// 삭제 라디오 버튼
				var del_radio_input = $("<input>");
				del_radio_input.attr({"type" : "radio", "id" : "radioDel", "name" : "requestRadio", "value" : "delete"});
				
				var del_radio_span  = $("<span>");
				del_radio_span.html("삭제요청");
				
				var td_03 = $("<td>");

				var tr_02 = $("<tr>");
				var td_04 = $("<td>");
				var del_radio_span  = $("<span>");
				del_radio_span.html("요청이유");
				var td_05 = $("<td>");
				td_05.attr({"colspan" : "4"});
				
				// 
				var textarea = $("<textarea>");
				textarea.attr({"id" : "intapp_reason", "name" : "intapp_reason"});
				
				var hidden_index_input = $("<input>");
				hidden_index_input.attr({"type" : "hidden", "id" : "intapp_index", "name" : "intapp_index"});
				
				var hidden_check_input = $("<input>");
				hidden_check_input.attr({"type" : "hidden", "id" : "intapp_check", "name" : "intapp_check"});
				
				// 조립하기
				col.append(col_01).append(col_02).append(col_03).append(col_04).append(col_05);
				
				th_01.append(num_span);
				td_01.append(index_span);
				th_02.append(type_span);

				up_div.append(up_radio_input).append(up_radio_label);
				del_div.append(del_radio_input).append(del_radio_label);
				td_02.append(up_div).append(del_div);
				
				td_03.append(req_input);
				
				tr_01.append(th_01).append(td_01).append(th_02).append(td_02).append(td_03);
				
				td_04.append(del_radio_span);
				td_05.append(textarea).append(hidden_index_input).append(hidden_check_input);
				tr_02.append(td_04).append(td_05);
				
				tbody.append(tr_01).append(tr_02);
				
				req_table.append(col).append(tbody);
				/* $("#request_reason").append(req_input).append(req_table); */
				data_form.append(req_table);
				$("#request_reason").append(data_form);
			}
		</script>
		
	</head>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>프로젝트 진행 리스트</h3></div>
			
			<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
			<%-- <form name="detailForm" id="detailForm">
				<input type="hidden" name="intro_index" id="intro_index" />
				
				<input type="hidden" name="intapp_index" id="intapp_index" value="${pro.intapp_index}" />
				<input type="hidden" name="intapp_check" id="intapp_check" />
												
			</form> --%>
			
			<%-- ==================== 리스트 시작 ==================== --%>
			<div id="boardList">
				<table summary="게시판 리스트">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="12%" />
						<col width="25%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th>신청번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>비고</th>
							<th>승인요청</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty projectList}">
								<c:forEach var="pro" items="${projectList}" varStatus="status">
									<tr class="tac" data-num="${pro.intro_index}" data-index="${pro.intapp_index}">
										<td>${pro.intapp_index}</td>
										<td>${pro.intro_title}</td>
										<td>
											<c:choose>
												<c:when test="${pro.intapp_check == '0'}">진행중</c:when>
												<c:when test="${pro.intapp_check == '1'}">수정요청</c:when>
												<c:when test="${pro.intapp_check == '2'}">수정승인</c:when>
												<c:when test="${pro.intapp_check == '3'}">삭제요청</c:when>
												<c:when test="${pro.intapp_check == '4'}">기간만료</c:when>
											</c:choose>
										</td>
										<td>${pro.intapp_note}</td>
										<td>
											<c:choose>
												<c:when test="${pro.intapp_check == '0'}">
													<input type="button" id="intapp_request" name="intapp_request" value="수정/삭제 요청" />
													<%-- <input type="hidden" id="storage_index" name="storage_index" value="${pro.intapp_index}" /> --%>
												</c:when>
												<c:when test="${pro.intapp_check == '2'}">
													<a href="/establish/applicationDetailUpdate.do?intro_index=${pro.intro_index}">수정하러 가기</a>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%-- ==================== 리스트 종료 ==================== --%>
			
			
			
			<br /><hr /><br />
			
			
			
			
			<form name="f_data" id="f_data" method="post">
				<!-- <input type="hidden" name="app_index" id="app_index" /> -->
				
				<%-- ====================== 버튼 추가 시작 ====================== --%>
				<%-- <table summary="수정/삭제 요청 버튼">
					<colgroup>
						<col width="70%" />
						<col width="30%" />
					</colgroup>
					<tr>
						<td></td>
						<td>
							<input type="button" value="요청" id="requestBtn" />
						</td>
					</tr>
				</table> --%>
				<%-- ====================== 버튼 추가 종료 ====================== --%>
				
				<%-- ==================== 리스트 시작 ==================== --%>
				<%-- <div class="contentTB">
					<table summary="수정/삭제 요청 폼">
						<colgroup>
							<col width="17%" />
							<col width="33%" />
							<col width="17%" />
							<col width="33%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="ac">신청번호</th>
								<td>${intapp_index}</td>
								<th class="ac">신청종류</th>
								<td>
									<input type="radio" name="requestRadio" value="update" checked />수정요청
									<input type="radio" name="requestRadio" value="delete" />삭제요청
								</td>
							</tr>
							<tr>
								<td class="ac vm">요청이유</td>
								<td colspan="3"><textarea id="intapp_reason" name="intapp_reason" rows="" cols=""></textarea></td>
							</tr>
						</tbody>
					</table>
				</div> --%>
				
				<div id="request_reason">
				</div>
				
			</form>
			<%-- ==================== 리스트 종료 ==================== --%>
			
		</div>
	</body>
</html>
