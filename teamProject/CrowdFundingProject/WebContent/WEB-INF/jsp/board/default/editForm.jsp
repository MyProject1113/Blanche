<%@ page import="com.blanche.board.ckediter.ConfigurationHelper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>글수정</title>
	
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
			$("#bdinf_index").val("<c:out value='${boardData.bdinf_index}' />");
			$("#bd_index").val("<c:out value='${boardData.bd_index}' />");
			$("#us_index").val("<c:out value='${boardData.us_index}' />");
			$("#boardUri").val("<c:out value='${boardParam.boardUri}' />");
			$("#method").val("<c:out value='${boardParam.method}' />");
			$("#keyword").val("<c:out value='${boardParam.keyword}' />");
			$("#page").val("<c:out value='${boardParam.page}' />");
			
			/* 첨부파일 동적 추가 */
			$(document).on("change", "input.attachUpload", function() {
				for (var i = 0; i < $("input.attachUpload").length; i++) {
					if (!$("input.attachUpload").eq(i).val()) {
						return;
					}
				}
				
				var newBr = $("<br>");
				$("#attachList").append(newBr);
				
				var newInput = $("<input>");
				newInput.attr({
					"type" : "file",
					"name" : "attachUpload"
				});
				newInput.addClass("attachUpload");
				$("#attachList").append(newInput);
			});
			
			$(".attachDeleteBtn").click(function() {
				var attachDeleteBtn = $(this);
				var attachFile = attachDeleteBtn.parents(".attachFile");
				var attachDelete = attachFile.children(".attachDelete");
				var attachName = attachFile.children(".attachName");
				if (attachDeleteBtn.val() == "파일 삭제") {
					attachDeleteBtn.val("파일 삭제 취소");
					attachDelete.val(attachFile.attr("data-index"));
					attachName.addClass("attachDelete");
				} else {
					attachDeleteBtn.val("파일 삭제");
					attachDelete.val("");
					attachName.removeClass("attachDelete");
				}
			});
			
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#boardUpdateBtn").click(function() {
				if (!checkSubmit($("#bd_title"), 120, "제목")) {
					return;
				} 
				$("#formWrite").attr({
					"method" : "post",
					"action" : "/board/" + $("#boardUri").val() + "/update.do"
				});
				$("#formWrite").submit();
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#boardCancelBtn").click(function() {
				history.back();
			});
		});
	</script>
</head>
<body>
<div id="boardContainer">
	<%-- ==================== 글수정 입력창 시작 ==================== --%>
	<div id="boardWrite">
		<form name="formWrite" id="formWrite" enctype="multipart/form-data">
			<input type="hidden" name="bdinf_index" id="bdinf_index" />
			<input type="hidden" name="bd_index" id="bd_index" />
			<input type="hidden" name="us_index" id="us_index" />
			<input type="hidden" name="boardUri" id="boardUri" />
			<input type="hidden" name="method" id="method" />
			<input type="hidden" name="keyword" id="keyword" />
			<input type="hidden" name="page" id="page" />
			<table class="boardTable">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<td class="columnName center">글번호</td>
						<td>${boardData.bd_index}&nbsp;(조회수 : ${boardData.bd_check})</td>
						<td class="columnName center">작성일</td>
						<td>${boardData.bd_regdate}&nbsp;</td>
					</tr>
					<tr>
						<td class="columnName center">작성자</td>
						<td>${boardData.nickname}</td>
						<td class="columnName center">최종수정일</td>
						<td>${boardData.bd_modidate}</td>
					</tr>
					<tr>
						<td class="columnName center">제목</td>
						<td colspan="3"><input type="text" name="bd_title" id="bd_title" value="${boardData.bd_title}" maxlength="40" /></td>
					</tr>
					<tr>
						<td class="columnName center">내용</td>
						<td colspan="3"><textarea name="bd_content" id="bd_content">${boardData.bd_content}</textarea></td>
					</tr>
					<tr>
						<td rowspan="2" class="columnName center">첨부파일</td>
						<td colspan="3" class="attachInventory">
							<c:if test="${not empty attachList}">
								<c:forEach var="attachData" items="${attachList}">
									<span class="attachFile" data-index="${attachData.bdatt_index}">
										<input type="hidden" name="attachDelete" class="attachDelete" />
										<input type="button" name="attachDeleteBtn" class="attachDeleteBtn" value="파일 삭제" />
										<span class="attachName">${attachData.fileName}</span>
										<span class="attachDate">(등록일자: ${attachData.bdatt_modidate})</span>
									</span>
									<br />
								</c:forEach>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="3" id="attachList">
							<input type="file" name="attachUpload" class="attachUpload" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<ckeditor:replace replace="bd_content" basePath="/ckeditor/" config="<%= ConfigurationHelper.createConfig() %>" />
	</div>
	<%-- ==================== 글수정 입력창 종료 ==================== --%>
	
	<%-- ==================== 글수정 버튼 시작 ==================== --%>
	<div id="boardButton" class="right">
		<input type="button" value="수정" name="boardUpdateBtn" id="boardUpdateBtn" />
		<input type="button" value="취소" name="boardCancelBtn" id="boardCancelBtn" />
	</div>
	<%-- ==================== 글수정 버튼 종료 ==================== --%>
</div>
</body>
</html>