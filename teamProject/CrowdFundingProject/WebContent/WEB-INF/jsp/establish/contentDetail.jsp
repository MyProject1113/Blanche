<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>프로젝트 상세보기</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" href="/include/css/contentDetail2.css" />
		
		<style type="text/css">
			span.pSize {
			    font-size: 1em;
			}
			h1.headline {
			    font-size: 2.5em;
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
		</style>
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {

				/* 첨부파일 이미지 보여주기 위한 속성 추가 */
				var file = "<c:out value='${introDetail.intro_image}' />";
				if (file != "") {
					$("#introFileImage").attr({
						src:"/uploadStorage/${introDetail.intro_image}",
						width:"620px",
						height:"465px"
					});
					
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
				}
				
				/* $(".pStart").prop("disabled", true); */
			});
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
		 
		<!-- 탭 메뉴 -->
		<div class="i-nav-local is-hidden"></div>
		<nav class="b-nav-local in-nav-local js-nav-local">
			<div class="b-nav-local__inner">
				<ul class="b-menu b-menu_horiz_yes b-menu_stroke_yes b-menu_align_center">
					<li class="b-menu__item">
						<!-- <a href="/" data-ps="true" class="b-menu__item__link is-selected"> -->
						<div class="b-menu__item__link is-selected">
							<span>프로젝트 소개</span>
						<!-- </a> -->
						</div>
					</li>
					
					<li class="b-menu__item" >
						<a href="/establish/contentReply.do?intro_index=${introDetail.intro_index}" data-ps="true" class="b-menu__item__link">
							<span>댓글<!--  ( <span class="js-channelCounter">0</span> ) --></span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		
		
		<!-- 본문 -->
		<div class="b-content b-content--clean">
			<div class="container">
			    <!-- 프로젝트 이미지 -->
				<div class="b-main" id="project_show_section_js"> 
					<figure class="b-video js-video">
						<img id="introFileImage" alt="프로젝트 이미지">
					</figure>
				
					<div class="b-content-description typeset-proto-v2 js-project_desc" style="margin-top: 28px;">
					
						<br />
						<hr class="detail_form_line">
				
						<div id="detail_form_01">
							<p><span>${introDetail.intro_details}</span></p>
						</div>
						
						
						<%-- <div id="detail_form_01">
							<hr class="detail_form_line">
							
							<h3>▶ 프로젝트 소개</h3>
							<p><span>${introDetail.intro_details}</span></p>
						</div>
						
						
						<div id="detail_form_02">
							<hr class="detail_form_line">
							
							<h3>&lt;시놉시스&gt;</h3>
							
							<blockquote>
								<p>${introDetail.intro_synopsis}</p>
							</blockquote>
						</div>
						
						
						<div id="detail_form_01">
							<hr class="detail_form_line">
							
							<h3>▶ 프로젝트 계획</h3>
							<p><span>${introDetail.intro_plan}</span></p>
						</div>
						
						
						<div id="detail_form_01">
							<hr class="detail_form_line">
							
							<h3>▶ 프로젝트 목표</h3>
							<p><span>${introDetail.intro_purpose}</span></p>
						</div>
						
						<hr class="detail_form_line"> --%>
					
					</div>
					  
					<div class="b-panel b-panel--theme_clean b-panel--rounded_yes box has-pad-horiz-dot5">
						<strong class="box text-size_xs">이 프로젝트의 환불 및 교환 정책</strong>
						<span class="text-size_xs">${introDetail.intro_refund}</span>
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
					
					<br />
					
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
