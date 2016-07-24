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
		
		<style type="text/css">
			#header .links li ul {
				background: rgb(255, 255, 255);
				display: none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
				position: absolute;
				width: 150px;
				height: auto;
				z-index: 200;
			}
			
			#header .links ul li ul li:first-child {
				border-left: solid 1px rgba(160, 160, 160, 0.3);
			    line-height: 1;
			    margin-top: 10px;
			    margin-left: 1em;
			    padding-left: 1em;
			}
			
			#header .links #dropDown {
				padding-top: 20px;
    			padding-bottom: 20px;
			}
			
			#header .links ul ul {
				padding-top: 20px;
    			margin-left: -15px;
			}
			
			#header .links ul li:hover ul {
				display: block;	/* 마우스 커서 올리면 서브메뉴 보이게 하기 */
			}
			
			#header .links ul ul li {
				border-left: solid 1px rgba(160, 160, 160, 0.3);
			    line-height: 1;
			    margin-left: 1em;
			    padding-left: 1em;
			    height: 30px;
			}



		</style>
		
		<!-- Scripts -->
		<script src="/include/assets/js/jquery.min.js"></script>
		<script src="/include/assets/js/skel.min.js"></script>
		<script src="/include/assets/js/util.js"></script>
		<script src="/include/assets/js/main.js"></script>
			
	</head>
	<body>	
	<!-- Wrapper -->
		<div id="wrapper">
			<tiles:insertAttribute name="header" />
			
		<!-- Main -->
			<div id="main">
				<tiles:insertAttribute name="body" />
			</div>
			
			<section id="sidebar">
			<!-- Footer -->
				<tiles:insertAttribute name="footer" />
			</section>
		</div>
	</body>
</html>
