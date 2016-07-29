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
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
$(function() {
	$("#commit").click(function() {
		if(!chkSubmit($("#project_invest"), "후원할 금액을")) {
			return;
		}else {
			location.href="/intro/receiveInfo.do";
			}
		});
	});
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
	
	#show_me_the_money{
		width: 70%;
		heigth: 200px;
		float: center;
		margin: 5px;
		vertical-align: none;
	}
</style>
</head>
<body>
	<h2 id="title">금액 선택</h2>
	<h3>후원할 금액을 입력해 주세요.</h3>
		<table id="show_me_the_money">
			<tr>
				<td>
				<input type="text" id="project_invest" name="project_invest">
				</td>
				<td>
					<h3>원 이상</h3>
				</td>
			</tr>
		</table>
	
	<table>
		<tr>
			<!-- <a href="/intro/receiveInfo.do" class="c-pledge_button js-show-pledge-button">다음 단계</a>  -->	
		<input type="button" value="다음 단계" name="commit" id="commit">
			<input type="button" value="취소">
		</tr>
	</table>
</body>
</html>