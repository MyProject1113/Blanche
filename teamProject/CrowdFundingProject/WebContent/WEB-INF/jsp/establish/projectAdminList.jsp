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
			form#f_data {
			    margin: 0 0 0 0;
			}
			table td {
			    vertical-align: middle;
			}
		</style>
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/* 검색화면 초기화 */
				/* $("#keyword_text").show();
				$("#keyword_check").hide(); */
				
				selectEvent("", "", 0);
				
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
				
				/* 검색 대상 승인 내용이 변경될 때마다 처리 이벤트 */
				$("#search_check").change(function() {
					selectEvent($("#searchCombo").val(), "", $("#search_check").val());
				});
				
				
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				/* $("#searchCombo").change(function() {
					if ($("#searchCombo").val() == "all") {
						$("#keyword_text").show();
						$("#keyword_check").hide();
						
						$("#keyword").val("전체 데이터 조회합니다.");
						
					} else if ($("#searchCombo").val() == "us_email") {
						$("#keyword_text").show();
						$("#keyword_check").hide();
						
						$("#keyword").val("");
						$("#keyword").focus();
						
					} else if ($("#searchCombo").val() == "intapp_check") {
						$("#keyword_text").hide();
						$("#keyword_check").show();
					}
				}); */
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function() {
					if ($("#searchCombo").val() != "all") {
						if (!chkSubmit($("#keyword"), "검색어를")) return;
					}
					goPage(1);
				});

				/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
				$("#pageSize").change(function() {
					goPage(1);
				});
				
				/* 개설신청 리스트 버튼 클릭 시 처리 이벤트 */
				$("#appBtn").click(function() {
					location.href = "/establish/applicationAdminList.do";
				});
				
				/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function() {
					var intro_index = $(this).parents("tr").attr("data-num");
					$("#intro_index").val(intro_index);
					console.log("글번호 : " + intro_index);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/establish/contentDetail.do"
					});
					$("#detailForm").submit();
				});
				
				/* 체크 버튼 전체 선택 시 처리 이벤트 */
				$("#all_select").change(function() {
					if($("input[id='all_select']:checked").val() == "Y") {
						checkboxSelectQue(1,'chk[]');
					} else {
						checkboxSelectQue(2,'chk[]');
					}
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
					"action":"/establish/projectAdminList.do"
				});
				$("#f_search").submit();
			}
			
			function checkboxSelectQue(n,obj) {
			    var i;
			    var chk = document.getElementsByName(obj);
			    var tot = chk.length;
			    for (i = 0; i < tot; i++) {
			        if (n == 1) chk[i].checked = true;
			        if (n == 2) chk[i].checked = false;
			        if (n == 3) chk[i].checked = !chk[i].checked;
			    }
			}
			
			
			function checkboxSelectReset(obj) {
			    var i, sum=0, tag=[], str="";
			    var chk = document.getElementsByName(obj);
			    var tot = chk.length;
			    for (i = 0; i < tot; i++) {
			        if (chk[i].checked == true) {
					    $("#intapp_index").val(chk[i].value);
			            $("#intapp_check").val(0);
			            updateData();
			        }
			    }
			}
			
			function checkboxSelectUpdate(obj) {
			    var i, sum=0, tag=[], str="";
			    var chk = document.getElementsByName(obj);
			    var tot = chk.length;
			    for (i = 0; i < tot; i++) {
			        if (chk[i].checked == true) {
			            tag[sum] = chk[i].value;
			            //sum++;
			            
			            $("#intapp_index").val(chk[i].value);
			            $("#intapp_check").val(2);
			            
			            updateData();

			        }
			    }
			    /* str += "선택갯수 : "+sum;
			    if(tag.length > 0) str += "\n값 : "+tag.join(","); */
			    
			   /*  if(tag.length > 0)
			    	str += "WHERE intapp_index IN ("+tag.join(",");
			    str += ")";
			    
			    alert(str); */
			    
			}
			
			
			
			
			function updateData() {
				$.ajax ({
					url : "/establish/projectApprovalUpdate.do",	// 전송 url
					type : "POST",	// 전송 시 method 방식
					data : $("#f_data").serialize(),	// 폼전체 데이터 전송
					/* dataType : "text", */
					error : function() {	// 실행시 오류가 발생하였을 경우
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},	// 정상적으로 실행이 되었을 경우
					success : function(resultData) {
						if (resultData == 0) {	// 일치하지 않는 경우
							alert('승인 실패');
						} else if (resultData == 1) {	// 일치할 경우
							alert('승인 성공');
							location.href = "/establish/projectAdminList.do";
						}
					}
				});
			}
			
			/* 검색 대상 내용 처리 함수 */
			function selectEvent(selectObj, keyword, value) {
				if (selectObj == "intapp_check") {
					$("#keyword_text").hide();
					$("#keyword_check").show();
					
					$("#search_check").val(value);
					$("#keyword").val(value);
					
				} else {
					$("#keyword_text").show();
					$("#keyword_check").hide();
					
					$("#keyword").val("전체 데이터를 조회합니다.");
				}
			}
		</script>
	
	</head>
	<body>
		<div id="tabBtn">
			<input type="button" value="개설신청" id="appBtn" />
			<input type="button" value="프로젝트 승인" id="projectBtn" disabled="disabled" />
		</div>
		
		<div class="contentContainer">
			<div class="contentTit"><h3>프로젝트 상태 리스트</h3></div>
			
			<%-- ================== 상세 페이지 이동을 위한 FORM ================== --%>
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="intro_index" id="intro_index" />
				<!-- <input type="hidden" name="intapp_index" id="intapp_index" /> -->
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
							<col width="25%"></col>
						</colgroup>
						<tr>
							<td>
								<label>검색조건</label>
							</td>
							<td>
								<select id="searchCombo" name="searchCombo">
									<option value="all">전체</option>
									<option value="intapp_check">승인여부</option>
								</select>
							</td>
							<td>
								<div id="keyword_text">
									<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" />
								</div>
								
								<div id="keyword_check">
									<select id="search_check" name="search_check">
										<option value="0">진행중</option>
										<option value="1">수정요청</option>
										<option value="2">수정승인</option>
										<option value="3">삭제요청</option>
										<option value="4">기간만료</option>
									</select>
								</div>
							</td>
							<td>
								<input type="button" value="검색" id="searchData" />
							</td>
							<td>
							</td>
							<td>
							
								<!-- <input type="button" value="전체선택" onclick="checkboxSelectQue(1,'chk[]')" />
								<input type="button" value="전체해제" onclick="checkboxSelectQue(2,'chk[]')" />
								<input type="button" value="선택반전" onclick="checkboxSelectQue(3,'chk[]')" /> -->
								<!-- <input type="button" value="선택갯수 및 값 확인" onclick="checkboxSelectCount('chk[]')" /> -->


								<input type="button" value="초기화" id="resetBtn" onclick="checkboxSelectReset('chk[]')" />
								<input type="button" value="수정승인" id="updateBtn" onclick="checkboxSelectUpdate('chk[]')" />
								<!-- <input type="button" value="삭제" id="deleteBtn" /> -->
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
						<col width="5%" />
						<col width="10%" />
						<col width="25%" />
						<col width="25%" />
						<col width="10%" />
						<col width="25%" />
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" class="chk" id="all_select" value="Y" /></th>
							<th><a href="javascript:setOrder('intapp_index');">신청번호
								<c:choose>
									<%-- <c:when test="${data.order_sc == 'ASC'}">▲</c:when>
									<c:when test="${data.order_sc == 'DESC'}">▼</c:when> --%>
									<c:when test="${data.order_by == 'intapp_index' and data.order_sc == 'ASC'}">▲</c:when>
									<c:when test="${data.order_by == 'intapp_index' and data.order_sc == 'DESC'}">▼</c:when>
									<c:otherwise>▲</c:otherwise>
								</c:choose>
							</a></th>
							<th>제목</th>
							<th>요청이유</th>
							<th>승인여부</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty projectList}">
								<c:forEach var="pro" items="${projectList}" varStatus="status">
									<tr class="tac" data-num="${pro.intro_index}">
										<td><input type="checkbox" name="chk[]" value="${pro.intapp_index}" /></td>
										<td>${pro.intapp_index}</td>
										<td class="tal">
											<span class="goDetail">${pro.intro_title}</span>
										</td>
										<td>${pro.intapp_reason}</td>
										<td>
											<c:choose>
												<c:when test="${pro.intapp_check == '0'}">진행중</c:when>
												<c:when test="${pro.intapp_check == '1'}">수정요청</c:when>
												<c:when test="${pro.intapp_check == '2'}">수정승인</c:when>
												<c:when test="${pro.intapp_check == '3'}">삭제요청</c:when>
												<c:when test="${pro.intapp_check == '4'}">기간만료</c:when>
											</c:choose>
										</td>
										<td>
											<form id="f_data" name="f_data">
												<%-- <input type="hidden" name="intapp_index" id="intapp_index" value="${pro.intapp_index}" /> --%>
												<input type="hidden" name="intapp_index" id="intapp_index" />
												<input type="hidden" name="intapp_check" id="intapp_check" />
												<input type="text" id="intapp_note" name="intapp_note" value="${pro.intapp_note}" />
											</form>
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
