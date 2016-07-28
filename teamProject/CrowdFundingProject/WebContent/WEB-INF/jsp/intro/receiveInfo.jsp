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
			 if(!chkSubmit($("#name"), "받는 분을")) {
				return;
			}
			else if(!chkSubmit($("#phone"), "연락처를")) {
				return;
			}
			else if(!chkSubmit($("#email"), "이메일을")) {
				return;
			}
			else if(!chkSubmit($("#addr1"), "우편번호를")) {
				return;
			}
			else if(!chkSubmit($("#addr2"), "상세주소를")) {
				return;
			}	

			if($("input[name='agree1']:checked").val() == "on") {

				  if($("input[id='agree2']:checked").val() == "on") {

						location.href="/intro/payment.do";
					} else {
						alert("위 내용을 모두 읽고 이해하셨으면 체크해주세요");
						return;
					} 
			} else {
				alert("위 내용을 모두 읽고 이해하셨으면 체크해주세요");
				return;
			}
		});
		
		$("#search").click(
				function() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = ''; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수

			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    fullAddr = data.roadAddress;

			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    fullAddr = data.jibunAddress;
			                }

			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			                if(data.userSelectedType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }

			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                $('#postcode').val(data.zonecode); //5자리 새우편번호 사용
			                $('#address').val(fullAddr);

			                // 커서를 상세주소 필드로 이동한다.
			                $('#address').focus();
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
	<h2 id="title">리워드 & 금액 선택</h2>
	<h3>리워드 수령 정보</h3>
	<table>
	   <colgroup>
   			<col width="25%">
   			<col width="30%">
   			<col width="45%">
   	   </colgroup>
		<tr>
			<td id="text">
				받는분
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				연락처
			</td>
			<td colspan="2">
				<input type="text" id="phone" name="phone">
				</br>
			</td>
		<tr>
		<tr>
			<td id="text">
				이메일
			</td>
			<td colspan="2">
				<input type="text" id="email" name="email">
				</br>
			</td>
		<tr>
		<tr>
			<td rowspan="2">
				주소
			</td>
			<td colspan="2">
			<input type="button" id="search" name="search" value="우편번호 검색">
			<input type="text" id="postcode" name="postcode">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" id="address" name="address">
			</td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td id="text">
				배송메모
			</td>
			<td colspan="2">
				<textarea rows="5" cols="54" id="post" name="post"></textarea>
			</td>
		</tr>
		</table>
		
		<form name="form">
		<table>
		<tr>
			<td colspan="3">
				<span id="text">약관 동의</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area1"></textarea>
				&nbsp;
				<input type="checkbox" name="agree1" id="agree1">
					<span>위의 사항에 동의합니다.
					</span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<textarea rows="10" cols="50" name="area2"></textarea>
				&nbsp;		
				<input type="checkbox" name="agree2" id="agree2">
					<span>위의 사항에 동의합니다.</span>
			</td>
		</tr>
		</table>
		</form>
		
		<table>
		<tr>
			<td colspan="3" id="button">
				<input type="button" id="commit" name="commit" value="다음 단계">
				<input type="button" id="cancel" name="cancel" value="취소">				
			</td>
		</tr>
	</table>
</body>
</html>