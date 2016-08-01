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
	<title>글목록</title>
	
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
			$("#fq_index").val(0);
			if ("<c:out value='${faqParam.search}' />" != "") {
				$("#search").val("<c:out value='${faqParam.search}' />");
			} else {
				$("#search").val("title");
			}
			$("#keyword").val("<c:out value='${faqParam.keyword}' />");
			$("#page").val("<c:out value='${faqParam.page}' />");
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function() {
				var fq_index = $(this).parents("tr").attr("data-num");
				$("#fq_index").val(fq_index);
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/faq/detail.do"
				});
				$("#formBoard").submit();
			});
			
			/* 글쓰기 버튼 클릭 시 처리 이벤트 */
			$("#boardInsertBtn").click(function() {
				$("#formBoard").attr({
					"method" : "post",
					"action" : "/faq/write.do"
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
					"action" : "/faq/list.do"
				});
				$("#formBoard").submit();
			}
		});
	</script>
</head>
<body>
<div id="boardContainer">
	<div id="boardTitle">
		<h3>질문게시판</h3>
	</div>
	
	<%-- ==================== 게시판 목록 시작 ==================== --%>
	<div id="faqList">
		<table class="boardTable">
			<colgroup>
				<col width="10%" />
				<col width="50%" />
				<col width="15%" />
				<col width="13%" />
				<col width="12%" />
			</colgroup>
			<thead>
				<tr>
					<th class="columnName">번호</th>
					<th class="columnName">제목</th>
					<th class="columnName">작성자</th>
					<th class="columnName">작성일</th>
					<th class="columnName">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty faqList}">
						<c:forEach var="faqData" items="${faqList}">
							<tr data-num="${faqData.fq_index}">
								<td class="center">
									${faqData.num}
								</td>
								<td class="left">
									<span class="goDetail">${faqData.fq_title}</span>
									<c:if test="${faqData.pictureCount > 0}">
										<img class="pictureImage" src="/image/picture.png" />
									</c:if>
									<c:if test="${faqData.attachCount > 0}">
										<img class="attachImage" src="/image/file.png" />
									</c:if>
								</td>
								<td class="center">${faqData.nickname}</td>
								<td class="center">${faqData.fq_regdate}</td>
								<td class="center">${faqData.fq_check}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="center">검색된 내용이 없습니다. 다시 한번 검색해 보세요</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<%-- ==================== 게시판 목록 종료 ==================== --%>
	
	<%-- ==================== 게시판 버튼 시작 ==================== --%>
	<div id="boardButton">
		<table class="boardLine">
			<colgroup>
				<col width="10%" />
				<col width="80%" />
				<col width="10%" />
			</colgroup>
			<tr>
				<td></td>
				<td class="center">
					<c:if test="${faqParam.pageCount > 0}">
						<c:choose>
							<c:when test="${faqParam.page != 1}">
								<span class="goPage" data-page="1">◀◀</span>
							</c:when>
							<c:otherwise>
								<span class="disable" data-page="1">◀◀</span>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="1" end="${faqParam.pageCount}">
							<c:if test="${i >= (faqParam.page - faqParam.pageSpare) && i <= (faqParam.page + faqParam.pageSpare)}">
								|
								<c:choose>
									<c:when test="${i == faqParam.page}">
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
							<c:when test="${faqParam.page != faqParam.pageCount}">
								<span class="goPage" data-page="${faqParam.pageCount}">▶▶</span>
							</c:when>
							<c:otherwise>
								<span class="disable" data-page="${faqParam.pageCount}">▶▶</span>
							</c:otherwise>
						</c:choose>
						(${faqParam.page}/${faqParam.pageCount})
					</c:if>
				</td>
				<td class="right">
					<c:if test="${faqParam.writable == 1}">
						<input type="button" value="글쓰기" name="boardInsertBtn" id="boardInsertBtn">
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<%-- ==================== 게시판 버튼 종료 ==================== --%>
	
	<%-- ==================== 게시판 검색 시작 ==================== --%>
	<div id="boardSearch">
		<form name="formBoard" id="formBoard">
			<input type="hidden" name="fq_index" id="fq_index" />
			<select name="search" id="search">
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
	<%-- ==================== 게시판 검색 종료 ==================== --%>
</div>
</body>
</html>