<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>글 목록</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	
		<!-- <link rel="stylesheet" type="text/css" href="/include/css/common.css">
		<link rel="stylesheet" type="text/css" href="/include/css/board.css"> -->
		
		<style type="text/css">
			div#tabBtn {
			    margin-bottom: 25px;
			}
		</style>
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/* 검색화면 초기화 */
				selectEvent("", "", 0);
				/* $("#keyword_text").show();
					$("#keyword_field").hide();
					$("#keyword_check").hide(); */
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				if ("<c:out value='${data.keyword}' />" != "") {
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#searchCombo").val("<c:out value='${data.searchCombo}' />");
					
					selectEvent($("#searchCombo").val(), $("#keyword").val(), $("#keyword").val());
				}
				
				/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하도록 */
				if ("<c:out value='${data.pageSize}' />" != "") {
					$("#pageSize").val("<c:out value='${data.pageSize}' />");
				}
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#searchCombo").change(function() {
					selectEvent($("#searchCombo").val(), "", 0);
				});
				
				/* 검색 대상 분야 내용이 변경될 때마다 처리 이벤트 */
				$("#search_field").change(function() {
					selectEvent($("#searchCombo").val(), "", $("#search_field").val());
				});
				
				/* 검색 대상 승인 내용이 변경될 때마다 처리 이벤트 */
				$("#search_check").change(function() {
					selectEvent($("#searchCombo").val(), "", $("#search_check").val());
				});
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function() {
					if ($("#searchCombo").val() == "app_topic") {
						if (!chkSubmit($("#keyword"), "검색어를")) return;
					}
					goPage(1);
				});
				
				/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
				$("#pageSize").change(function() {
					goPage(1);
				});
				
				/* 프로젝트 승인 리스트 버튼 클릭 시 처리 이벤트 */
				$("#projectBtn").click(function() {
					location.href = "/establish/projectAdminList.do";
				});
				
				/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function() {
					var app_index = $(this).parents("tr").attr("data-num");
					$("#app_index").val(app_index);
					console.log("글번호 : " + app_index);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/establish/applicationAdminDetail.do"
					});
					$("#detailForm").submit();
				});
			});

			/* 정렬 버튼 클릭 시 처리 함수 */
			function setOrder(order_by) {
				$("#order_by").val(order_by);
				if ($("#order_sc").val() == 'DESC') {
					$("#order_sc").val('ASC');
				} else {
					$("#order_sc").val('DESC');
				}
				goPage(1);
			}
			
			/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 */
			function goPage(page) {
				if ($("#searchCombo").val() == "all") {
					$("#keyword").val("");
				}
				$("#page").val(page);
				$("#f_search").attr({
					"method":"get",
					"action":"/establish/applicationAdminList.do"
				});
				$("#f_search").submit();
			}
			
			/* 검색 대상 내용 처리 함수 */
			function selectEvent(selectObj, keyword, value) {
				if (selectObj == "app_topic") {
					$("#keyword_text").show();
					$("#keyword_field").hide();
					$("#keyword_check").hide();
					
					$("#keyword").val(keyword);
					$("#keyword").focus();
					
				} else if (selectObj == "app_field") {
					$("#keyword_text").hide();
					$("#keyword_field").show();
					$("#keyword_check").hide();

					if (value == 0)
						value = "movie";
					$("#search_field").val(value);
					$("#keyword").val(value);
					
				} else if (selectObj == "appro_check") {
					$("#keyword_text").hide();
					$("#keyword_field").hide();
					$("#keyword_check").show();
					
					$("#search_check").val(value);
					$("#keyword").val(value);
					
				} else {
					$("#keyword_text").show();
					$("#keyword_field").hide();
					$("#keyword_check").hide();
					
					$("#keyword").val("전체 데이터를 조회합니다.");
				}
			}
		</script>
	
	</head>
	<body>
		<div id="tabBtn">
			<input type="button" value="개설신청" id="appBtn" disabled="disabled" />
			<input type="button" value="프로젝트 승인" id="projectBtn" />
		</div>
		
		<div class="contentContainer">
			<div class="contentTit"><h3>개설 신청 리스트</h3></div>
			
			<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="app_index" id="app_index" />
				<input type="hidden" name="page" value="${data.page}" />
				<input type="hidden" name="pageSize" value="${data.pageSize}" />
			</form>
			
			<%-- ==================== 검색기능 시작 ==================== --%>
			<div id="boardSearch">
				<form id="f_search" name="f_search">
					<input type="hidden" id="page" name="page" value="${data.page}" />
					<input type="hidden" id="order_by" name="order_by" value="${data.order_by}" />
					<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}" />
					<table summary="검색">
						<colgroup>
							<col width="10%"></col>
							<col width="15%"></col>
							<col width="40%"></col>
							<col width="5%"></col>
							<col width="5%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
						</colgroup>
						<tr>
							<td>
								<label>검색조건</label>
							</td>
							<td>
								 <select id="searchCombo" name="searchCombo"> 
								<!-- <select id="search" name="search" onChange="javascript:selectEvent(this)"> -->
									<option value="all">전체</option>
									<option value="app_topic">주제</option>
									<option value="app_field">분야</option>
									<option value="appro_check">승인여부</option>
								</select>
							</td>
							<td>
								<div id="keyword_text">
									<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" />
								</div>
								
								<div id="keyword_field">
									<select id="search_field" name="search_field">
										<option value="movie">영화 ∙ 공연</option>
										<option value="music">음악</option>
										<option value="design">디자인</option>
										<option value="book">출판</option>
										<option value="cooking">요리</option>
									</select>
								</div>
								
								<div id="keyword_check">
									<select id="search_check" name="search_check">
										<option value="0">심사 중</option>
										<option value="1">기각</option>
										<option value="2">승인</option>
										<option value="3">완료</option>
									</select>
								</div>
							</td>
							<td>
								<input type="button" value="검색" id="searchData" />
							</td>
							
							<td></td>
							<td>
								<label>한페이지에</label>
							</td>
							<td>
								<select id="pageSize" name="pageSize">
									<option value="5">5줄</option>
									<option value="10">10줄</option>
									<option value="25">25줄</option>
									<option value="50">50줄</option>
								</select>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<%-- ==================== 검색기능 종료 ==================== --%>
			
			<%-- ==================== 리스트 시작 ==================== --%>
			<div id="boardList">
				<table summary="게시판 리스트">
					<colgroup>
						<col width="10%" />
						<col width="47%" />
						<col width="15%" />
						<col width="15%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th><a href="javascript:setOrder('app_index');">신청번호
								<c:choose>
									<c:when test="${data.order_by == 'app_index' and data.order_sc == 'ASC'}">▲</c:when>
									<c:when test="${data.order_by == 'app_index' and data.order_sc == 'DESC'}">▼</c:when>
									<c:otherwise>▲</c:otherwise>
								</c:choose>
							</a></th>
							<th>주제소개</th>
							<th>분야</th>
							<th><a href="javascript:setOrder('app_date');">신청일
								<c:choose>
									<c:when test="${data.order_by == 'app_date' and data.order_sc == 'ASC'}">▲</c:when>
									<c:when test="${data.order_by == 'app_date' and data.order_sc == 'DESC'}">▼</c:when>
									<c:otherwise>▲</c:otherwise>
								</c:choose>
							</a></th>
							<th class="borcle">승인여부</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty applicationList}">
								<c:forEach var="app" items="${applicationList}" varStatus="status">
									<tr class="tac" data-num="${app.app_index}">
										<td>${app.app_index}</td>
										<td class="tal">
											<span class="goDetail" style="text-overflow:ellipsis; overflow:hidden;">${app.app_topic}</span>
										</td>
										<td>
											<c:choose>
												<c:when test="${app.app_field == 'movie'}">영화 ∙ 공연</c:when>
												<c:when test="${app.app_field == 'music'}">음악</c:when>
												<c:when test="${app.app_field == 'design'}">디자인</c:when>
												<c:when test="${app.app_field == 'book'}">출판</c:when>
												<c:when test="${app.app_field == 'cooking'}">요리</c:when>
											</c:choose>
										</td>
										<td>${app.app_date}</td>
										<td>
											<c:choose>
												<c:when test="${app.appro_check == '0'}">심사 중</c:when>
												<c:when test="${app.appro_check == '1'}">기각</c:when>
												<c:when test="${app.appro_check == '2'}">승인</c:when>
												<c:when test="${app.appro_check == '3'}">완료</c:when>
											</c:choose>
										</td>
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
			
			
			<%-- ================= 페이지 네비게이션 시작 ================= --%>
			<div id="boardPage">
				<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}" />
			</div>
			<%-- ================= 페이지 네비게이션 종료 ================= --%>
		</div>
	</body>
</html>
