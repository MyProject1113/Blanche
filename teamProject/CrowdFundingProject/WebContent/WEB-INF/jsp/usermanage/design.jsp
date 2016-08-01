<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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
			<table border=0>
				
			
				<tr>
					<td colspan="3" align="center">기획정보</td>
				</tr>
				
				<tr>
					<td>내 기획정보</td>
				</tr>
				</table>
				
				<table border=0>
				<tr>
					<td>
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
						
					</td>
				</tr>
				</table>
				
				<table border=0>
				<tr>
					<td>
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
								<td >
									<input type="radio"  id="requestRadio1" name="requestRadio" value="update" checked />수정요청
									<br />
									<input type="radio" id="requestRadio2" name="requestRadio" value="delete" />삭제요청
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
					</td>
				</tr>
				</table>
		
	</div>


</body>
</html>








