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
				���� ���
			</td>
			<td colspan="2">
				<select>
					<option>�ſ�ī��</option>
					<option>�������Ա�</option>
					<option>������ü</option>
					<option>�޴��� ����</option>
				</select>
			</td>
		<tr>
		<tr>
			<td id="text">
				ī�� ��ȣ
			</td>
			<td colspan="2">
				<input type="text">
			</td>
		</tr>
		<tr>
			<td id="text">
				ī�� ��¥
			</td>
			<td colspan="2">
				<input type="text">
			</td>
		</tr>
		<tr>
			<td id="text">
				ī�� ��й�ȣ
			</td>
			<td colspan="2">
				<input type="password">
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