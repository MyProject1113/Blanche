<%@page import="com.blanche.user.main.vo.UserMainVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	#replyContainer	{
		width: 100%;
		margin: 5px;
		padding: 5px;
	}
	#replyContainer table {
		border: 1px solid #000066;
		border-collapse: collapse;
	}
	#replyContainer tr,
	#replyContainer td {
		border: 1px solid #000066;
	}
	#replyContainer .center {
		text-align: center;
	}
	#replyContainer #re_name,
	#replyContainer #re_password {
		width: 100%
	}
	#replyContainer #re_content {
		width: 100%;
		height: 60px;
		resize: none;
	}
	#replyContainer #replyInsertBtn {
		width: 100%;
		height: 100%;
	}
</style>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
	var message = "작성시 입력한 비밀번호를 입력해 주세요.";
	
	$(function() {
		// 기본 댓글 목록 불러오기
		// $("#introIndex").val("<c:out value='${introData.bd_index}' />");
		$("#introIndex").val(28);
		$("#replyPage").val(1);
		
		listAll();
		
		/* 댓글 입력을 위한 Ajax 연동 처리 */
		$("#replyInsertBtn").click(function() {
			// 작성자 이름에 대한 입력여부 검사
			if (!checkSubmit($("#re_name"), 30, "이름")) {
				return;
			} else if (!checkSubmit($("#re_password"), 0, "비밀번호")) {
				return;
			} else if (!checkSubmit($("#re_content"), 600, "내용")) {
				return;
			} else {
				/** 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
				$.ajax({
					url : "/replies/insert.do",	// 전송 url
					type : "post",	// 전송 시 method 방식
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						intro_index : $("#introIndex").val(),
						re_name : $("#re_name").val(),
						re_password : $("#re_password").val(),
						re_content : $("#re_content").val()
					}),
					error : function() {	// 실행시 오류가 발생하였을 경우
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					},
					success : function(result) {
						if (result == "SUCCESS") {
							alert("댓글 등록이 완료되었습니다.");
							dataReset();
							listAll();
						}
					}
				});
			}
		});
		
		// 댓글 목록 보여주는 함수
		function listAll() {
			$("#replyList").html("");
			
			$.ajax({
				url : "/replies/list.do",
				type : "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "json",
				data : JSON.stringify({
					intro_index : $("#introIndex").val(),
					page : $("#replyPage").val()
				}),
				success : function(result) {
					$(result).each(function() {
						var re_index = this.re_index;
						var re_name = this.re_name;
						var re_content = this.re_content;
						var re_date = this.re_date;
						addNewItem(re_index, re_name, re_content, re_date);
					});
				}, error : function() {
					alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				}
			});
		}
		
		/** 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
		function addNewItem(re_index, re_name, re_content, re_date) {
			// 새로운 글이 추가될 li태그 객체
			var newDiv = $("<div>");
			newDiv.attr("data-num", re_index);
			newDiv.addClass("replyItem");
			
			// 작성자 정보가 저장될 <p> 태그
			var writereP = $("<p>");
			writereP.addClass("writer");
			
			// 작성자 정보의 이름
			var nameSpan = $("<span>");
			nameSpan.addClass("name");
			nameSpan.html(re_name + "님");
			
			// 작성일시
			var dateSpan = $("<span>");
			dateSpan.html(" / " + re_date + " ");
			
			// 내용
			var contentP = $("<p>");
			contentP.addClass("replyContent");
			contentP.html(re_content);
			
			// 조립하기
			writereP.append(nameSpan).append(dateSpan)
			newDiv.append(writereP).append(contentP);
			$("#replyList").append(newDiv);
		}
		
		function dataReset() {
			$("#re_name").val("");
			$("#re_password").val("");
			$("#re_content").val("");
		}
	});
</script>
<div id="replyContainer">
	<input type="hidden" name="introIndex" id="introIndex" />
	<input type="hidden" name="replyPage" id="replyPage" />
	<div id="replyWrite">
		<form id="replyForm">
			<table>
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="25%">
					<col width="10%">
				</colgroup>
				<tr>
					<td class="center">이름</td>
					<td><input type="text" name="re_name" id="re_name"></td>
					<td class="center">비밀번호</td>
					<td colspan=2"><input type="password" name="re_password" id="re_password"></td>
				<tr>
					<td rowspan="2" class="columnName center" class="center">댓글달기</td>
					<td colspan="3" rowspan="2"><textarea name="re_content" id="re_content"></textarea></td>
					<td id="replySize" class="center">0/600 Byte</td>
				</tr>
				<tr>
					<td class="center"><input type="button" value="등록" name="replyInsertBtn" id="replyInsertBtn" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="replyList">
	</div>
	<div id="replyButton">
	</div>
</div>