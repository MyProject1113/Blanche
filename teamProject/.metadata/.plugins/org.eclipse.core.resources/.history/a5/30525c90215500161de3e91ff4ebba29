<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#next").click(function(){
		if(!chkSubmit($("#us_email"),"이메일을"))return;
		else if(!chkSubmit($("#us_passwd"),"비밀번호를"))return;
		
	});
	
	$(".find").click(function(){
		location.href="/usermanage/findpw.do";

	});
	$(".joinus").click(function(){
		location.href="/usermanage/agree.do";

	});
});


</script>
</head>
<body>
	<div>
		<form>
			<table>
				<tr>
					<td colspan="2" align="center">로그인</td>
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
					<td colspan="2" align="center"><input type="button" id="next" name="next" value="로그인"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><span class="find">비밀번호 찾기</span>/<span class=joinus>회원가입</span></td>
				</tr>
				<tr>
					<td colspan="2" align="center"></td>
				</tr>
			
			</table>
		</form>
	</div>


</body>
</html>