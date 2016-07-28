<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pay").change(function() {
			if($("#pay").val()=="card"){
				$("#cardInfo").show();
				$("#bankInfo").hide();
			}
			else if($("#pay").val()=="bank"){
				$("#cardInfo").hide();
				$("#bankInfo").show();	
			}
		})
		
	
		
		
	})
</script>
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
	
	#cardInfo {

	}
	
	#bankInfo {
		display: none;
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
				<select id="pay">
					<option value="card" selected="selected">�ſ�ī��</option>
					<option value="bank">�������Ա�</option>
					<option value="phone">�޴��� ����</option>
				</select>
			</td>
		</tr>
		</table>
		
		<table id="cardInfo">
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
		</table>
		
		<table id="bankInfo">
		<tr>
			<td id="text">
				���� ����
			</td>
			<td colspan="2">
				<select>
					<option>����</option>
					<option>�ϳ�����</option>
					<option>��������</option>
					<option>��������</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id="text">
				�Ա��ڸ�
			</td>
			<td colspan="2">
				<input type="text">
			</td>
		</tr>
		<tr>
			<td id="text">
				�Ա� ���¹�ȣ
			</td>
			<td colspan="2">
				<select>
					<option>000-000-000000</option>
					<option>111-111-111111</option>
					<option>222-222-222222</option>
					<option>333-333-333333</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id="text">
				�Ա� ������
			</td>
			<td colspan="2">
				<input type="text">
			</td>
		</tr>
		</table>
		
		<table>
		<tr>
			<td colspan="3">
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
		</table>
		
		<table>
			<tr>
				<td colspan="3">
					ȯ�� ���� ����
				</td>
			</tr>
			<tr>
				<td>
					���� ����
				</td>
				<td colspan="2">
					<select>
						<option></option>
						<option></option>
						<option></option>
						<option></option>	
					</select>
				</td>
			</tr>
			<tr>
				<td>
					���¹�ȣ
				</td>
				<td colspan="2">
					<input type="text">
				</td>
			</tr>
		</table>
		
		<table>
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