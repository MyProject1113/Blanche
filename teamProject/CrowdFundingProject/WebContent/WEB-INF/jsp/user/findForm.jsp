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
		#formFind .center {
			text-align: center;
		}
		#formFind #sendBtn {
			width: 80%;
		}
		#loader{
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: 99999;
			background-color: #000;
			opacity: 0.7;
			display:none;
		}
		#loader .blink {
			font-size: 20px;
			font-weight: bold;
			margin: 10% 20%;
			text-align: center;
			-webkit-animation: mymove 1s infinite;
			animation: mymove 1s infinite;
		} 
		@webkit-keyframes mymove {
			0% { color: white; }
			50% { color: black; }
			100% { color: white; }
		}
		@keyframes mymove {
			0% { color: white; }
			50% { color: black; }
			100% { color: white; }
		}
	</style>
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="/include/js/common.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 인증메일 전송 버튼 클릭 시 처리 이벤트 */
			$("#sendBtn").click(function() {
				if (!chkSubmit($("#us_email"), "이메일을")) {
					return;
				} else if (!checkEmail($("#us_email"))) {
					return;
				} else {
					$.ajax({
						url : "/user/send.do",
						type : "post",
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : "text",
						beforeSend: function() { 
							$('#loader').show();
						},
						data : JSON.stringify({
							us_email : $("#us_email").val()
						}),
						success : function(result) {
							if (result == "SUCCESS") {
								alert("인증메일이 전송되었습니다. 확인해주십시오.");
							}
						},
						error : function() {
							alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
						},
						complete: function(){
							$('#loader').hide(); 
						}
					});
				}
			});
		});
	</script>
</head>
<body>
<form name="formFind" id="formFind">
	<table>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tr>
			<td colspan="2" class="center">이메일을 입력하시면, 비밀번호 변경을 위한 인증메일이 발송됩니다.</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="us_email" id="us_email" maxlength="40" /></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="button" value="인증메일 전송" name="sendBtn" id="sendBtn" />
			</td>
		</tr>
	</table>
</form>
<div id="loader"><div class="blink">인증메일을 전송하는 중입니다.</div></div>
</body>
</html>