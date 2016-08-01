<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			var replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요.", r_pwdConfirm = 0, btnkind = "";
			$(function() {
				/* 기본 덧글 목록 불러오기 */
				var b_num = "<c:out value='${detail.b_num}' />";
				listAll(b_num);
				
				/* 덧글 내용 저장 이벤트 */
				$("#replyInsert").click(function() {
					if (!chkSubmit($("#r_name"), "이름을")) return;
					else if (!chkSubmit($("#r_pwd"), "비밀번호를")) return;
					else if (!chkSubmit($("#r_content"), "작성할 내용을")) return;
					else {
						var insertUrl = "/replies/replyInsert.do";
						/** 글 저장을 위한 Post 방식의 Ajax 연동 처리 **/
						$.ajax({
							url : insertUrl,	// 전송 url
							type : "post",	// 전송 시 method 방식
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType : "text",
							data : JSON.stringify({
								b_num : b_num,
								r_name : $("#r_name").val(),
								r_pwd : $("#r_pwd").val(),
								r_content : $("#r_content").val()
							}),
							error : function() {	// 실행시 오류가 발생하였을 경우
								alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
							},
							success : function(resultData) {
								if (resultData == "SUCCESS") {
									alert("댓글 등록이 완료되었습니다.");
									dataReset();
									listAll(b_num);
								}
							}
						});
					}
				});
				
				/** 수정버튼 클릭시 수정폼 출럭 **/
				$(document).on("click", ".update_form", function() {
					$(".reset_btn").click();
					var conText = $(this).parents("li").children().eq(1).html();
					console.log("conText : " + conText);
					$(this).parents("li").find("input[type='button']").hide();
					$(this).parents("li").children().eq(0).html();
					var conArea = $(this).parents("li").children().eq(1);
					
					conArea.html("");
					var data = "<textarea name='content' id='content'>" + conText + "</textarea>";
					data += "<input type='button' class='update_btn' value='수정완료' />";
					data += "<input type='button' class='reset_btn' value='수정취소' />";
					conArea.html(data);
				});
				
				/** 초기화 버튼 **/
				$(document).on("click", ".reset_btn", function() {
					var conText = $(this).parents("li").find("textarea").html();
					$(this).parents("li").find("input[type='button']").show();
					var conArea = $(this).parents("li").children().eq(1);
					conArea.html(conText);
				});
				
				/** 글 수정을 위한 Ajax 연동 처리 **/
				$(document).on("click", ".update_btn", function() {
					var r_num = $(this).parents("li").attr("data-num");
					var r_content = $("#content").val();
					if (!chkSubmit($("#content"), "댓글 내용을")) return;
					else {
						$.ajax({
							url : '/replies/' + r_num + ".do",	// 전송 url
							type : "put",	// 전송 시 method 방식
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "PUT"
							},
							data : JSON.stringify({
								r_content : r_content
							}),
							dataType : "text",
							success : function(result) {
								if (result == "SUCCESS") {
									alert("수정되었습니다.");
									listAll(b_num);
								}
							}
						});
					}
				});
				
				/** 글 삭제를 위한 Ajax 연동 처리 **/
				$(document).on("click", ".delete_btn", function() {
					var r_num = $(this).parents("li").attr("data-num");
					console.log("r_num : " + r_num);
					
					if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
						$.ajax({
							url : '/replies/' + r_num + ".do",	// 전송 url
							type : "delete",	// 전송 시 method 방식
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "DELETE"
							},
							dataType : "text",
							success : function(result) {
								console.log("result : " + result);
								if (result == "SUCCESS") {
									alert("삭제되었습니다.");
									listAll(b_num);
								}
							}
						});
					}
				});
			});
			
			// 리스트 요청 함수
			function listAll(b_num) {
				$("#comment_list").html("");
				var url = "/replies/all/" + b_num + ".do";
				$.getJSON(url, function(data) {
					console.log(data.length);
					
					$(data).each(function() {
						var r_num = this.r_num;
						var r_name = this.r_name;
						var r_content = this.r_content;
						var r_date = this.r_date;
						addNewItem(r_num, r_name, r_content, r_date);
					});
				}).fail(function() {
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});
			}

			/** 새로운 글을 화면에 추가하기 위한 함수 **/
			function addNewItem(r_num, r_name, r_content, r_date) {
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
			}
			
			function dataReset() {
				$("#r_name").val("");
				$("#r_pwd").val("");
				$("#r_content").val("");
			}
		</script>
	
	
	
	</head>
	<body>
		
		<div class="b-header b-header_centered_yes">
			<div class="b-header__inner">
				<h1 class="headline">단편영화 &lt;헝클어진 숲&gt;</h1>
				<p class="deck text-size_xl">오월의 단편영화 프로젝트</p>
			</div>
		</div>
		 
		 
		<div class="i-nav-local is-hidden"></div>
		<nav class="b-nav-local in-nav-local js-nav-local">
			<div class="b-nav-local__inner">
				<ul class="b-menu b-menu_horiz_yes b-menu_stroke_yes b-menu_align_center">
					<li class="b-menu__item">
						<a href="/establish/contentDetail.do" data-ps="true" class="b-menu__item__link">
							<span>프로젝트 소개</span>
						</a>
					</li>
					
	
					<li class="b-menu__item" >
						<!-- <a href="/" data-ps="true" class="b-menu__item__link is-selected"> -->
						<div class="b-menu__item__link is-selected">
							<span>댓글 ( <span class="js-channelCounter">54</span> )</span>
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
									<label for="r_content">총 10개의 댓글이 있습니다.</label>
									<textarea name="r_content" id="r_content"></textarea>
									<div id="blank_reply"></div>
									<input type="button" id="replyInsert" value="등록" />
								</div>
							</form>
						</div>
						<ul id="comment_list">
							<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
						</ul>
					</div>

				</div>
				 
				 
				 
				 
				<div class="b-sidebar" role="complementary" >
				   
					<dl class="b-campaign_stats"> 
						<dt class="b-campaign_stats__title">목표 4,000,000원 중 2% 모임</dt> 
						<dd class="b-campaign_stats__value"> 
							<span class="b-campaign_stats__value-figure">81,000</span><span class="b-campaign_stats__value-unit">원</span>
						</dd> 
						
						
						<dt class="b-campaign_stats__title">남은 시간</dt>
						<dd class="b-campaign_stats__value">
							<span class="b-campaign_stats__value-figure">21</span><span class="b-campaign_stats__value-unit">일</span>
						</dd>
						
						
						<dt class="b-campaign_stats__title">후원자</dt>
						<dd class="b-campaign_stats__value">
							<span class="b-campaign_stats__value-figure">5</span><span class="b-campaign_stats__value-unit">명</span>
						</dd>
					</dl>
					
					  
					<a href="/tanglewoodfilm/pledge" class="c-pledge_button js-show-pledge-button"><span class="c-pledge_button__label">프로젝트 밀어주기</span><span class="c-pledge_button__help"> 최소금액은 1,000원입니다.</span></a>
					
					<p class="b-pledge_blurb js-pledge_blurb">결제는 2016년 8월 14일 자정까지 최소 4,000,000원이 모여야만 다함께 진행됩니다</p>
					
					
					<div data-scroll='sticky' data-top-offset='13' data-bottom-offset='39'  data-remote-body='.b-sidebar' >
						<div class="b-panel box" data-ui-component="profile-card">
							<div class="b-panel__head"></div>
							<div class="b-panel__body has-no-pad">
								<ul class="b-profile_card">
									<h5 class="b-profile_card__title">프로젝트 크리에이터</h5>
									<div class="b-profile_card__identity">
										<div class="b-avatar lfloat" style="width: 62px">
											<div class="b-avatar__frame b-avatar__frame--bordered" style="width:62px; height:62px">
												<img alt="B64be9e0b3922aeabf47bfac38e9baf892e7b064.jpg?ixlib=rb-1.1.0&amp;w=100&amp;h=125&amp;auto=format%2ccompress&amp;fit=facearea&amp;facepad=2" class="b-avatar__pic" src="https://tumblbug-upi.imgix.net/b64be9e0b3922aeabf47bfac38e9baf892e7b064.jpg?ixlib=rb-1.1.0&amp;w=100&amp;h=125&amp;auto=format%2Ccompress&amp;fit=facearea&amp;facepad=2.0&amp;ch=Save-Data&amp;mask=ellipse&amp;s=a1c17f2d47ad41cefeb8aec75cfa695a" />
											</div>
										</div>
										
										<div class="b-profile_card__name_area">
											<div class="b-profile_card__name_area__middle">
												<div class="b-profile_card__name_area__inner">
													<span class="[ yoke yoke--theme_creator ]">오월</span>
													<p class="b-profile_card__location"><i class="b-fontello b-fontello--location "></i> 제주</p>
												</div>
											</div>
										</div>
					
									</div> 
				
									<div class="u-clear"></div> 
									
									<li class="b-profile_card__contacts">
										<a href="/help_requests/new?page_url=https%3A%2F%2Fwww.tumblbug.com%2Ftanglewoodfilm&amp;project=3320" class="b-profile_card__contact_button js-newMessage">문의하기</a>
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
									저희 영화를 후원해주셔서 감사합니다!! 앤딩크래딧에 Special Thanks To 로 기재해드리며, 감사한 마음을 담아 영화 포스터와 함께
									영화 스틸 컷, 그리고 아름다운 제주풍경이 담긴 엽서 세트를 드립니다!! 다시 한번 감사드립니다:)
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
