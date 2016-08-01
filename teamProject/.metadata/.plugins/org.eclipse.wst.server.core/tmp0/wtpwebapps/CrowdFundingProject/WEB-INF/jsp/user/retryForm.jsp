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
	<title>재전송</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<style type="text/css">
		#formRetry .center {
			text-align: center;
		}
		#formRetry #loginBtn {
			width: 80%;
		}
		#formRetry #joinBtn,
		#formRetry #findBtn {
			width: 40%;
		}
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#us_email").val("<c:out value='${userEmail}' />");
		});
	</script>
</head>
<body>
<form name="formRetry" id="formRetry">
	<table>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<tr>
			<td colspan="2" class="center">해당 아이디는 아직 인증되지 않았습니다.</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="us_email" id="us_email" readonly /></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="button" value="이메일로 재전송" name="retryBtn" id="retryBtn" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>