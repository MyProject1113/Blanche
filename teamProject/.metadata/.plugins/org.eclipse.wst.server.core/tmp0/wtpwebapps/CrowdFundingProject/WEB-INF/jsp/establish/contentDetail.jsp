<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		<script type="text/javascript" src="/include/js/common.js"></script>
		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				
			});
		</script>
		
	</head>
	<body>
		
		<form class="project_intro_index" id="project_intro_index">
			<input type="hidden" id="intro_index" name="intro_index" value="${introDetail.intro_index}" />
		</form>
				
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
						<a href="/establish/contentReply.do" data-ps="true" class="b-menu__item__link">
							<span>댓글 ( <span class="js-channelCounter">0</span> )</span>
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
						<img class="b-video__poster js-video-poster" src="https://tumblbug-pci.imgix.net/eb663c81ddd2d3fd2824f755e800244404371d1a/ba66876acd8823742bb2b717b5d7a00a5bc39a79/a27a928b0684738485a9fa6a22cec8fb95ca922b/3ae144dbfb85dc4e499bdd329e7c28adc492e371.jpg?ixlib=rb-1.1.0&amp;w=620&amp;h=465&amp;auto=format%2Ccompress&amp;lossless=true&amp;fit=crop&amp;s=f5cfdad5027b866a486d8ab404e8728f" alt="">
					</figure>
				
				
					<div class="b-content-description typeset-proto-v2 js-project_desc" style="margin-top: 28px;">
					
						<div id="detail_form_01">
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
						
						<hr class="detail_form_line">
					
					</div>
					  
					<div class="b-panel b-panel--theme_clean b-panel--rounded_yes box has-pad-horiz-dot5">
						<strong class="box text-size_xs">이 프로젝트의 환불 및 교환 정책</strong>
						<span class="text-size_xs">${introDetail.intro_refund}</span>
					</div>
				</div>
				 
				 
				 
				<!-- 기획자 정보 -->
				<div class="b-sidebar" role="complementary" >
				   
					<dl class="b-campaign_stats"> 
						<dt class="b-campaign_stats__title">목표 ${donationDetail.dona_purpose} 중 ${donationDetail.dona_report}% 모임</dt> 
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
					
					  
					<a href="/intro/reward.do" class="c-pledge_button js-show-pledge-button"><span class="c-pledge_button__label">프로젝트 밀어주기</span><span class="c-pledge_button__help"> 최소금액은 1,000원입니다.</span></a>
					
					<p class="b-pledge_blurb js-pledge_blurb">결제는 ${donationDetail.dona_endDate} 자정까지 최소 ${donationDetail.dona_purpose}원이 모여야만 다함께 진행됩니다</p>
					
					
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
													<span class="[ yoke yoke--theme_creator ]">${plannerDetail.plan_name}</span>
													<p class="b-profile_card__location"><i class="b-fontello b-fontello--location "></i> ${plannerDetail.plan_area}</p>
												</div>
											</div>
										</div>
					
									</div> 
				
									<div class="u-clear"></div> 
									
									<li class="b-profile_card__contacts">
										<a href="/${introDetail.intro_project}/list.do" class="b-profile_card__contact_button js-newMessage">문의하기</a>
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
