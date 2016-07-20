<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>글 작성</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	
		<!-- <link rel="stylesheet" type="text/css" href="/include/css/common.css"> -->
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#boardInsertBtn").click(function() {
					if (!chkSubmit($("#b_name"), "이름을")) return;
					else if (!chkSubmit($("#b_title"), "제목을")) return;
					else if (!chkSubmit($("#b_content"), "작성할 내용을")) return;
					else if (!chkSubmit($("#file"), "첨부파일을")) return;
					else if (!chkSubmit($("#b_pwd"), "비밀번호를")) return;
					else {
						if (!chkFile($('#file'))) return;
						$("#f_writeForm").attr({
							"method":"POST",
							"action":"/board/boardInsert.do"
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
			<div class="contentTit"><h3>게시판 글작성</h3></div>
			
			<div class="contentTB">
				<!-- <form id="f_writeForm" name="f_writeForm"> -->
				<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">	<!-- enctype : 첨부 파일 시에는 꼭 추가해야함!!! -->
					<%-- ====================== 폼 시작 ====================== --%>
					<table id="boardWrite">
						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>
						<tr>
							<td class="ac">작성자</td>
							<td>
								<input type="text" name="b_name" id="b_name" />
							</td>
						</tr>
						<tr>
							<td class="ac">글제목</td>
							<td>
								<input type="text" name="b_title" id="b_title"  />
							</td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td>
								<textarea rows="10" cols="100" name="b_content" id="b_content"></textarea>
							</td>
						</tr>
						<tr>
							<td class="ac">첨부파일</td>
							<td>
								<input type="file" name="file" id="file" />
							</td>
						</tr>
						<tr>
							<td class="ac">비밀번호</td>
							<td>
								<input type="password" name="b_pwd" id="b_pwd" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			<%-- ====================== 폼 종료 ====================== --%>
			
			<%-- ==================== 버튼 출력 시작 ==================== --%>
			<div class="contentBtn">
				<input type="button" value="저장" class="but" id="boardInsertBtn" />
				<input type="button" value="목록" class="but" id="boardListBtn" />
			</div>
			<%-- ==================== 버튼 출력 종료 ==================== --%>
		</div>
	</body>
</html>
