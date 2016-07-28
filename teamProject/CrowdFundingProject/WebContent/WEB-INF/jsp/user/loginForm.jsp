<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 홍길동 계정으로 접속하기 위한 임시 로그인창 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>로그인 화면</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	<script type="text/javascript">
		$(function() {
			/* 접속 버튼 클릭 시 처리 이벤트 */
			$("#loginBtn").click(function() {
				$("#formLogin").attr({
					"method" : "post",
					"action" : "/user/access.do"
				});
				$("#formLogin").submit();
			});
		});
	</script>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.blancheUser}">
		<form name="formLogin" id="formLogin">
			<label>이메일</label>
			<input type="text" name="us_email" id="us_email" value="javauser@oracle.com" /><br />
			<label>비밀번호</label>
			<input type="password" name="us_password"  id="us_password" value="1" /><br />
			<input type="button" name="loginBtn" id="loginBtn" value="접속">
		</form>
	</c:when>
	<c:otherwise>
		${sessionScope.blancheUser.us_nickname}님. 환영합니다.
	</c:otherwise>
</c:choose>
</body>
</html>