<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>게시판 상세보기</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	
		<!-- <link rel="stylesheet" type="text/css" href="/include/css/common.css">
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"> -->
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			var butChk = 0;	// 수정버튼과 삭제버튼을 구별하기 위한 변수
			$(function() {
				$("#pwdChk").hide();
				
				/* 첨부파일 이미지 보여주기 위한 속성 추가 */
				var file = "<c:out value='${detail.b_file}' />";
				if (file != "") {
					$("#fileImage").attr({
						src:"/uploadStorage/${detail.b_file}",
						width:"450px",
						height:"200px"
					});
				}
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#updateForm").click(function() {
					$("#pwdChk").show();
					$("#msg").text("작성시 입력한 비밀번호를 입력해주세요.");
					butChk = 1;
				});
				
				/* 삭제 버튼 클릭 시 처리 이벤트 */
				$("#boardDelete").click(function() {
					$("#pwdChk").show();
					$("#msg").text("작성시 입력한 비밀번호를 입력해주세요.");
					butChk = 2;
				});
				
				/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
				$("#pwdBut").click(function() {
					pwdConfirm();
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#boardList").click(function() {
					location.href = "/board/boardList.do";
				});
			});
			
			/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수 */
			function pwdConfirm() {
				if (!chkSubmit($('#b_pwd'), "비밀번호를")) return;
				else {
					$.ajax ({
						url : "/board/pwdConfirm.do",	// 전송 url
						type : "POST",	// 전송 시 method 방식
						data : $("#f_pwd").serialize(),	// 폼전체 데이터 전송
						/* dataType : "text", */
						error : function() {	// 실행시 오류가 발생하였을 경우
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						},	// 정상적으로 실행이 되었을 경우
						success : function(resultData) {
							var goUrl="";	// 이동할 경로를 저장할 변수
							if (resultData == 0) {	// 일치하지 않는 경우
								$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color", "red");
								$("#b_pwd").select();
							} else if (resultData == 1) {	// 일치할 경우
								$("#msg").text("");
								if (butChk == 1) {	// 수정버튼 클릭시
									goUrl = "/board/updateForm.do";
								} else if (butChk == 2) {	// 삭제버튼 클릭시
									goUrl = "/board/boardDelete.do";
								}
								$("#f_data").attr("action", goUrl);
								$("#f_data").submit();
							}
						}
					});
				}
			}
		</script>
	
	</head>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>게시판 상세보기</h3></div>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}" />
				<input type="hidden" name="b_file" id="b_file" value="${detail.b_file}" />
			</form>
			
			<%-- ================ 비밀번호 확인 버튼 및 버튼 추가 시작 ================ --%>
			<table id="boardPwdBut">
				<tr>
					<td id="btd1">
						<div id="pwdChk">
							<form name="f_pwd" id="f_pwd">
								<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}" />
								<label for="b_pwd" id="l_pwd">비밀번호 : </label>
								<input type="password" name="b_pwd" id="b_pwd" />
								<input type="button" id="pwdBut" value="확인" />
								<span id="msg"></span>
							</form>
						</div>
					</td>
					<td id="btd2">
						<input type="button" value="수정" id="updateForm" />
						<input type="button" value="삭제" id="boardDelete" />
						<input type="button" value="목록" id="boardList" />
					</td>
				</tr>
			</table>
			<%-- ================ 비밀번호 확인 버튼 및 버튼 추가 종료 ================ --%>
			
			<%-- =================== 상세 정보 보여주기 시작 =================== --%>
			<div class="contentTB">
				<table>
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="ac">작성자</td>
							<td>${detail.b_name}</td>
							<td class="ac">작성일</td>
							<td>${detail.b_date}</td>
						</tr>
						<tr>
							<td class="ac">제목</td>
							<td colspan="3">${detail.b_title}</td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td colspan="3">${detail.b_content}</td>
						</tr>
						<tr>
							<td class="ac vm">첨부파일 이미지</td>
							<td colspan="3"><img id="fileImage"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%-- =================== 상세 정보 보여주기  종료 =================== --%>
		</div>
	</body>
</html>
