<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>글 수정</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	
		<!-- <link rel="stylesheet" type="text/css" href="/include/css/common.css">
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"> -->
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/**/
				var img = $("<img>");	// 이미지 동적으로 생성
				$('#imgView').hover(function() {
					img.attr({
						src:"/uploadStorage/${updateData.b_file}",
						width:"450px",
						height:"200px"
					});
					img.addClass("imgViewData");
					$('#imgArea').append(img);
				}, function() {
					img.remove();
				});
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#boardUpdateBtn").click(function() {
					// 입력값 체크
					if (!chkSubmit($("#b_title"), "제목을")) return;
					else if (!chkSubmit($("#b_content"), "작성할 내용을")) return;
					else {
						if ($('#file').val().indexOf(".") > -1) {
							if (!chkFile($('#file'))) return;
						}
						//console.log("기본 파일명 : " + $('#b_file').val());
						$("#f_writeForm").attr({
							"method":"POST",
							"action":"/board/boardUpdate.do"
						});
						$("#f_writeForm").submit();
					}
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#boardListBtn").click(function() {
					location.href = "/board/boardList.do";
				});
			});
		</script>
	
	</head>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>게시판 글수정</h3></div>
			
			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
					<input type="hidden" id="b_num" name="b_num" value="${updateData.b_num}" />
					<input type="hidden" id="b_file" name="b_file" value="${updateData.b_file}" />
					<%-- ====================== 폼 시작 ====================== --%>
					<table>
						<colgroup>
							<col width="17%" />
							<col width="33%" />
							<col width="17%" />
							<col width="33%" />
						</colgroup>
						<tr>
							<td>글번호</td>
							<td>${updateData.b_num}</td>
							<td>작성일</td>
							<td>${updateData.b_date}</td>
						</tr>
						<tr>
							<td class="ac">작성자</td>
							<td colspan="3">${updateData.b_name}</td>
						</tr>
						<tr>
							<td class="ac">글제목</td>
							<td colspan="3">
								<input type="text" name="b_title" id="b_title" value="${updateData.b_title}" />
							</td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td colspan="3">
								<textarea rows="10" cols="100" name="b_content" id="b_content">${updateData.b_content}</textarea>
							</td>
						</tr>
						<tr>
							<td class="ac">첨부파일</td>
							<td colspan="3">
								<input type="file" name="file" id="file" />
								<label id="imgView">기존 이미지 파일명: ${updateData.b_file}<span id="imgArea"></span></label>
							</td>
						</tr>
						<tr>
							<td class="ac">비밀번호</td>
							<td colspan="3">
								<input type="password" name="b_pwd" id="b_pwd" />
								<label>수정할 비밀번호를 입력해 주세요.</label>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<%-- ====================== 폼 종료 ====================== --%>
			
			<%-- ==================== 버튼 출력 시작 ==================== --%>
			<div class="contentBtn">
				<input type="button" value="수정" class="but" id="boardUpdateBtn" />
				<input type="button" value="목록" class="but" id="boardListBtn" />
			</div>
			<%-- ==================== 버튼 출력 종료 ==================== --%>
		</div>
	</body>
</html>
