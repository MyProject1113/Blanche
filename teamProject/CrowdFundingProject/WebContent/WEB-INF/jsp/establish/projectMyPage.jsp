<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>신청 성공</title>
		
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				
			});
		</script>
		
	</head>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>프로젝트 진행 리스트</h3></div>
			
			<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="app_index" id="app_index" />
			</form>
			
			<%-- ==================== 리스트 시작 ==================== --%>
			<div id="boardList">
				<table summary="게시판 리스트">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="20%" />
						<col width="15%" />
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
									<tr class="tac" data-num="${pro.intro_index}">
										<td>${pro.intapp_index}</td>
										<td>${pro.intro_title}</td>
										<td>${pro.intapp_reason}</td>
										<td>
											<c:choose>
												<c:when test="${pro.intapp_check == '0'}">진행중</c:when>
												<c:when test="${pro.intapp_check == '1'}">수정요청</c:when>
												<c:when test="${pro.intapp_check == '2'}">
													<a href="#">수정하러 가기</a>
												</c:when>
												<c:when test="${pro.intapp_check == '3'}">삭제요청</c:when>
												<c:when test="${pro.intapp_check == '4'}">기간만료</c:when>
											</c:choose>
										</td>
										<td>${pro.intapp_note}</td>
										<td>
											<input type="button" id="intapp_request" name="intapp_request" value="수정/삭제 요청" <c:choose><c:when test="${pro.intapp_check == '0' and pro.intapp_check == '2'}"></c:when><c:otherwise>disabled="disabled"</c:otherwise></c:choose> />
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
				<table summary="수정/삭제 요청 버튼">
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
				</table>
				<%-- ====================== 버튼 추가 종료 ====================== --%>
				
				<%-- ==================== 리스트 시작 ==================== --%>
				<div class="contentTB">
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
								<td><%-- ${projectList.intapp_index} --%></td>
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
				</div>
			</form>
			<%-- ==================== 리스트 종료 ==================== --%>
			
		</div>
	</body>
</html>
