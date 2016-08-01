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
			$("#nt_index").val("<c:out value='${noticeData.nt_index}' />");
			$("#us_index").val("<c:out value='${noticeData.us_index}' />");
			$("#search").val("<c:out value='${noticeParam.search}' />");
			$("#keyword").val("<c:out value='${noticeParam.keyword}' />");
			$("#page").val("<c:out value='${noticeParam.page}' />");
			
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#boardUpdateBtn").click(function() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/notice/edit.do"
				});
				$("#formBoard").submit();
			});
			
			/* 삭제 버튼 클릭 시 처리 이벤트 */
			$("#boardDeleteBtn").click(function() {
				if (!confirm("삭제하시겠습니까?")) {
					return;
				}
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/notice/delete.do"
				});
				$("#formBoard").submit();
			});
			
			/* 답변 버튼 클릭 시 처리 이벤트 */
			$("#boardReplyBtn").click(function() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/notice/reply.do"
				});
				$("#formBoard").submit();
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/notice/list.do"
				});
				$("#formBoard").submit();
			});
			
			// 답변 첨부파일 목록 열기 클릭 시 처리 이벤트
			$(document).on("click", ".attachOpen", function() {
				$(".attachOpen").not(this).val("목록 열기");
				$(".attachShow").html("");
				if ($(this).val() != "목록 열기") {
					$(this).val("목록 열기");
					return;
				}
				
				$(this).val("목록 닫기");
				var nt_index = $(this).parents(".replyDetail").attr("data-num");
				var attachShow = $(this).parents(".attachInventory").find(".attachShow");
				
				$.ajax({
					url : "/board/attach/list.do",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "json",
					data : JSON.stringify({
						nt_index : nt_index
					}),
					success : function(result) {
						var index = 1;
						$(result).each(function() {
							var ntatt_index = this.ntatt_index;
							var ntatt_path = this.ntatt_path;
							var ntatt_modidate = this.ntatt_modidate;
							var fileName = this.fileName;
							addNewAttach(attachShow, index, ntatt_index, ntatt_path, ntatt_modidate, fileName);
							index++;
						});
					}, error : function() {
						alert("첨부파일 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
					}
				});
			});
			
			// 답변 수정 클릭 시 처리 이벤트
			$(document).on("click", ".replyUpdateBtn", function() {
				var nt_index = $(this).parents(".replyDetail").attr("data-num");
				$("#nt_index").val(nt_index);
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/notice/edit.do"
				});
				$("#formBoard").submit();
			});
			
			// 답변 삭제 클릭 시 처리 이벤트
			$(document).on("click", ".replyDeleteBtn", function() {
				if (confirm("선택하신 답변을 삭제하시겠습니까?")) {
					var nt_index = $(this).parents(".replyDetail").attr("data-num");
					$("#nt_index").val(nt_index);
					$("#formBoard").attr({
						"method" : "post",
						"action" : "/notice/delete.do"
					});
					$("#formBoard").submit();
				}
			});
		});
		
		function addNewAttach(attachShow, index, ntatt_index, ntatt_path, ntatt_modidate, fileName) {
			var newSpan = $("<span>");
			newSpan.attr("data-index", ntatt_index);
			newSpan.addClass("attachFile");
			
			var indexSpan = $("<span>");
			indexSpan.html(index + ". ");
			newSpan.append(indexSpan);
			
			var dataA = $("<a>");
			dataA.attr("href", ntatt_path);
			newSpan.append(dataA);
			
			var nameSpan = $("<span>");
			nameSpan.html(fileName);
			nameSpan.addClass("attachName");
			dataA.append(nameSpan);
			
			var dateSpan = $("<span>");
			dateSpan.html(ntatt_modidate);
			dateSpan.addClass("attachDate");
			newSpan.append(dateSpan);
			
			if (index != 1) {
				attachShow.append($("<br>"));
			}
			attachShow.append(newSpan);
		}
	</script>
</head>
<body>
<div id="boardContainer">
	<%-- ==================== 본문 설정 시작 ==================== --%>
	<form name="formBoard" id="formBoard">
		<input type="hidden" name="nt_index" id="nt_index" />
		<input type="hidden" name="us_index" id="us_index" />
		<input type="hidden" name="search" id="search" />
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
					<td>${noticeData.nt_index}&nbsp;(조회수 : ${noticeData.nt_check})</td>
					<td class="columnName center">작성일</td>
					<td>${noticeData.nt_regdate}</td>
				</tr>
				<tr>
					<td class="columnName center">작성자</td>
					<td>${noticeData.nickname}</td>
					<td class="columnName center">최종수정일</td>
					<td>${noticeData.nt_modidate}</td>
				</tr>
				<tr>
					<td class="columnName center">제목</td>
					<td colspan="3">${noticeData.nt_title}</td>
				</tr>
				<tr>
					<td class="columnName center">내용</td>
					<td colspan="3" id="boardContent">${noticeData.nt_content}</td>
				</tr>
				<c:if test="${not empty attachList}">
					<tr>
						<td class="columnName center">첨부파일</td>
						<td colspan="3" class="attachInventory">
							<c:forEach var="attachData" items="${attachList}" varStatus="status">
								<span class="attachFile" data-index="${attachData.ntatt_index}">
									<span>${status.count}. </span>
									<a href="${attachData.ntatt_path}">
										<span class="attachName">${attachData.fileName}</span>
									</a>
									<span class="attachDate">(등록일자: ${attachData.ntatt_modidate})</span>
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
		<c:if test="${noticeParam.editable == 1}">
			<input type="button" value="수정" name="boardUpdateBtn" id="boardUpdateBtn" />
			<input type="button" value="삭제" name="boardDeleteBtn" id="boardDeleteBtn" />
		</c:if>
		<input type="button" value="목록" name="boardListBtn" id="boardListBtn" />
	</div>
	<%-- ==================== 본문 버튼 종료 ==================== --%>
</div>
</body>
</html>