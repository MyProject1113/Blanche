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
	<title>글작성</title>
	
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
	<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#bdinf_index").val("<c:out value='${boardParam.bdinf_index}' />");
			$("#bd_root").val("<c:out value='${boardParam.bd_root}' />");
			$("#bd_parent").val("<c:out value='${boardParam.bd_parent}' />");
			$("#bd_step").val("<c:out value='${boardParam.bd_step}' />");
			$("#bd_indent").val("<c:out value='${boardParam.bd_indent}' />");
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
			
			/* 저장 버튼 클릭 시 처리 이벤트 */
			$("#boardInsertBtn").click(function() {
				if (!checkSubmit($("#bd_title"), 120, "제목")) {
					return;
				}
				$("#formWrite").attr({
					"method" : "post",
					"action" : "/board/" + $("#boardUri").val() + "/insert.do"
				});
				$("#formWrite").submit();
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function() {
				$("#formWrite").attr({
					"method" : "post",
					"action" : "/board/" + $("#boardUri").val() + "/list.do"
				});
				$("#formWrite").submit();
			});
		});
	</script>
</head>
<body>
<div id="boardContainer">
	<%-- ==================== 글작성 입력창 시작 ==================== --%>
	<div id="boardWrite">
		<form name="formWrite" id="formWrite" enctype="multipart/form-data">
			<input type="hidden" name="bdinf_index" id="bdinf_index" />
			<input type="hidden" name="bd_root" id="bd_root" />
			<input type="hidden" name="bd_parent" id="bd_parent" />
			<input type="hidden" name="bd_step" id="bd_step" />
			<input type="hidden" name="bd_indent" id="bd_indent" />
			<input type="hidden" name="boardUri" id="boardUri" />
			<input type="hidden" name="method" id="method" />
			<input type="hidden" name="keyword" id="keyword" />
			<input type="hidden" name="page" id="page" />
			<table class="boardTable">
				<colgroup>
					<col width="15%">
					<col width="85%">
				</colgroup>
				<tbody>
					<tr>
						<td class="columnName center">작성자</td>
						<td>${userData.us_nickname}</td>
					</tr>
					<tr>
						<td class="columnName center">제목</td>
						<td><input type="text" name="bd_title" id="bd_title" maxlength="40" /></td>
					</tr>
					<tr>
						<td class="columnName center">내용</td>
						<td><textarea name="bd_content" id="bd_content"></textarea></td>
					</tr>
					<tr>
						<td class="columnName center">첨부파일</td>
						<td id="attachList">
							<input type="file" name="attachUpload" class="attachUpload" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<ckeditor:replace replace="bd_content" basePath="/ckeditor/" config="<%= ConfigurationHelper.createConfig() %>" />
	</div>
	<%-- ==================== 글작성 입력창 종료 ==================== --%>
	
	<%-- ==================== 글작성 버튼 시작 ==================== --%>
	<div id="boardButton" class="right">
		<input type="button" value="저장" name="boardInsertBtn" id="boardInsertBtn" />
		<input type="button" value="목록" name="boardListBtn" id="boardListBtn" />
	</div>
	<%-- ==================== 글작성 버튼 종료 ==================== --%>
	
	<%-- ==================== 글작성 원문 시작 ==================== --%>
	<c:if test="${boardOrigin.bd_index > 0}">
		<div id="boardOrigin">
			<table class="boardTable">
				<colgroup>
					<col width="100%">
				</colgroup>
				<tr class="columnName center">
					<td>본문 내용입니다. 답변 작성시 참고 하세요.</td>
				</tr>
				<tr>
					<td id="boardContent">${boardOrigin.bd_content}</td>
				</tr>
			</table>
		</div>
	</c:if>
	<%-- ==================== 글작성 원문 종료 ==================== --%>
</div>
</body>
</html>