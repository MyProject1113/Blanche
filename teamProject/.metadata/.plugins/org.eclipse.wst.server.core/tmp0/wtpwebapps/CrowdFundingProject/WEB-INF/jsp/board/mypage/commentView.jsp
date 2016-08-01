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
				addPageItem(page, pageCount);
			}, error : function() {
				alert("댓글 페이지를 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
			}
		});
		
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
	function addPageItem(page, pageCount) {
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
			if (i > (page - 3) && i < (page + 3)) {
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
	<div id="commentList" class="left">
	</div>
	<div id="commentButton" class="center">
	</div>
</div>