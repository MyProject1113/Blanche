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
	<title>글상세</title>
	
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
			$("#bd_index").val("<c:out value='${boardData.bd_index}' />");
			$("#bdinf_index").val("<c:out value='${boardData.bdinf_index}' />");
			$("#us_index").val("<c:out value='${boardData.us_index}' />");
			$("#bd_root").val("<c:out value='${boardData.bd_root}' />");
			$("#bd_parent").val("<c:out value='${boardData.bd_parent}' />");
			$("#bd_step").val("<c:out value='${boardData.bd_step}' />");
			$("#bd_indent").val("<c:out value='${boardData.bd_indent}' />");
			$("#boardUri").val("<c:out value='${boardParam.boardUri}' />");
			$("#method").val("<c:out value='${boardParam.method}' />");
			$("#keyword").val("<c:out value='${boardParam.keyword}' />");
			$("#page").val("<c:out value='${boardParam.page}' />");
			
			/* 본문 버튼 클릭 시 처리 이벤트 */
			$("#boardDetailBtn").click(function() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/board/" + $("#boardUri").val() + "/detail.do"
				});
				$("#formBoard").submit();
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/mywrite/list.do"
				});
				$("#formBoard").submit();
			});
		});
	</script>
</head>
<body>
<div id="boardContainer">
	<%-- ==================== 본문 설정 시작 ==================== --%>
	<form name="formBoard" id="formBoard">
		<input type="hidden" name="bd_index" id="bd_index" />
		<input type="hidden" name="bdinf_index" id="bdinf_index" />
		<input type="hidden" name="us_index" id="us_index" /> 
		<input type="hidden" name="bd_root" id="bd_root" />
		<input type="hidden" name="bd_parent" id="bd_parent" />
		<input type="hidden" name="bd_step" id="bd_step" />
		<input type="hidden" name="bd_indent" id="bd_indent" />
		<input type="hidden" name="boardUri" id="boardUri" />
		<input type="hidden" name="method" id="method" />
		<input type="hidden" name="keyword" id="keyword" />
		<input type="hidden" name="page" id="page" />
	</form>
	<%-- ==================== 본문 설정 종료 ==================== --%>
	
	<%-- ==================== 본문 상세 시작 ==================== --%>
	<div id="boardDetail">
		<table class="boardTable">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<td class="columnName center">글번호</td>
					<td>${boardData.bd_index}&nbsp;(조회수 : ${boardData.bd_check})</td>
					<td class="columnName center">작성일</td>
					<td>${boardData.bd_regdate}</td>
				</tr>
				<tr>
					<td class="columnName center">작성자</td>
					<td>${boardData.nickname}</td>
					<td class="columnName center">최종수정일</td>
					<td>${boardData.bd_modidate}</td>
				</tr>
				<tr>
					<td class="columnName center">제목</td>
					<td colspan="3">${boardData.bd_title}</td>
				</tr>
				<tr>
					<td class="columnName center">내용</td>
					<td colspan="3" id="boardContent">${boardData.bd_content}</td>
				</tr>
				<c:if test="${not empty attachList}">
					<tr>
						<td class="columnName center">첨부파일</td>
						<td colspan="3" class="attachInventory">
							<c:forEach var="attachData" items="${attachList}" varStatus="status">
								<span class="attachFile" data-index="${attachData.bdatt_index}">
									<span>${status.count}. </span>
									<a href="${attachData.bdatt_path}">
										<span class="attachName">${attachData.fileName}</span>
									</a>
									<span class="attachDate">(등록일자: ${attachData.bdatt_modidate})</span>
								</span>
								<br />
							</c:forEach>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<%-- ==================== 본문 상세 종료 ==================== --%>
	
	<%-- ==================== 본문 버튼 시작 ==================== --%>
	<div id="boardButton" class="right">
		<input type="button" value="본문" name="boardDetailBtn" id="boardDetailBtn" />
		<input type="button" value="목록" name="boardListBtn" id="boardListBtn" />
	</div>
	<%-- ==================== 본문 버튼 종료 ==================== --%>
	
	<%-- ==================== 본문 댓글 시작 ==================== --%>
	<jsp:include page="commentForm.jsp" />
	<%-- ==================== 본문 댓글 종료 ==================== --%>
</div>
</body>
</html>