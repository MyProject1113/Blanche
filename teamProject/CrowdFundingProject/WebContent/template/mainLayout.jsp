<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- trimDirectiveWhitespaces : 브라우저 소스보기 시 빈줄 들어가는 것 없애기 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>Insert title here</title>
		
		<title><tiles:getAsString name="title"/></title>
	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
	
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" href="/include/assets/css/main.css" />
		
		<!-- Scripts -->
		<script src="/include/assets/js/jquery.min.js"></script>
		<script src="/include/assets/js/skel.min.js"></script>
		<script src="/include/assets/js/util.js"></script>
		<script src="/include/assets/js/main.js"></script>
			
	</head>
	<body>	
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Header -->
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			
			<!-- Main -->
			<div id="main">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
			
		<!-- Footer -->
		<div>
			<footer>
				<tiles:insertAttribute name="footer" />
			</footer>
		</div>
</html>
