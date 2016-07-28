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
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	$(function() {
		$("#commit").click(function() {
			 if(!chkSubmit($("#sponser_name"), "�޴� ����")) {
				return;
			}
			else if(!chkSubmit($("#phone"), "����ó��")) {
				return;
			}
			else if(!chkSubmit($("#sponser_email"), "�̸�����")) {
				return;
			}
			else if(!chkSubmit($("#sponser_addnum"), "�����ȣ��")) {
				return;
			}
			else if(!chkSubmit($("#sponser_add"), "���ּҸ�")) {
				return;
			}	

			if($("input[name='agree1']:checked").val() == "on") {

				  if($("input[id='agree2']:checked").val() == "on") {
						location.href="/intro/payment.do";
					} else {
						alert("�� ������ ��� �а� �����ϼ����� üũ���ּ���");
						return;
					} 
			} else {
				alert("�� ������ ��� �а� �����ϼ����� üũ���ּ���");
				return;
			}
		});
		
		$("#postSearch").click(
				function() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

			                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
			                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
			                var fullAddr = ''; // ���� �ּ� ����
			                var extraAddr = ''; // ������ �ּ� ����

			                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
			                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
			                    fullAddr = data.roadAddress;

			                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
			                    fullAddr = data.jibunAddress;
			                }

			                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
			                if(data.userSelectedType === 'R'){
			                    //���������� ���� ��� �߰��Ѵ�.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // �ǹ����� ���� ��� �߰��Ѵ�.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }

			                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
			                $('#sponser_addnum').val(data.zonecode); //5�ڸ� �������ȣ ���
			                $('#sponser_add').val(fullAddr);

			                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
			                $('#sponser_add').focus();
			            }
			        }).open();
			    })
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
				<input type="text" id="sponser_name" name="sponser_name">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				����ó
			</td>
			<td colspan="2">
				<input type="text" id="phone" name="phone">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				�̸���
			</td>
			<td colspan="2">
				<input type="text" id="sponser_email" name="sponser_email">
				</br>
			</td>
		<tr>
		<tr>
			<td rowspan="2">
				�ּ�
			</td>
			<td colspan="2">
			<input type="button" id="postSearch" name="postSearch" value="�����ȣ �˻�">
			<input type="text" id="sponser_addnum" name="sponser_addnum">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" id="sponser_add" name="sponser_add">
			</td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td id="text">
				��۸޸�
			</td>
			<td colspan="2">
				<textarea rows="5" cols="54" id="sponser_memo" name="sponser_memo"></textarea>
			</td>
		</tr>
		</table>
		
		<form name="form">
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
				<input type="checkbox" name="agree1" id="agree1">
					<span>���� ���׿� �����մϴ�.
					</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area2"></textarea>
				&nbsp;		
				<input type="checkbox" name="agree2" id="agree2">
					<span>���� ���׿� �����մϴ�.</span>
			</td>
		</tr>
		</table>
		</form>
		
		<table>
		<tr>
			<td colspan="3" id="button">
				<input type="button" id="commit" name="commit" value="���� �ܰ�">
				<input type="button" id="cancel" name="cancel" value="���">				
			</td>
		</tr>
	</table>
</body>
</html>