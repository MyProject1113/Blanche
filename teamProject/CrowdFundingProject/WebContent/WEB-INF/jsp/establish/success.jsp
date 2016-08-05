<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>신청</title>
		
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#main_btn').click(function(e) {
					location.href="/index.jsp";
				});
			});
		</script>
		
	</head>
	<body>
		<c:choose>
			<c:when test="${result == 1}">
				개설 신청에 성공했습니다.<br />
				관리자의 승인을 기다려주세요.<br /><br />
				<input type="button" id="main_btn" value="Main" />
			</c:when>
			<c:when test="${result == 2}">
				개설 신청 리스트 삭제 오류 발생<br /><br />
				<input type="button" id="main_btn" value="Main" />
			</c:when>
			<%-- <c:when test="${result == 3}">
				알수 없는 오류 발생<br />
				관리자에게 문의 해 주세요.<br /><br />
				<input type="button" id="main_btn" value="Main" />
			</c:when> --%>
			<c:otherwise>
				<!-- 개설 신청에 실패했습니다.<br />
				관리자에게 문의 해 주세요.<br /><br />
				<input type="button" id="main_btn" value="메인으로" /> -->
				
				접속자가 많은 관계로<br />
				잠시 후 다시 시도해 주시기 바랍니다.<br /><br />
				<input type="button" id="main_btn" value="Main" />
			</c:otherwise>
		</c:choose>
	</body>
</html>
