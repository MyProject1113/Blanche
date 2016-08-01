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
			<div class="contentTit"><h3>개설 신청 리스트</h3></div>
			
			<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="app_index" id="app_index" />
			</form>
			
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
	</body>
</html>
