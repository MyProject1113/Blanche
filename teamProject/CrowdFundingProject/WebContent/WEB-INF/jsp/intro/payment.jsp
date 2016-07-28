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

		$("#pay").change(function() {
			if($("#pay").val()=="card"){
				$("#cardInfo").show();
				$("#bankInfo").hide();
			}
			else if($("#pay").val()=="bank"){
				$("#cardInfo").hide();
				$("#bankInfo").show();	
			}
		});
	
		$("#commit").click(function() {
					if($("#pay").val()=="card"){
					if(!chkSubmit($("#c_num"), "카드 번호를")){
						return;
					}
					else if(!chkSubmit($("#c_date"), "카드 유효 날짜를")){
						return;
					}
					else if(!chkSubmit($("#c_pw"), "카드 비밀번호를")){
						return;
					}

					if(!chkSubmit($("#cancel_name"), "예금자 명을")){
						return;
					}
					
					if(!chkSubmit($("#cancel"), "환불 계좌 번호를")){
						return;
					}
					
					if($("input[id='agree']:checked").val() == "on") {
						alert("결제가 완료되었습니다.");
						location.href="/intro/pay_success.do";
					}
					else{
						alert("위 내용을 모두 읽고 이해하셨으면 체크해주세요");
						return;
					}
			}
			else if($("#pay").val()=="bank"){
					if(!chkSubmit($("#b_name"), "입금자 명을")){
						return;
					}
					
					if(!chkSubmit($("#cancel_name"), "예금자 명을")){
						return;
					}
					
					if(!chkSubmit($("#cancel"), "환불 계좌 번호를")){
						return;
					}
										
					if($("input[id='agree']:checked").val() == "on") {
						alert("결제가 완료되었습니다.");
						location.href="/intro/pay_success.do";
					}
					else{
						alert("위 내용을 모두 읽고 이해하셨으면 체크해주세요");
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
	<h2 id="title">리워드 & 금액 결제</h2>
	<h3>리워드 결제 정보</h3>
	<table>
	   <colgroup>
   			<col width="25%">
   			<col width="30%">
   			<col width="45%">
   	   </colgroup>
		<tr>
			<td id="text">
				결제 방법
			</td>
			<td colspan="2">
				<select id="pay">
					<option value="card">신용카드</option>
					<option value="bank">무통장입금</option>
				</select>
			</td>
		</tr>
		</table>
		
		<table id="cardInfo">
		<tr>
			<td id="text">
				카드 번호
			</td>
			<td colspan="2">
				<input type="text" name="c_num" id="c_num">
			</td>
		</tr>
		<tr>
			<td id="text">
				카드 날짜
			</td>
			<td colspan="2">
				<input type="text" name="c_date" id="c_date">
			</td>
		</tr>
		<tr>
			<td id="text">
				카드 비밀번호
			</td>
			<td colspan="2">
				<input type="password" name="c_pw" id="c_pw">
			</td>
		</tr>
		</table>
		
		<table id="bankInfo">
		<tr>
			<td id="text">
				은행 선택
			</td>
			<td colspan="2">
				<select>
					<option>농협 000-000-000000</option>
					<option>하나은행 000-000-000000</option>
					<option>신한은행 000-000-000000</option>
					<option>국민은행 000-000-000000</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id="text">
				입금자명
			</td>
			<td colspan="2">
				<input type="text" name="b_name" id="b_name">
			</td>
		</tr>
		<tr>
			<td id="text">
				입금 기한일
			</td>
			<td colspan="2">
				<input type="text">
			</td>
		</tr>
		</table>

		<table>
			<tr>
				<td colspan="3">
					환불 계좌 정보
				</td>
			</tr>
			<tr>
				<td>
					은행 선택
				</td>
				<td colspan="2">
					<select>
						<option>농협</option>
						<option>하나은행</option>
						<option>신한은행</option>
						<option>국민은행</option>	
					</select>
				</td>
			</tr>
			<tr>
				<td>예금자 명</td>
				<td colspan="2">
					<input type="text" id="cancel_name" name="cancel_name">
				</td>
			</tr>
			<tr>
				<td>
					계좌번호
				</td>
				<td colspan="2">
					<input type="text" name="cancel" id="cancel">
				</td>
			</tr>
		</table>
		
		<table>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area2"></textarea>
				&nbsp;		
				<input type="checkbox" name="agree" id="agree">
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