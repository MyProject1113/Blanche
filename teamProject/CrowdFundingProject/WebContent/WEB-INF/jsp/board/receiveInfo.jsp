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
	<h2 id="title">������ & �ݾ� ����</h2>
	<h3>������ ���� ����</h3>
	<table>
	   <colgroup>
   			<col width="25%">
   			<col width="30%">
   			<col width="45%">
   	   </colgroup>
		<tr>
			<td id="text">
				�޴º�
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				����ó
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				�̸���
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td rowspan="2" id="text">
				�ּ�
			</td>
			<td colspan="2">
			<input type="button" id="search" name="search" value="�����ȣ �˻�">
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
				��۸޸�
			</td>
			<td colspan="2">
				<textarea rows="5" cols="54"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				</br></br></br>
				<span id="text">��� ����</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area1"></textarea>
				&nbsp;
				<input type="checkbox" name="agree1">
					<span>���� ���׿� �����մϴ�.
					</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area2"></textarea>
				&nbsp;		
				<input type="checkbox" name="agree2">
					<span>���� ���׿� �����մϴ�.</span>
			</td>
		</tr>
		<tr>
			<td colspan="3" id="button">
				<input type="button" id="commit" name="commit" value="Ȯ��">
				<input type="button" id="cancel" name="cancel" value="���">				
			</td>
		</tr>
	</table>
</body>
</html>