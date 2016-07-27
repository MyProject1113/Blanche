<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#title {
			font-size: 25px;
	}
	
	#button {
		font-size: 15px;
		font-weight: bold;
	}
	
	#text {
			vertical-align: top;
		}
	
	#search {
		vertical-align: top;
	
	}
	
	#addr1 {
		width: 250px;
	}
	
	input#search {
		float: right;
	}
	
	#addr2{
		margin: 0px;
	}
	
</style>
</head>
<body>
	<h2 id="title">리워드 & 금액 선택</h2>
	<h3>리워드 수령 정보</h3>
	<table>
	   <colgroup>
   			<col width="25%">
   			<col width="30%">
   			<col width="45%">
   	   </colgroup>
		<tr>
			<td id="text">
				받는분
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				연락처
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				이메일
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td rowspan="2" id="text">
				주소
			</td>
			<td colspan="2">
			<input type="button" id="search" name="search" value="우편번호 검색">
			<input type="text" id="addr1" name="addr1"></br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" id="addr2" >
			</td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td id="text">
				배송메모
			</td>
			<td colspan="2">
				<textarea rows="5" cols="54"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				</br></br></br>
				<span id="text">약관 동의</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area1"></textarea>
				&nbsp;
				<input type="checkbox" name="agree1">
					<span>위의 사항에 동의합니다.
					</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area2"></textarea>
				&nbsp;		
				<input type="checkbox" name="agree2">
					<span>위의 사항에 동의합니다.</span>
			</td>
		</tr>
		<tr>
			<td colspan="3" id="button">
				<input type="button" id="commit" name="commit" value="확인">
				<input type="button" id="cancel" name="cancel" value="취소">				
			</td>
		</tr>
	</table>
</body>
</html>