<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>신청 성공</title>
		
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
		개설 신청에 성공했습니다.<br />
		관리자의 승인을 기다려주세요.<br />
		<input type="button" id="main_btn" value="메인으로" />
	</body>
</html>
