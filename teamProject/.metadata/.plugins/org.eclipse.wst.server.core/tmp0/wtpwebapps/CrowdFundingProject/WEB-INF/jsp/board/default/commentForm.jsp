<%@page import="com.blanche.user.main.vo.UserMainVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 기본 댓글 목록 불러오기
		$("#boardIndex").val("<c:out value='${boardData.bd_index}' />");
		$("#commentPage").val(1);
		commentList();
		
		/* 댓글 텍스트 입력 시 처리 이벤트 */
		$("#bdcmt_content").keyup(function() {
			$("#commentSize").html("");
			var length = stringByteLength($("#bdcmt_content").val());
			$("#commentSize").html(length + "/600 Byte");
		});
		
		/* 댓글 저장 버튼 클릭 시 처리 이벤트 */
		$("#commentInsertBtn").click(function() {
			var boardIndex = $("#boardIndex").val();
			if (!checkSubmit($("#bdcmt_content"), 600, "댓글 내용")) {
				return;
			} else {
				$.ajax({
					url : "/board/comment/insert.do",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						bd_index : $("#boardIndex").val(),
						bdcmt_content : $("#bdcmt_content").val(),
						bdcmt_page : $("#commentPage")
					}),
					success : function(result) {
						if (result == "SUCCESS") {
							$("#bdcmt_content").val("");
							$("#bdcmt_content").keyup();
							$("#commentPage").val(1);
							commentList(boardIndex);
						} else if (result == "LOGOUT") {
							alert("로그인 상태에서만 댓글을 작성할 수 있습니다.");
						}
					},
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					}
				});
			}
		});
		
		// 댓글 수정 버튼 클릭 시 처리 이벤트
		$(document).on("click", ".commentUpdateForm", function() {
			$(".commentResetBtn").click();
			var commentItem = $(this).parents(".commentItem");
			var commentArea = commentItem.find(".commentArea").eq(0); 
			var comment = commentArea.html();
			commentItem.find("input[Type='button']").hide();
			
			commentArea.html("");
			var txtArea = $("<textarea>");
			txtArea.attr({
				"name" : "commentContent",
				"id" : "commentContent"
			})
			txtArea.html(comment);
			var upInput = $("<input>");
			upInput.attr({
				"type" : "button",
				"value" : "수정완료"
			});
			upInput.addClass("commentUpdateBtn");
			var rsInput = $("<input>");
			rsInput.attr({
				"type" : "button",
				"value" : "수정취소"
			});
			rsInput.addClass("commentResetBtn");
			commentArea.append(txtArea);
			commentArea.append(upInput);
			commentArea.append(rsInput);
		});
		
		/* 댓글 수정완료 버튼 클릭 시 처리 이벤트 */
		$(document).on("click", ".commentUpdateBtn", function() {
			if (!checkSubmit($("#commentContent"), "댓글 내용을")) {
				return;
			} else {
				$.ajax({
					url : "/board/comment/update.do",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						bdcmt_index : $(this).parents(".commentItem").attr("data-num"),
						bdcmt_content : $("#commentContent").val()
					}),
					success : function(result) {
						if (result == "SUCCESS") {
							var boardIndex = $("#boardIndex").val();
							commentList(boardIndex);
						} else if (result == "LOGOUT") {
							alert("로그인 상태에서만 댓글을 수정할 수 있습니다.");
						}
					},
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					}
				});
			}
		});
		
		/** 댓글 수정취소 버튼 클릭 시 처리 이벤트  */
		$(document).on("click", ".commentResetBtn", function() {
			var commentItem = $(this).parents(".commentItem");
			var commentArea = commentItem.find(".commentArea");
			var comment = commentArea.find("#commentContent").html();
			commentItem.find("input[Type='button']").show();
			commentArea.html(comment);
		});
		
		/** 댓글 삭제 버튼 클릭 시 처리 이벤트 */
		$(document).on("click", ".commentDeleteBtn", function() {
			if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/board/comment/delete.do",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						bdcmt_index : $(this).parents(".commentItem").attr("data-num"),
					}),
					success : function(result) {
						if (result == "SUCCESS") {
							var boardIndex = $("#boardIndex").val();
							commentList(boardIndex);
						} else if (result == "LOGOUT") {
							alert("로그인 상태에서만 댓글을 삭제할 수 있습니다.");
						}
					},
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
					}
				});
			}
		});
		
		/* 페이지 버튼 클릭 시 처리 이벤트 */
		$(document).on("click", ".goCommentPage", function() {
			var commentPage = $(this).attr("data-page");;
			$("#commentPage").attr("value", commentPage);
			commentList();
		});
	});
	
	// 댓글 목록을 보여주는 함수
	function commentList() {
		$("#commentList").html("");
		$("#commentButton").html("");
		
		$.ajax({
			url : "/board/comment/list.do",
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "json",
			data : JSON.stringify({
				bd_index : $("#boardIndex").val(),
				page : $("#commentPage").val()
			}),
			success : function(result) {
				$(result).each(function() {
					var bdcmt_index = this.bdcmt_index;
					var bdcmt_content = this.bdcmt_content;
					var bdcmt_regdate = this.bdcmt_regdate;
					var bdcmt_modidate = this.bdcmt_modidate;
					var nickname = this.nickname;
					var editable = this.editable;
					addNewItem(bdcmt_index, bdcmt_content, bdcmt_regdate, bdcmt_modidate, nickname, editable);
				});
			}, error : function() {
				alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
			}
		});
		
		$.ajax({
			url : "/board/comment/page.do",
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "json",
			data : JSON.stringify({
				bd_index : $("#boardIndex").val()
			}),
			success : function(result) {
				var page = $("#commentPage").val();
				var pageCount = result.pageCount;
				var pageSpare = result.pageSpare;
				addPageItem(page, pageCount, pageSpare);
			}, error : function() {
				alert("댓글 페이지 목록를 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
			}
		});
		
		$("#commentList").children().eq(0).focus();
	}
	
	// 댓글 목록 표시 함수
	function addNewItem(bdcmt_index, bdcmt_content, bdcmt_regdate, bdcmt_modidate, nickname, editable) {
		// 새로운 글이 추가될 li태그 객체
		var newDiv = $("<div>");
		newDiv.attr("data-num", bdcmt_index);
		newDiv.addClass("commentItem");
		
		// 작성자 정보가 저장될 <p> 태그
		var writerP = $("<p>");
		writerP.addClass("commentWriter");
		
		// 작성자 정보의 이름
		var nameSpan = $("<span>");
		nameSpan.addClass("commentNickname");
		nameSpan.html(nickname);
		writerP.append(nameSpan);
		
		// 작성일시
		var dateSpan = $("<span>");
		dateSpan.addClass("commentModidate");
		dateSpan.html(bdcmt_modidate);
		writerP.append(dateSpan);
		
		if (editable == 1) {
			// 수정하기 버튼
			var upfInput = $("<input>");
			upfInput.attr({
				"type" : "button",
				"value" : "수정"
			});
			upfInput.addClass("commentUpdateForm");
			writerP.append(upfInput);
			
			// 삭제하기 버튼
			var delInput = $("<input>");
			delInput.attr({
				"type" : "button",
				"value" : "삭제"
			});
			delInput.addClass("commentDeleteBtn");
			writerP.append(delInput);
		}
		
		// 내용
		var contentP = $("<p>");
		contentP.addClass("commentArea");
		contentP.html(bdcmt_content);
		
		// 조립하기
		newDiv.append(writerP);
		newDiv.append(contentP);
		$("#commentList").append(newDiv);	
	}
	
	// 댓글 페이지 표시 함수
	function addPageItem(page, pageCount, pageSpare) {
		if (pageCount <= 1) {
			return;
		}
		
		var pageSpan = null;
		
		pageSpan = $("<span>");
		if (page != 1) {
			pageSpan.addClass("goCommentPage");
		} else {
			pageSpan.addClass("disable");
		}
		pageSpan.attr("data-page", 1);
		pageSpan.html("◀◀");
		$("#commentButton").append(pageSpan);
		$("#commentButton").append(" | ");
		
		for (var i = 1; i <= pageCount; i++) {
			if (i >= (page - pageSpare) && i <= (page + pageSpare)) {
				pageSpan = $("<span>");
				pageSpan.addClass("goCommentPage");
				pageSpan.attr("data-page", i);
				if (i == page) {
					pageSpan.attr("id", "currCommentPage");
				}
				pageSpan.html(i);
				$("#commentButton").append(pageSpan);
				$("#commentButton").append(" | ");
			}
		}
		
		pageSpan = $("<span>");
		if (page != pageCount) {
			pageSpan.addClass("goCommentPage");
		} else {
			pageSpan.addClass("disable");
		}
		pageSpan.attr("data-page", pageCount);
		pageSpan.html("▶▶");
		$("#commentButton").append(pageSpan);
	};
</script>
<div id="boardComment">
	<input type="hidden" name="boardIndex" id="boardIndex" />
	<input type="hidden" name="commentPage" id="commentPage" />
	<div id="commentWrite">
		<form id="commentForm">
			<table class="boardTable">
				<colgroup>
					<col width="15%">
					<col width="75%">
					<col width="10%">
				</colgroup>
				<tr>
					<td rowspan="2" class="columnName center">댓글달기</td>
					<td rowspan="2"><textarea name="bdcmt_content" id="bdcmt_content"></textarea></td>
					<td id="commentSize" class="center">0/600 Byte</td>
				</tr>
				<tr>
					<td class="center"><input type="button" value="등록" name="commentInsertBtn" id="commentInsertBtn" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="commentList" class="left">
	</div>
	<div id="commentButton" class="center">
	</div>
</div>