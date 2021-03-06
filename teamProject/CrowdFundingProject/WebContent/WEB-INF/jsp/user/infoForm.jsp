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
	<title>로그인 화면</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<style type="text/css">
		#formInfo .center {
			text-align: center;
		}
		#formInfo #goBtn {
			width: 80%;
		} 
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#goBtn").click(function(){
				location.href="/user/login.do";
			});
		});
	</script>
</head>
<body>
<form name="formInfo" id="formInfo">
	<table>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tr>
			<td colspan="2" class="center">회원정보</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${userData.us_email}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${userData.us_name}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${userData.us_nickname}</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${userData.us_phone}</td>
		</tr>
		<tr>
			<td colspan="2" class="center">이메일로 인증메일이 발송되었습니다.</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="button" name="goBtn" id="goBtn" value="로그인창으로 이동" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>