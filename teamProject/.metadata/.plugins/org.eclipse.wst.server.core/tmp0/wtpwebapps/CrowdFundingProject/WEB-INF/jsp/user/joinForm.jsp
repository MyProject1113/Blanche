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
	<title>회원가입</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="/image/icon.png" />
	<link rel="apple-touch-icon" href="/image/icon.png" />
	<!-- 모바일 웹 페이지 설정 끝 -->
	
	<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
	<![endif]-->
	
	<style type="text/css">
		#formJoin .center {
			text-align: center;
		}
		#formJoin #joinBtn {
			width: 80%;
		}
		#formJoin #userEmailCheck,
		#formJoin #userNicknameCheck {
			color: red;
		}
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#agreeDate1").val("<c:out value='${userData.agreeDate1}' />");
			$("#agreeDate2").val("<c:out value='${userData.agreeDate2}' />");
			
			$("#us_email").blur(function() {
				$("#us_email").trim;
				$.ajax({
					url : "/user/check.do",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						us_email : $("#us_email").val()
					}),
					success : function(result) {
						if (result == "FIND") {
							$("#userEmailCheck").html("해당 아이디는 이미 존재합니다.");
						} else {
							$("#userEmailCheck").html("");
						}
					},
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					}
				});
			});
			
			$("#us_nickname").blur(function() {
				$("#us_nickname").trim;
				$.ajax({
					url : "/user/check.do",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						us_nickname : $("#us_nickname").val()
					}),
					success : function(result) {
						if (result == "FIND") {
							$("#userNicknameCheck").html("해당 닉네임는 이미 존재합니다.");
						} else {
							$("#userNicknameCheck").html("");
						}
					},
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					}
				});
			});
			
			$("#joinBtn").click(function(){
				if (!checkSubmit($("#us_email"), 60, "이메일")) {
					return;
				} else if (!checkEmail($("#us_email"))) {
					return;
				} else if (!checkSubmit($("#us_password"), 100, "비밀번호")) {
					return;
				} else if (!checkSubmit($("#us_name"), 30, "이름")) {
					return;
				} else if (!checkSubmit($("#us_nickname"), 30, "닉네임")) {
					return;
				} else if (!checkSubmit($("#us_phone"), 11, "연락처")) {
					return;
				} else if ($("#userEmailCheck").html() != "") {
					alert($("#userEmailCheck").html());
				} else if ($("#userNicknameCheck").html() != "") {
					alert($("#userNicknameCheck").html());
				}
				$("#formJoin").attr({
					"method" : "post",
					"action" : "/user/info.do"
				});
				$("#formJoin").submit();
			});
		});
</script>
</head>
<body>
<form name="formJoin" id="formJoin">
	<input type="hidden" name="agreeDate1" id="agreeDate1" />
	<input type="hidden" name="agreeDate2" id="agreeDate2" /> 
	<table>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tr>
			<td colspan="2" class="center">회원가입</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="email" name="us_email" id="us_email" />
				<span id="userEmailCheck"></span>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="us_password" id="us_password" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="us_name" id="us_name" /></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" name="us_nickname" id="us_nickname" />
				<span id="userNicknameCheck"></span>
			</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="us_phone" id="us_phone" /></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="button" name="joinBtn" id="joinBtn" value="회원가입" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>