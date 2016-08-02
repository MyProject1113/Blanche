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
		#formRetry #retryBtn {
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
			$("#us_index").val("<c:out value='${userData.us_index}' />");
			$("#us_email").val("<c:out value='${userData.us_email}' />");
			
			/* 인증메일 재전송 버튼 클릭 시 처리 이벤트 */
			$("#retryBtn").click(function() {
				$.ajax({
					url : "/user/retry.do",
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
						us_index : $("#us_index").val()
					}),
					success : function(result) {
						if (result == "SUCCESS") {
							alert("인증메일이 전송되었습니다. 확인해주십시오.");
						} else if (result == "COMPLETE") {
							alert("인증이 이미 완료되어 있습니다.");
						}
					},
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					},
					complete: function(){
						$('#loader').hide(); 
					}
				});
			});
		});
	</script>
</head>
<body>
<form name="formRetry" id="formRetry">
	<input type="hidden" name="us_index" id="us_index" />
	<table>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tr>
			<td colspan="2" class="center">해당 아이디는 아직 인증되지 않았습니다.</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="us_email" id="us_email" readonly /></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="button" value="인증메일 재전송" name="retryBtn" id="retryBtn" />
			</td>
		</tr>
	</table>
</form>
<div id="loader"><div class="blink">인증메일을 전송하는 중입니다.</div></div>
</body>
</html>