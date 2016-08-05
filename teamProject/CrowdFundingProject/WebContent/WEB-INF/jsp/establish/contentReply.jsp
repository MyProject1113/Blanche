<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>Insert title here</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" href="/include/css/contentDetail2.css" />
		
		<style type="text/css">
			span.pSize {
			    font-size: 1em;
			}
			h1.headline {
			    font-size: 2em;
			    word-spacing: -10px;
			}
			p.deck.text-size_xl {
			    word-spacing: 7px;
			    font-weight: bold;
			    font-style: italic;
			}
			span.donationSpan {
			    font-style: italic;
			    font-weight: bold;
			}
			div#blank_reply {
			    height: 10px;
			}
			
			input#replyInsert {
			    float: right;
			}
		</style>
		
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			//var replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요.", r_pwdConfirm = 0, btnkind = "";
			$(function() {
				/* 기본 덧글 목록 불러오기 */
				//var intro_index = "<c:out value='${introDetail.intro_index}' />";
				//listAll(b_num);
				
				//addNewItem(r_num, r_name, r_content, r_date);
				
				
				/* 기획자 이미지 보여주기 */
				var imageSrc = "${plannerDetail.plan_image}";
				if (imageSrc != null && imageSrc != "") {
					$("#planFileImage").attr({
						src:"/uploadStorage/${plannerDetail.plan_image}",
						width:"62px",
						height:"62px"
					});
				} else {
					$("#planFileImage").attr({
						src:"../image/common/noimage.gif",
						width:"62px",
						height:"62px"
					});
				}
				
				console.log(new Date().format("yyyy-MM-dd hh:mm:ss"));
				
				
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#replyInsertBtn").click(function() {
					if (!chkSubmit($("#re_content"), "작성할 내용을")) return;
					else {
						$.ajax ({
							url : "/establish/replyInsert.do",	// 전송 url
							type : "POST",	// 전송 시 method 방식
							data : $("#comment_form").serialize(),	// 폼전체 데이터 전송
							/* dataType : "text", */
							error : function() {	// 실행시 오류가 발생하였을 경우
								alert('후원자만 댓글 등록이 가능합니다.');
							},	// 정상적으로 실행이 되었을 경우
							success : function(resultData) {
								if (resultData == 0) {	// 일치하지 않는 경우
									alert('댓글 등록 실패');
								} else if (resultData == 1) {	// 일치할 경우
									//alert('수정 성공');

									addNewItem($("#re_name").val(), new Date().format("yyyy-MM-dd hh:mm:ss"), $("#re_content").val());
									$("#re_content").val("");
								}
							}
						});
					}
				});
					
					
				/* 덧글 내용 저장 이벤트 */
				/* $("#replyInsertBtn").click(function() {
					if (!chkSubmit($("#re_content"), "작성할 내용을")) return;
					else {
						var insertUrl = "/establish/replyInsert.do"; */
						/** 글 저장을 위한 Post 방식의 Ajax 연동 처리 **/
						/* $.ajax({
							url : insertUrl,	// 전송 url
							type : "post",	// 전송 시 method 방식
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType : "text",
							data : JSON.stringify({
								re_name : "${us_name}",
								re_password : "1234",
								re_content : $("#re_content").val(),
								intro_index : "${introDetail.intro_index}"
							}),
							error : function() {	// 실행시 오류가 발생하였을 경우
								//alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
								alert('후원자만 댓글 등록이 가능합니다.');
							},
							success : function(resultData) {
								if (resultData == "SUCCESS") {
									alert("댓글 등록이 완료되었습니다.");
									//dataReset();
									//listAll(b_num);
									
									$("#re_content").val("");
								}
							}
						});
					}
				}); */
			});
			
			
			Date.prototype.format = function(f) {
			    if (!this.valueOf()) return " ";
			 
			    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
			    var d = this;
			     
			    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
			        switch ($1) {
			            case "yyyy": return d.getFullYear();
			            case "yy": return (d.getFullYear() % 1000).zf(2);
			            case "MM": return (d.getMonth() + 1).zf(2);
			            case "dd": return d.getDate().zf(2);
			            case "E": return weekName[d.getDay()];
			            case "HH": return d.getHours().zf(2);
			            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
			            case "mm": return d.getMinutes().zf(2);
			            case "ss": return d.getSeconds().zf(2);
			            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
			            default: return $1;
			        }
			    });
			};
			 
			String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
			String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
			Number.prototype.zf = function(len){return this.toString().zf(len);};
			
			
			
			/** 새로운 글을 화면에 추가하기 위한 함수 **/
			function addNewItem(re_name, re_date, re_content) {
				// 테이블 생성
				var reply_table = $("<table>");
				var col = $("<colgroup>");
				var col_01 = $("<col>");
				col_01.attr({"width" : "20%"});
				var col_02 = $("<col>");
				col_02.attr({"width" : "80%"});
				
				var tr_01 = $("<tr>");
				var th_01 = $("<th>");

				
				// 작성자 정보의 이름
				var name_span  = $("<span>");
				name_span.html(re_name + " 님");


				var td_01 = $("<td>");
				var date_span  = $("<span>");
				date_span.html(re_date);



				var tr_02 = $("<tr>");
				var td_02 = $("<td>");
				td_02.attr({"colspan" : "2"});

				
				var content_span  = $("<span>");
				content_span.html(re_content);



				// 조립하기
				col.append(col_01).append(col_02);
				
				th_01.append(name_span);
				td_01.append(date_span);

				tr_01.append(th_01).append(td_01);
				
				td_02.append(content_span);
				
				tr_02.append(td_02);
				
				reply_table.append(col).append(tr_01).append(tr_02);

				$("#comment_list").append(reply_table);
			}
			
			
			
			/* function addNewItem(r_num, r_name, r_content, r_date) {
				// 새로운 글이 추가될 li태그 객체
				var new_li = $("<li>");
				new_li.attr("data-num", r_num);
				new_li.addClass("comment_item");
				
				// 작성자 정보가 지정될 <p>태그
				var writer_p = $("<p>");
				writer_p.addClass("writer");
				
				// 작성자 정보의 이름
				var name_span  = $("<span>");
				name_span.addClass("name");
				name_span.html(r_name + "님");
				
				// 작성일시
				var date_span = $("<span>");
				date_span.html(" / " + r_date + " ");
				
				// 수정하기 버튼
				var up_input = $("<input>");
				up_input.attr({"type" : "button", "value" : "수정하기"});
				up_input.addClass("update_form");
				
				// 삭제하기 버튼
				var del_input = $("<input>");
				del_input.attr({"type" : "button", "value" : "삭제하기"});
				del_input.addClass("delete_btn");
				
				// 내용
				var content_p = $("<p>");
				content_p.addClass("con");
				content_p.html(r_content);
				
				// 조립하기
				writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
				new_li.append(writer_p).append(content_p);
				$("#comment_list").append(new_li);
			} */
		</script>
	
	
	
	</head>
	<body>
		
		<!-- 타이틀 -->
		<div class="b-header b-header_centered_yes">
			<div class="b-header__inner">
				<h1 class="headline">${introDetail.intro_title}</h1>
				<p class="deck text-size_xl">${introDetail.intro_subtitle}</p>
			</div>
		</div>
		 
		 
		<div class="i-nav-local is-hidden"></div>
		<nav class="b-nav-local in-nav-local js-nav-local">
			<div class="b-nav-local__inner">
				<ul class="b-menu b-menu_horiz_yes b-menu_stroke_yes b-menu_align_center">
					<li class="b-menu__item">
						<a href="/establish/contentDetail.do?intro_index=${introDetail.intro_index}" data-ps="true" class="b-menu__item__link">
							<span>프로젝트 소개</span>
						</a>
					</li>
					
	
					<li class="b-menu__item" >
						<!-- <a href="/" data-ps="true" class="b-menu__item__link is-selected"> -->
						<div class="b-menu__item__link is-selected">
							<span>댓글<!--  ( <span class="js-channelCounter">0</span> ) --></span>
						<!-- </a> -->
						</div>
					</li>
				</ul>
			</div>
		</nav>
		
		
				
		<div class="b-content b-content--clean">
			<div class="container">
			     
				<div class="b-main" id="project_show_section_js"> 
					
					<div id="replyContainer">
						<h1></h1>
						<div id="comment_write">
							<form id="comment_form">
								<div>
									<label for="re_content">프로젝트 기획자들을 응원해 주세요.</label>
									<textarea name="re_content" id="re_content" placeholder="후원자만 댓글 등록이 가능합니다."></textarea>
									<div id="blank_reply"></div>
									<input type="button" id="replyInsertBtn" value="등록" />
									
									<input type="hidden" id="re_name" name="re_name" value="${us_name}" />
									<input type="hidden" id="re_password" name="re_password" value="1234" />
									<input type="hidden" id="re_date" name="re_date" />
									<input type="hidden" id="intro_index" name="intro_index" value="${introDetail.intro_index}" />
								</div>
							</form>
						</div>
						
						<div>
							<c:choose>
								<c:when test="${not empty replyDetail}">
									<c:forEach var="reply" items="${replyDetail}" varStatus="status">
										<!-- 데이터 출력 -->
										<table summary="댓글 리스트">
											<colgroup>
												<col width="20%" />
												<col width="80%" />
											</colgroup>
									
												<tr class="tac" data-num="${reply.intro_index}" data-index="${reply.re_index}">
													<th>${reply.re_name} 님</th>
													<td>${reply.re_date}</td>
												</tr>
												<tr>
													<td colspan="2">
														${reply.re_content}
													</td>
												</tr>
										</table>
							
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
							
						<div id="comment_list">
							<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
						</div>
					</div>

				</div>
				 
				 
				 
				 
				<!-- 기획자 정보 -->
				<div class="b-sidebar" role="complementary" >
				   
					<dl class="b-campaign_stats"> 
						<dt class="b-campaign_stats__title">목표 <span class="donationSpan">${donationDetail.dona_purpose}만원</span> 중 <span class="donationSpan">${donationDetail.dona_report}%</span> 모임</dt> 
						<dd class="b-campaign_stats__value"> 
							<span class="b-campaign_stats__value-figure">${donationDetail.dona_fund}</span><span class="b-campaign_stats__value-unit">원</span>
						</dd> 
						
						
						<dt class="b-campaign_stats__title">남은 시간</dt>
						<dd class="b-campaign_stats__value">
							<span class="b-campaign_stats__value-figure">${donationDetail.dona_dday}</span><span class="b-campaign_stats__value-unit">일</span>
						</dd>
						
						
						<dt class="b-campaign_stats__title">후원자</dt>
						<dd class="b-campaign_stats__value">
							<span class="b-campaign_stats__value-figure">${donationDetail.dona_count}</span><span class="b-campaign_stats__value-unit">명</span>
						</dd>
					</dl>
					
					<br /><br />
					
					<!-- 프로젝트 밀어주기 버튼 생성 -->
					<c:choose>
						<c:when test="${introDetail.start_check < 0}">
							<a href="#" class="c-pledge_button js-show-pledge-button" onclick="return false;"><span class="c-pledge_button__label pSize">프로젝트 기간이 아닙니다.</span><span class="c-pledge_button__help">시작일 : ${introDetail.intro_startDate}</span></a>
						</c:when>
						<c:when test="${introDetail.end_check < 0}">
							<a href="#" class="c-pledge_button js-show-pledge-button" onclick="return false;"><span class="c-pledge_button__label pSize">종료된 프로젝트입니다.</span><span class="c-pledge_button__help">마감일 : ${introDetail.intro_endDate}</span></a>
						</c:when>
						<c:otherwise>
							<a href="/intro/reward.do?intro_index=${introDetail.intro_index}" class="c-pledge_button js-show-pledge-button"><span class="c-pledge_button__label">프로젝트 밀어주기</span><span class="c-pledge_button__help"> 최소금액은 1,000원입니다.</span></a>
						</c:otherwise>
					</c:choose>
					<p class="b-pledge_blurb js-pledge_blurb">결제는 ${donationDetail.dona_endDate} 자정까지 최소 ${donationDetail.dona_purpose}만원이 모여야만 다함께 진행됩니다</p>
					
					
					<div data-scroll='sticky' data-top-offset='13' data-bottom-offset='39'  data-remote-body='.b-sidebar' >
						<div class="b-panel box" data-ui-component="profile-card">
							<div class="b-panel__head"></div>
							<div class="b-panel__body has-no-pad">
								<ul class="b-profile_card">
									<h5 class="b-profile_card__title">프로젝트 크리에이터</h5>
									<div class="b-profile_card__identity">
										<div class="b-avatar lfloat" style="width: 62px">
											<div class="b-avatar__frame b-avatar__frame--bordered" style="width:62px; height:62px">
												<img id="planFileImage" alt="기획자 이미지">
											</div>
										</div>
										
										<div class="b-profile_card__name_area">
											<div class="b-profile_card__name_area__middle">
												<div class="b-profile_card__name_area__inner">
													<span class="[ yoke yoke--theme_creator ]">${plannerDetail.plan_name}</span>
													<p class="b-profile_card__location"><i class="b-fontello b-fontello--location "></i> ${plannerDetail.plan_area}</p>
												</div>
											</div>
										</div>
					
									</div> 
				
									<div class="u-clear"></div> 
									
									<li class="b-profile_card__contacts">
										<a href="/board/${introDetail.intro_project}/list.do" class="b-profile_card__contact_button js-newMessage">문의하기</a>
									</li>
									
									<div class="u-clear"></div>
								</ul><!-- b-profile_card --> 
							</div>
						</div> 
						
						
						<ul class="i-presents">
							<li class="[ b-panel b-panel--theme_board b-panel--rounded_yes ] ui-present-card box b-panel--selectable_yes" data-selectable="true"> 
								<div class="b-panel__head">
									<h3 class="b-panel__title">프로젝트 후원자분들께</h3>
								</div><!--.b-panel__head-->
								
								<div class="b-panel__body">
									<p class="ui-present-card__description">
									${introDetail.intro_effect}
									</p>
								</div><!--.b-panel__body-->
							</li><!--.b-panel-->
						</ul>
					
					</div>
				</div><!--b-sidebar-->
				 
				 
			</div>
		</div>
		
		
	</body>
</html>
