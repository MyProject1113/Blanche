<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#table {
		vertical-align: none;
	}
</style>
</head>
<body>
		<h2>결제가 완료 되었습니다!</h2>
		</br>
		<form>
		<table id="table">
			<colgroup>
   				<col width="25%">
   				<col width="30%">
   				<col width="45%">
   	   		</colgroup>
			<tr>
				<th colspan="3">
					<h2>결제 내역</h2>
				</th>
			</tr>
			<tr>
				<td>후원자 명</td>
				<td colspan="2">
					<input type="text" id="sponser_name" name="sponser_name" value="${introData.sponser_name }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>후원 금액</td>
				<td colspan="2">
					<input type="text" name="sponser_invest" id="sponser_invest" value="${introData.sponser_invest}" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>결제 방법</td>
				<td colspan="2">
					<input type="text" readonly="readonly" value="${introData.sponser_p_method}">
				</td>	
			</tr>
			<tr>
				<td>
					연락처
				</td>
				<td colspan="2">
					<input type="text" id="phone" name="phone" value="${introData.phone }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					이메일
				</td>
				<td colspan="2">
					<input type="text" id="sponser_email" name="sponser_email" value="${introData.sponser_email }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td rowspan="2">
					주소
				</td>
				<td colspan="2">
					<input type="text" id="sponser_addnum" name="sponser_addnum" value="${introData.sponser_addnum }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="sponser_add" name="sponser_add" value="${introData.sponser_add }" readonly="readonly">
				</td>
			</tr>
			 <tr>
				<td>
					배송메모
				</td>
				<td colspan="2">
					<textarea readonly="readonly">${introData.sponser_memo }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="메인 화면으로" onclick="/intro/intro.do">
				</td>
			</tr>
		</table>
		</form>
</body>
</html>