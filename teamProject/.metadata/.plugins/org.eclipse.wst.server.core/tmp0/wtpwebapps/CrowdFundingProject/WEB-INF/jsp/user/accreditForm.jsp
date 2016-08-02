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
	<title>인증</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<style type="text/css">
		#formAccredit .center {
			text-align: center;
		}
		#formAccredit #goBtn,
		#formAccredit #changeBtn {
			width: 80%;
		} 
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#us_index").val("<c:out value='${accreditData.us_index}' />");
			
			/* 로그인창으로 이동 버튼 클릭 시 처리 이벤트 */
			$("#goBtn").click(function(){
				location.href="/user/login.do";
			});
			
			/* 비밀번호 변경 버튼 클릭 시 처리 이벤트 */
			$("#changeBtn").click(function() {
				if (!chkSubmit($("#us_password"), "비밀번호를")) {
					return;
				}
				$("#formAccredit").attr({
					"method" : "post",
					"action" : "/user/changePassword.do"
				});
				$("#formAccredit").submit();
			});
		});
</script>
</head>
<body>
<form name="formAccredit" id="formAccredit">
	<input type="hidden" name="us_index" id="us_index" />
	<c:choose>
		<c:when test="${accreditData.usacd_type == 0}">
				<table>
					<colgroup>
						<col width="100%">
					</colgroup>
					<tr>
						<td class="center">인증이 완료되었습니다. 다시 로그인을 시도해주십시오.</td>
					</tr>
					<tr>
						<td class="center">
							<input type="button" name="goBtn" id="goBtn" value="로그인창으로 이동" />
						</td>
					</tr>
				</table>
		</c:when>
		<c:otherwise>
			<table>
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="us_password" id="us_password" /></td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="button" name="changeBtn" id="changeBtn" value="비밀번호 변경" />
					</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</form>
</body>
</html>