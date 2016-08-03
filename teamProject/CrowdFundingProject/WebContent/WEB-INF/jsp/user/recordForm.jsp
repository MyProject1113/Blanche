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
	<title>접속 기록</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<link rel="stylesheet" type="text/css" href="/include/css/board.css">
	<style type="text/css">
		#userAccessList {
			width: 50%;
			margin: 0px auto;
		}
		#userAccessList th,
		#userAccessList td {
			text-align: center;
		}
		#userAccessList#accessPage {
			text-align: center;
		}
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#page").val("<c:out value='${accessParam.page}' />");
			
			/* 페이지 버튼 클릭 시 처리 이벤트 */
			$(document).on("click", ".goPage", function() {
				var page = $(this).attr("data-page");;
				$("#page").val(page);
				goPage();
			});
			
			/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 함수 */
			function goPage() {
				$("#formPage").attr({
					"method" : "post",
					"action" : "/user/record.do"
				});
				$("#formPage").submit();
			}
		});
	</script>
</head>
<body>
<div id="userAccessList">
	<table>
		<colgroup>
			<col width="50%" />
			<col width="50%" />
		</colgroup>
		<thead>
			<tr>
				<th class="columnName">접속IP</th>
				<th class="columnName">접속날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty accessList}">
					<c:forEach var="accessData" items="${accessList}">
						<tr>
							<td>${accessData.usacc_ip}</td>
							<td>${accessData.usacc_date}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="2">최근 접속 기록이 없습니다. 다시 한번 검색해 보세요</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<div id="accessPage">
		<form name="formPage" id="formPage">
			<input type="hidden" name="page" id="page" />
		</form>
		<c:if test="${accessParam.pageCount > 0}">
			<c:choose>
				<c:when test="${accessParam.page != 1}">
					<span class="goPage" data-page="1">◀◀</span>
				</c:when>
				<c:otherwise>
					<span class="disable" data-page="1">◀◀</span>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${accessParam.pageCount}">
				<c:if test="${i >= (accessParam.page - accessParam.pageSpare) && i <= (accessParam.page + accessParam.pageSpare)}">
					|
					<c:choose>
						<c:when test="${i == accessParam.page}">
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
				<c:when test="${accessParam.page != accessParam.pageCount}">
					<span class="goPage" data-page="${accessParam.pageCount}">▶▶</span>
				</c:when>
				<c:otherwise>
					<span class="disable" data-page="${accessParam.pageCount}">▶▶</span>
				</c:otherwise>
			</c:choose>
			(${accessParam.page}/${accessParam.pageCount})
		</c:if>
	</div>
</div>
</body>
</html>