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
	<title>로그인</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<style type="text/css">
		#formLogin .center {
			text-align: center;
		}
		#formLogin #loginBtn {
			width: 80%;
		}
		#formLogin #joinBtn,
		#formLogin #findBtn {
			width: 40%;
		}
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function() {
			var us_email =  "<c:out value='${userData.us_email}' />"
			var remainCookie =  "<c:out value='${userData.remainCookie}' />"
			if (remainCookie != "") {
				$("#us_email").val(us_email);
				$("#useCookie").prop("checked", true);
				$("#remainCookie").val("on");
			} else {
				$("#useCookie").prop("checked", false);
				$("#remainCookie").val("");
			}
			
			/* 엔터키 입력 시 처리 이벤트 */
			$("#us_password").keydown(function(event) {
				if (event.keyCode == 13) {
					$("#loginBtn").click();
				}
			});
			
			$("#useCookie").change(function(){
				var isCheck = $(this).is(":checked");
				if (isCheck == true) {
					$("#remainCookie").val("on");
				} else {
					$("#remainCookie").val("");
				}
			});
			
			/* 로그인 버튼 클릭 시 처리 이벤트 */
			$("#loginBtn").click(function() {
				if (!chkSubmit($("#us_email"), "이메일을")) {
					return;
				} else if (!checkEmail($("#us_email"))) {
					return;
				} else if (!chkSubmit($("#us_password"), "비밀번호를")) {
					return;
				}
				$("#formLogin").attr({
					"method" : "post",
					"action" : "/user/access.do"
				});
				$("#formLogin").submit();
			});
			
			/* 회원가입 버튼 클릭 시 처리 이벤트 */
			$("#joinBtn").click(function(){
				location.href="/user/policies.do";
			});
			
			/* 비밀번호 찾기 버튼 클릭 시 처리 이벤트 */
			$("#findBtn").click(function(){
				location.href="/user/find.do";
			});
			
			/* 로그아웃 버튼 클릭 시 처리 이벤트 */
			$("#logoutBtn").click(function() {
				$("#formLogout").attr({
					"method" : "post",
					"action" : "/user/exit.do"
				});
				$("#formLogout").submit();
			});
		});
	</script>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.blancheUser}">
		<form name="formLogin" id="formLogin">
			<input type="hidden" name="remainCookie" id="remainCookie">
			<table>
				<colgroup>
					<col width="20%" />
					<col width="60%" />
					<col width="20%" />
				</colgroup>
				<tr>
					<td colspan="3" class="center">로그인</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2"><input type="email" name="us_email" id="us_email" maxlength="40" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><input type="password" name="us_password" id="us_password" /></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="checkbox" name="useCookie" id="useCookie" />
						<label for="useCookie">30일간 ID 저장</label>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3" class="center">
						<input type="button"  name="loginBtn" id="loginBtn" value="로그인" />
					</td>
				</tr>
				<tr>
					<td colspan="3" class="center">
						<input type="button" name="joinBtn" id="joinBtn" value="회원가입" />
						<input type="button" name="findBtn" id="findBtn" value="비밀번호 찾기" />
					</td>
				</tr>
			</table>
		</form>
	</c:when>
	<c:otherwise>
		<form name="formLogout" id="formLogout">
			${sessionScope.blancheUser.us_nickname}님. 환영합니다.<br />
			<input type="button" name="logoutBtn" id="logoutBtn" value="로그아웃">
		</form>
	</c:otherwise>
</c:choose>
</body>
</html>