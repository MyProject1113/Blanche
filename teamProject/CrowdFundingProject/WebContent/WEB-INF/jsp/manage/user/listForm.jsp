<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>작성글</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<link rel="stylesheet" type="text/css" href="/include/css/board.css">
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function() {
			if ("<c:out value='${userParam.method}' />" != "") {
				$("#method").val("<c:out value='${userParam.method}' />");
			} else {
				$("#method").val("email");
			}
			$("#keyword").val("<c:out value='${userParam.keyword}' />");
			$("#page").val("<c:out value='${userParam.page}' />");
			$("#orderBy").val("<c:out value='${userParam.orderBy}' />");
			$("#orderSc").val("<c:out value='${userParam.orderSc}' />");
			
			/* 정렬 버튼 클릭 시 처리 이벤트 */
			$(".order").click(function() {
				$("#page").val(1);
				$("#orderBy").val($(this).attr("data-orderby"));
				if ($("#orderSc").val() != "DESC") {
					$("#orderSc").val("DESC");
				} else {
					$("#orderSc").val("ASC");
				}
				console.log($("#orderSc").val());
				goPage();
			});
			
			/* 페이지 버튼 클릭 시 처리 이벤트 */
			$(document).on("click", ".goPage", function() {
				var page = $(this).attr("data-page");
				$("#page").val(page);
				goPage();
			});
			
			/* 검색 버튼 클릭 시 처리 이벤트 */
			$("#userSearchBtn").click(function() {
				$("#page").val(1);
				goPage();
			});
			
			/* 키워드 텍스트 입력 시 처리 이벤트 */
			$("#keyword").keydown(function(event) {
				$("#page").val(1);
				if (event.keyCode == 13) {
					goPage();
					return false;
				}
			});
			
			/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 함수 */
			function goPage() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/manage/user/list.do"
				});
				$("#formBoard").submit();
			}
			
			/* 게시판 관리 버튼 클릭 시 처리 이벤트 */
			$("#manageBoardBtn").click(function() {
				location.href = "/manage/board/list.do"
			});
			
			/* 회원 관리 버튼 클릭 시 처리 이벤트 */
			$("#manageUserBtn").click(function() {
				location.href = "/manage/user/list.do"
			});
		});
	</script>
</head>
<body>
<input type="button" id="manageBoardBtn" name="manageBoardBtn" value="게시판 관리" />
<input type="button" id="manageUserBtn" name="manageUserBtn" value="회원 관리" />
<div id="boardContainer">
	<%-- ==================== 작성글 목록 시작 ==================== --%>
	<div id="boardList">
		<table class="boardTable">
			<colgroup>
				<col width="10%" />
				<col width="16%" />
				<col width="12%" />
				<col width="12%" />
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th class="columnName order" data-orderby="us_index">
						번호
						<c:choose>
							<c:when test="${userParam.orderBy == 'us_index' and userParam.orderSc == 'ASC'}">
								▲
							</c:when>
							<c:when test="${userParam.orderBy == 'us_index' and userParam.orderSc == 'DESC'}">
								▼
							</c:when>
						</c:choose>
					</th>
					<th class="columnName order" data-orderby="us_email">
						이메일
						<c:choose>
							<c:when test="${userParam.orderBy == 'us_email' and userParam.orderSc == 'ASC'}">
								▲
							</c:when>
							<c:when test="${userParam.orderBy == 'us_email' and userParam.orderSc == 'DESC'}">
								▼
							</c:when>
						</c:choose>
					</th>
					<th class="columnName order" data-orderby="us_name">
						이름
						<c:choose>
							<c:when test="${userParam.orderBy == 'us_name' and userParam.orderSc == 'ASC'}">
								▲
							</c:when>
							<c:when test="${userParam.orderBy == 'us_name' and userParam.orderSc == 'DESC'}">
								▼
							</c:when>
						</c:choose>
					</th>
					<th class="columnName order" data-orderby="us_nickname">
						닉네임
						<c:choose>
							<c:when test="${userParam.orderBy == 'us_nickname' and userParam.orderSc == 'ASC'}">
								▲
							</c:when>
							<c:when test="${userParam.orderBy == 'us_nickname' and userParam.orderSc == 'DESC'}">
								▼
							</c:when>
						</c:choose>
					</th>
					<th class="columnName order" data-orderby="us_phone">
						연락처
						<c:choose>
							<c:when test="${userParam.orderBy == 'us_phone' and userParam.orderSc == 'ASC'}">
								▲
							</c:when>
							<c:when test="${userParam.orderBy == 'us_phone' and userParam.orderSc == 'DESC'}">
								▼
							</c:when>
						</c:choose>
					</th>
					<th class="columnName">등급</th>
					<th class="columnName">최근접속</th>
					<th class="columnName">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty userList}">
						<c:forEach var="userData" items="${userList}">
							<tr>
								<td class="center">${userData.us_index}</td>
								<td class="center">${userData.us_email}</td>
								<td class="center">${userData.us_name}</td>
								<td class="center">${userData.us_nickname}</td>
								<td class="center">${userData.us_phone}</td>
								<td class="center">
									<c:choose>
										<c:when test="${userData.us_rank != 3}">
											회원
										</c:when>
										<c:otherwise>
											운영자
										</c:otherwise>
									</c:choose>
								</td>
								<td class="center">${userData.accessDate}</td>
								<td class="center">
									<c:choose>
										<c:when test="${userData.accreditState == 1}">
											인증대기
										</c:when>
										<c:otherwise>
											인증완료
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="center">검색된 내용이 없습니다. 다시 한번 검색해 보세요</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<%-- ==================== 작성글 목록 종료 ==================== --%>
	
	<%-- ==================== 작성글 버튼 시작 ==================== --%>
	<div id="boardButton" class="center">
		<c:if test="${userParam.pageCount > 0}">
			<c:choose>
				<c:when test="${userParam.page != 1}">
					<span class="goPage" data-page="1">◀◀</span>
				</c:when>
				<c:otherwise>
					<span class="disable" data-page="1">◀◀</span>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${userParam.pageCount}">
				<c:if test="${i >= (userParam.page - userParam.pageSpare) && i <= (userParam.page + userParam.pageSpare)}">
					|
					<c:choose>
						<c:when test="${i == userParam.page}">
							<span class="goPage" id="currPage" data-page="${i}">${i}</span>
						</c:when>
						<c:otherwise>
							<span class="goPage" data-page="${i}">${i}</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			|
			<c:choose>
				<c:when test="${userParam.page != userParam.pageCount}">
					<span class="goPage" data-page="${userParam.pageCount}">▶▶</span>
				</c:when>
				<c:otherwise>
					<span class="disable" data-page="${userParam.pageCount}">▶▶</span>
				</c:otherwise>
			</c:choose>
			(${userParam.page}/${userParam.pageCount})
		</c:if>
	</div>
	<%-- ==================== 작성글 버튼 종료 ==================== --%>
					
	<%-- ==================== 작성글 검색 시작 ==================== --%>
	<div id="boardSearch">
		<form name="formBoard" id="formBoard">
			<select name="method" id="method">
				<option value="email">이메일</option>
				<option value="name">이름</option>
				<option value="nickname">닉네임</option>
				<option value="phone">연락처</option>
			</select>
			<input type="text" name="keyword" id="keyword" />
			<input type="hidden" name="page" id="page" />
			<input type="hidden" name="orderBy" id="orderBy" />
			<input type="hidden" name="orderSc" id="orderSc" />
			<input type="button" value="검색" name="userSearchBtn" id="userSearchBtn" />
		</form>
	</div>
	<%-- ==================== 작성글 검색 종료 ==================== --%>
</div>
</body>
</html>