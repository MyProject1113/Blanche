<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>글 목록</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	
		<!-- <link rel="stylesheet" type="text/css" href="/include/css/common.css">
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"> -->
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				
			});
		</script>
		
	</head>
	<body>
		<c:choose>
			<c:when test="${warningMsg == 1}">
				개설 신청중인 프로젝트가 있습니다.<br />
				My Page에서 확인 바랍니다.
			</c:when>
			<c:when test="${warningMsg == 2}">
				진행중인 프로젝트가 있습니다.<br />
				My Page에서 확인 바랍니다.
			</c:when>
			<c:otherwise>오류</c:otherwise>
		</c:choose>
	</body>
</html>