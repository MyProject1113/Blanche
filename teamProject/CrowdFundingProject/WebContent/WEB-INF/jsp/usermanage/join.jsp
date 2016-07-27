<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#next").click(function(){
		if(!chkSubmit($("#us_email"),"이메일을"))return;		
		if(!chkSubmit($("#us_passwd"),"비밀번호를"))return;	
		if(!chkSubmit($("#us_phone"),"연락처를"))return;	
		if(!chkSubmit($("#us_nickname"),"닉네임을"))return;
		else{
			 location.href="/usermanage/accredit.do";
		}
	});
	
});


</script>



</head>
<body>
	<div>
		<form>
			<table>
				<tr>
					<td colspan="3" align="center">회원가입</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="us_email" name="us_email"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="us_passwd" name="us_passwd"/></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" id="us_phone" name="us_phone"/></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" id="us_nickname" name="us_nickname"/>&nbsp;&nbsp;&nbsp;
					<td><input type="button" id="nickbtn" name="nickbtn" value="중복확인"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="button" id="next" name="next" value="다음"/></td>
				</tr>
			
			</table>
		</form>
	</div>


</body>
</html>