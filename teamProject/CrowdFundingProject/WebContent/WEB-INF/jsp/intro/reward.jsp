<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript"></script>
<style type="text/css">
	#title {
			font-size: 25px;
	}
	
	#money {
		font-style:italic;
		font-size: 30px;
		font-weight: bold;
		
	}
	
	.show_me_the_money{
		width: 70%;
		heigth: 200px;
		float: center;
		border: solid 2px;
		margin: 5px;
	}
</style>
</head>
<body>
	<h2 id="title">리워드 & 금액 선택</h2>
	<h3>받으실 리워드를 선택해 주세요.</h3>
	
	<c:forEach begin="1" end="6">
	<div class="show_me_the_money">
		<input type="radio"  name="select">
			<span id="money">&nbsp;&nbsp;&nbsp;&nbsp;10,000,000,000</span>
			<span>원 이상</br></span>
			<label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				선물을 선택하지 않고, 밀어만 줍니다.</br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				선택자 수: 
			</label>
	</div>
	</c:forEach>
</body>
</html>