<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		
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
		$(function(){
			$("#pwch").click(function(){
				location.href="/usermanage/pwchange.do";
			});
			$("#phch").click(function(){
				location.href="/usermanage/phchange.do";
			});
			$("#fundch").click(function(){
				location.href="/usermanage/design.do";
			});
			$("#invch").click(function(){
				location.href="/usermanage/invest.do";
			});
		});
		
		var intapp_index = "";
		var check = false;
		$(function() {
			/* 수정/삭제 요청 클릭 시 요청 사유 화면을 띄우기 위한 처리 이벤트 */
			$("#intapp_request").click(function() {
				var intro_index = $(this).parents("tr").attr("data-num");
				$("#intro_index").val(intro_index);
				console.log("승인번호 : " + intro_index);
				
				intapp_index = $(this).parents("tr").attr("data-index");
				console.log("프로젝트 승인번호 : " + intapp_index);
				
				if (check == false) {
					addNewItem(intro_index);
					check = true;
				}
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
						location.href = "/usermanage/design.do";
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
			data_form.append(req_table);
			$("#request_reason").append(data_form);
		}
		</script>
	</head>
	<body>
		<div>
			<form>
				<h1>My Page</h1>
				<br/>
				<input type="button" id="pwch" name="pwch" value="비밀번호 변경"/>
				<input type="button" id="phch" name="phch" value="연락처 변경"/>
				<input type="button" id="fundch" name="fundch" value="기획정보"/>
				<input type="button" id="invch" name="invch" value="투자정보"/>
			</form>
			<table>
				<tr>
					<td colspan="3" align="center">기획정보</td>
				</tr>
				
				<tr>
					<td>내 기획정보</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>
						<div class="contentContainer">
							<div class="contentTit"><h3>개설 신청 리스트</h3></div>
					
							<%-- ==================== 리스트 시작 ==================== --%>
							<div id="boardList">
								<table summary="게시판 리스트">
									<colgroup>
										<col width="10%" />
										<col width="47%" />
										<col width="15%" />
										<col width="15%" />
										<col width="13%" />
									</colgroup>
									<thead>
										<tr>
											<th>신청번호</th>
											<th>주제</th>
											<th>분야</th>
											<th>신청일</th>
											<th>승인여부</th>
										</tr>
									</thead>
									<tbody>
										<!-- 데이터 출력 -->
										<c:choose>
											<c:when test="${not empty applicationList}">
												<c:forEach var="app" items="${applicationList}" varStatus="status">
													<tr>
														<td>${app.app_index}</td>
														<td>${app.app_topic}</td>
														<td>
															<c:choose>
																<c:when test="${app.app_field == 'webtoon'}">만화</c:when>
																<c:when test="${app.app_field == 'movie'}">영화 ∙ 공연</c:when>
																<c:when test="${app.app_field == 'cooking'}">요리</c:when>
																<c:when test="${app.app_field == 'game'}">게임</c:when>
																<c:when test="${app.app_field == 'music'}">음악</c:when>
																<c:when test="${app.app_field == 'photo'}">사진</c:when>
																<c:when test="${app.app_field == 'book'}">출판</c:when>
																<c:otherwise>기타</c:otherwise>
															</c:choose>
														</td>
														<td>${app.app_date}</td>
														<td>
															<c:choose>
																<c:when test="${app.appro_check == '0'}">심사 중</c:when>
																<c:when test="${app.appro_check == '1'}">기각</c:when>
																<c:when test="${app.appro_check == '2'}">승인 완료</c:when>
																<c:otherwise>기간만료</c:otherwise>
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
							
						</div>
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>
						<div class="contentContainer">
							<div class="contentTit"><h3>프로젝트 진행 리스트</h3></div>
						
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
								<div id="request_reason"></div>
							</form>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>

