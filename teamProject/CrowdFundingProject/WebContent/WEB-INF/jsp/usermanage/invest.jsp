<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    --%> 
<!DOCTYPE html >
<html>
	<head>
		<meta  charset="UTF-8">
		<title>My Page</title>
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".goDetail").click(function(){
					var num =$(this).parents("tr").attr("data-num");
					console.log("num : " + num);
					 $("#intro_index").val(num); 
					$("#detailForm").attr({
						"method":"get","action":"/establish/contentDetail.do"
					});
					$("#detailForm").submit();
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
				var check = false;
				$(".addchange").click(function(){
					var civa =$(this).parents("tr").attr("data-num");
					location.href="/usermanage/investForm.do?change=" + civa;
				});
				$(".complete").click(function(){
					var no = $(this).parents("tr").children().eq(0).attr("data-num");
					 var add = $(this).parent().children().eq(0).val();
			  		$("#sponser_index").val(no);
					$("#sponser_add").val(add);
					$("#hard").attr({
						"method":"post", "action":"/usermanage/hard.do"
					})
					$("#hard").submit();
				})
				
				
			});
		</script>
	
	</head>
	<body>
		<div>
			<h1>My Page</h1>
			<br/>
			<input type="button" id="pwch" name="pwch" value="비밀번호 변경"/>
			<input type="button" id="phch" name="phch" value="연락처 변경"/>
			<input type="button" id="fundch" name="fundch" value="기획정보"/>
			<input type="button" id="invch" name="invch" value="투자정보"/>
			<br /><br />
			
			<table>
				<tr>
				<td colspan="3" align="center">투자정보</td>
				</tr>
				
				<tr>
				<td>내 투자정보</td>
				</tr>
				<tr>
				<td colspan="3" align="center">
				<div class="contentContainer">
				<div class="contentTit"><h3>후원 리스트</h3></div>
				
				<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
				<form name="detailForm" id="detailForm">
				<input type="hidden" name="intro_index" id="intro_index" />
				</form>
				
				<%-- ==================== 리스트 시작 ==================== --%>
				<form id="hard">
				<input type="hidden" name="sponser_index" id="sponser_index" />
				<input type="hidden" name="sponser_add" id="sponser_add" />
				</form>
				<div id="boardList">
				
				<table summary="게시판 리스트">
				<colgroup>
				<col width="10%" />
				<col width="25%" />
				<col width="15%" />
				<col width="32%" />
				<col width="10%" />
				<col width="8%" />
				</colgroup>
				<thead>
				<tr>
				<th>수령인</th>
				<th>프로젝트명</th>
				<th>수령자 연락처</th>
				<th>수령 주소</th>
				<th></th>
				<th>남은 날짜</th>
				</tr>
				</thead>
				<tbody>
				<!-- 데이터 출력 -->
				
				<c:choose>
				
				<c:when test="${not empty introList}">
				<c:forEach var="spon" items="${introList}" varStatus="status">
				<tr data-num="${intro_index}">
				<td data-num="${spon.sponser_index }">${spon.sponser_name}</td>
				<td><span class="goDetail" style="text-overflow:ellipsis; overflow:hidden;">${intro_title}</span></td>
				<td>${spon.sponser_email}<br />${spon.sponser_phone}</td>
				<td data-name="${spon.sponser_add}">
				<c:choose>
				<c:when test="${change eq intro_index}">
				<input type="text" id="add" name="add" value="${spon.sponser_add}">
				<td>
				<input type="button" class="complete" value="확인"/>
				</td>
				</c:when>
				<c:otherwise>
				${spon.sponser_add}
				<td>
				<input type="button" class="addchange"  value="변경"/>
				<input type="hidden" id="hide" value="${intro_index}" >
				</td>
				</c:otherwise>
				</c:choose>
				</td>
				<td>
				${dday} 일
				</td>
				</tr>
				</c:forEach>
				</c:when>
				
				<c:otherwise>
				<tr>
				<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
				</c:otherwise>
				</c:choose>
							
				</tbody>
				</table>
				</div>
				<%-- ==================== 리스트 종료 ==================== --%>
					
				</div>
				</td>
				</tr>
				<tr>
				<td colspan="3" align="center">
				<div class="contentContainer">
					
				<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
				
				<div class="contentTit"><h3>투자 리스트</h3></div>
				<%-- ==================== 리스트 시작 ==================== --%>
				<div id="boardList">
				<table summary="게시판 리스트">
				<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="20%" />
				<col width="30%" />
				</colgroup>
				<thead>
				<tr>
				<th>결제방법</th>
				<th>투자금액</th>
				<th>은행</th>
				<th>계좌번호</th>
				
				</tr>
				</thead>
				<tbody>
				<!-- 데이터 출력 -->
				<c:choose>
				<c:when test="${not empty accountList}">
				<c:forEach var="account" items="${accountList}" varStatus="status">
				<tr>
				<td>${account.sponser_p_method}</td>
				<td>${account.sponser_invest}</td>
				<td>${account.usact_bank}</td>
				<td>${account.usact_number}</td>
					
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
				<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
				</table>
				</div>
				<%-- ==================== 리스트 종료 ==================== --%>
					
				</div>
				</td>
				</tr>
			</table>
		</div>
	</body>
</html>