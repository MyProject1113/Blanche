<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#sponser_p_method").change(function() {
			if($("#sponser_p_method").val()=="�ſ�ī��"){
				$("#cardInfo").show();
				$("#bankInfo").hide();
			}
			else if($("#sponser_p_method").val()=="�������Ա�"){
				$("#cardInfo").hide();
				$("#bankInfo").show();
				
				var date = new Date();
				date.setDate(date.getDate() + 7);
				
				var dateString = date.getFullYear() + "�� " + (date.getMonth() + 1) + "�� " + date.getDay() + "��";
				$("#b_limitdate").val(dateString);
			}
		});
	
		$("#commit").click(function() {
					if($("#sponser_p_method").val()=="�ſ�ī��"){
					if(!chkSubmit($("#c_num"), "ī�� ��ȣ��")){
						return;
					}
					else if(!chkSubmit($("#c_date"), "ī�� ��ȿ ��¥��")){
						return;
					}
					else if(!chkSubmit($("#c_pw"), "ī�� ��й�ȣ��")){
						return;
					}
					
					if(!chkSubmit($("#usact_number"), "ȯ�� ���� ��ȣ��")){
						return;
					}
					
					if($("input[id='agree']:checked").val() == "on") {
						if(confirm('������ �����Ͻðڽ��ϱ�?')) {
							$("#payment").attr({
								"method" : "post",
								"action" : "/intro/pay_success.do"
							});
							$("#payment").submit();
						}
					}
					else{
						alert("�� ������ ��� �а� �����ϼ����� üũ���ּ���");
						return;
					}
			}
			else if($("#sponser_p_method").val()=="�������Ա�"){
					if(!chkSubmit($("#usact_number"), "ȯ�� ���� ��ȣ��")){
						return;
					}
										
					if($("input[id='agree']:checked").val() == "on") {
						if(confirm('������ �����Ͻðڽ��ϱ�?')) {
							$("#payment").attr({
								"method" : "post",
								"action" : "/intro/pay_success.do"
							});
							$("#payment").submit();
						}
					}
					else{
						alert("�� ������ ��� �а� �����ϼ����� üũ���ּ���");
						return;
					}
			}
		});

	});
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
	<form id="payment" name="payment" method="post">
	<input type="hidden" name="intro_index" id="intro_index" value="${introData.intro_index}" />
	<input type="hidden" name="sponser_invest" id="sponser_invest" value="${introData.sponser_invest}" />
	<input type="hidden" id="sponser_name" name="sponser_name" value="${introData.sponser_name }">
	<input type="hidden" id="sponser_phone" name="sponser_phone" value="${introData.sponser_phone }">
	<input type="hidden" id="sponser_email" name="sponser_email" value="${introData.sponser_email }">
	<input type="hidden" id="sponser_addnum" name="sponser_addnum" value="${introData.sponser_addnum }">
	<input type="hidden" id="sponser_add" name="sponser_add" value="${introData.sponser_add }">
	<input type="hidden" id="sponser_memo" name="sponser_memo" value="${introData.sponser_memo }">
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
				<select name="sponser_p_method" id="sponser_p_method">
					<option value="�ſ�ī��" selected>�ſ�ī��</option>
					<option value="�������Ա�">�������Ա�</option>
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
				<input type="text" name="c_num" id="c_num">
			</td>
		</tr>
		<tr>
			<td id="text">
				ī�� ��¥
			</td>
			<td colspan="2">
				<input type="text" name="c_date" id="c_date">
			</td>
		</tr>
		<tr>
			<td id="text">
				ī�� ��й�ȣ
			</td>
			<td colspan="2">
				<input type="password" name="c_pw" id="c_pw">
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
					<option>���� 000-000-000000</option>
					<option>�ϳ����� 000-000-000000</option>
					<option>�������� 000-000-000000</option>
					<option>�������� 000-000-000000</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id="text">
				�Ա��ڸ�
			</td>
			<td colspan="2">
				<input type="text" name="b_name" id="b_name" readonly="readonly"  value="${introData.sponser_name }">
			</td>
		</tr>
		<tr>
			<td id="text">
				�Ա� ������
			</td>
			<td colspan="2">
				<input type="text" readonly="readonly" id="b_limitdate" >
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
					<select id="usact_bank" name="usact_bank">
						<option value="����">����</option>
						<option value="�ϳ�����">�ϳ�����</option>
						<option value="��������">��������</option>
						<option value="��������">��������</option>	
					</select>
				</td>
			</tr>
			<tr>
				<td>������ ��</td>
				<td colspan="2">
					<input type="text" id="cancel_name" name="cancel_name" readonly="readonly"  value="${introData.sponser_name }">
				</td>
			</tr>
			<tr>
				<td>
					���¹�ȣ
				</td>
				<td colspan="2">
					<input type="text" name="usact_number" id="usact_number">
				</td>
			</tr>
		</table>
		</form>
		<table>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area2"></textarea>
				&nbsp;		
				<input type="checkbox" name="agree" id="agree">
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