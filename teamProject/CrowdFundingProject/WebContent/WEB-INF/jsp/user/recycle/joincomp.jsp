<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#pwnext").click(function(){
		if(!chkSubmit($("#us_email"),"이메일을"))return;		
	});
	$("#complete").click(function(){
		location.href="/usermanage/design.do";

	});
	
});


</script>

</head>
<body>
	<div>
		<form>
			<table>
				<tr>
					<td colspan="2" align="center"><h1><strong>가입이 완료되었습니다.</strong></h1></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"><input type="button" id="complete" name="complete" value="홈으로"/></td>
				</tr>
				
			
			</table>
		</form>
	</div>


</body>
</html>