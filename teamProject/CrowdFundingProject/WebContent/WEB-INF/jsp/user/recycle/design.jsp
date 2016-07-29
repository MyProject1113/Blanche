<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#switch").click(function(){
		if(!chkSubmit($("#us_passwd"),"비밀번호를"))return;	
		if(!chkSubmit($("con"),"비밀번호 재입력을"))return;	

	});
	$("#pwch").click(function(){
		location.href="/usermanage/pwchange.do";
	});
	$("#phch").click(function(){
		location.href="/usermanage/phchange.do";
	});
	$("#fundch").click(function(){
		location.href="/usermanage/design.do";
	});
	$("#invch").click(function(){
		location.href="/usermanage/invest.do";
	});
	
	$(".goDetail").click(function(){
		location.href="/usermanage/pwchange.do";
		/* var b_num = $(this).parents("tr").attr("data-num");
		$("#b_num").val(b_num);
		console.log("글번호 : "+b_num); */
	//상세페이지로 이동하기 위해form추가 (id:detailForm)
		/* $("#detailForm").attr({
			"method":"get","action":"/board/boardDetail.do"
		});
	$("#detailForm").submit(); */
	});
	
});
</script>



</head>
<body>
	<div>
		<form>
		<h1>My Page</h1>
		<br/>
		<input type="button" id="pwch" name="pwch" value="비밀번호 변경"/>
		<input type="button" id="phch" name="phch" value="연락처 변경"/>
		<input type="button" id="fundch" name="fundch" value="기획정보"/>
		<input type="button" id="invch" name="invch" value="투자정보"/>
			<table border=0>
				
			
				<tr>
					<td colspan="3" align="center">기획정보</td>
				</tr>
				
				<tr>
					<td>내 기획정보</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><span class="goDetail">쥬시</span>
					<%-- <c:choose>
						<c:when>
							<c:forEach>
								<tr class="tac" data-num="${board.b_num }">
									<td><span class="goDetail">쥬시</span></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose> --%>
					
					
					
					</td>
				</tr>
			
			</table>
		</form>
	</div>


</body>
</html>








