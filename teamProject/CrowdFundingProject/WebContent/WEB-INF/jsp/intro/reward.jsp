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
<script type="text/javascript">
$(function() {
	$("#commit").click(function() {
		if(!chkSubmit($("#won"), "후원할 금액을")) {
			return;
		}else {
			location.href="";
			}
		})
	})
</script>
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
	<h2 id="title">금액 선택</h2>
	<h3>후원할 금액을 입력해 주세요.</h3>
	
	<c:forEach begin="1" end="6">
	<div class="show_me_the_money">
			<input type="text" id="won" name="won">
			<span>원 이상</br></span>
	</div>
	</c:forEach>
	
	<table>
		<tr>
			<input type="button" value="다음 단계">
			<input type="button" value="취소">
		</tr>
	</table>
</body>
</html>