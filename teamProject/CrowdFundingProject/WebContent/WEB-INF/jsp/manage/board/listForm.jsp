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
			$("#bdinf_index").val("<c:out value='${boardParam.bdinf_index}' />");
			$("#bd_index").val(0);
			if ("<c:out value='${boardParam.method}' />" != "") {
				$("#method").val("<c:out value='${boardParam.method}' />");
			} else {
				$("#method").val("title");
			}
			$("#boardUri").val("");
			$("#keyword").val("<c:out value='${boardParam.keyword}' />");
			$("#page").val("<c:out value='${boardParam.page}' />");
			
			/* 게시판이름 클릭시 게시판 이동을 위한 처리 이벤트 */
			$(".goBoard").click(function() {
				var bdinf_index = $(this).parents("tr").attr("data-index");
				var boardUri = $(this).parents("tr").attr("data-uri");
				$("#bdinf_index").val(bdinf_index);
				$("#boardUri").val(boardUri);
				$("#page").val(0);
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/board/" + boardUri + "/list.do"
				});
				$("#formBoard").submit();
			});
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function() {
				var bd_index = $(this).parents("tr").attr("data-num");
				var boardUri = $(this).parents("tr").attr("data-uri");
				$("#bd_index").val(bd_index);
				$("#boardUri").val(boardUri);
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/manage/board/article.do"
				});
				$("#formBoard").submit();
			});
			
			/* 페이지 버튼 클릭 시 처리 이벤트 */
			$(document).on("click", ".goPage", function() {
				var page = $(this).attr("data-page");;
				$("#page").val(page);
				goPage();
			});
			
			/* 검색 버튼 클릭 시 처리 이벤트 */
			$("#boardSearchBtn").click(function() {
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
					"action" : "/manage/board/list.do"
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
				<col width="15%" />
				<col width="50%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th class="columnName">번호</th>
					<th class="columnName">게시판</th>
					<th class="columnName">제목</th>
					<th class="columnName">작성자</th>
					<th class="columnName">작성일</th>
					<th class="columnName">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty boardList}">
						<c:forEach var="boardData" items="${boardList}">
							<tr data-num="${boardData.bd_index}" data-index="${boardData.bdinf_index}" data-uri="${boardData.boardUri}">
								<td class="center">
									<c:if test="${boardData.bd_step == 0}">
										${boardData.num}
									</c:if>
								</td>
								<td class="center">
									<c:choose>
										<c:when test="${fn:length(boardData.boardTitle) > 13}">
												<span class="goBoard" title="${boardData.boardTitle}">
													${fn:substring(boardData.boardTitle, 0, 13)}...
												</span>
										</c:when>
										<c:otherwise>
											<span class="goBoard">
												${boardData.boardTitle}
											</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="left">
									<c:if test="${boardData.bd_step > 0}">
										<c:forEach begin="1" end="${boardData.bd_indent}">
											&nbsp;&nbsp;
										</c:forEach>
										<img src="/image/re.gif" />
									</c:if>
									<span class="goDetail">${boardData.bd_title}</span>
									<c:if test="${boardData.commentCount > 0}">
										<span class="commentCount">(${boardData.commentCount})</span>
									</c:if>
									<c:if test="${boardData.pictureCount > 0}">
										<img class="pictureImage" src="/image/picture.png" />
									</c:if>
									<c:if test="${boardData.attachCount > 0}">
										<img class="attachImage" src="/image/file.png" />
									</c:if>
								</td>
								<td class="center">${boardData.nickname}</td>
								<td class="center">${boardData.bd_regdate}</td>
								<td class="center">
									<c:if test="${boardData.bd_delete > 0}">
										삭제
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="center">검색된 내용이 없습니다. 다시 한번 검색해 보세요</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<%-- ==================== 작성글 목록 종료 ==================== --%>
	
	<%-- ==================== 작성글 버튼 시작 ==================== --%>
	<div id="boardButton" class="center">
		<c:if test="${boardParam.pageCount > 0}">
			<c:choose>
				<c:when test="${boardParam.page != 1}">
					<span class="goPage" data-page="1">◀◀</span>
				</c:when>
				<c:otherwise>
					<span class="disable" data-page="1">◀◀</span>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${boardParam.pageCount}">
				<c:if test="${i >= (boardParam.page - boardParam.pageSpare) && i <= (boardParam.page + boardParam.pageSpare)}">
					|
					<c:choose>
						<c:when test="${i == boardParam.page}">
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
				<c:when test="${boardParam.page != boardParam.pageCount}">
					<span class="goPage" data-page="${boardParam.pageCount}">▶▶</span>
				</c:when>
				<c:otherwise>
					<span class="disable" data-page="${boardParam.pageCount}">▶▶</span>
				</c:otherwise>
			</c:choose>
			(${boardParam.page}/${boardParam.pageCount})
		</c:if>
	</div>
	<%-- ==================== 작성글 버튼 종료 ==================== --%>
					
	<%-- ==================== 작성글 검색 시작 ==================== --%>
	<div id="boardSearch">
		<form name="formBoard" id="formBoard">
			<input type="hidden" name="bdinf_index" id="bdinf_index" />
			<input type="hidden" name="bd_index" id="bd_index" />
			<input type="hidden" name="boardUri" id="boardUri" />
			<select name="method" id="method">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="both">제목+내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" name="keyword" id="keyword" />
			<input type="hidden" name="page" id="page" />
			<input type="button" value="검색" name="boardSearchBtn" id="boardSearchBtn" />
		</form>
	</div>
	<%-- ==================== 작성글 검색 종료 ==================== --%>
</div>
</body>
</html>