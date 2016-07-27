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
