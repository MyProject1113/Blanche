<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>



<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 - FAQ</title>

<style type="text/css">
aside#sidemenu {
    float: right;
}

section{
	float : left;
	width : 75%;
}

aside{
	float : right;
	width : 25%;
	padding : 20px;
}

#faqsearch{
	float : right;
}

button#faqsearch {
    height: 45px;
}

input.field.field__search.js-input {
    width: 650px;
    margin-right: 75px;
}

body {
    overflow-x: scroll;
    width:1100px;
}
</style>

</head>
<body>
	
<div  style="overflow:auto;">	
	<header class="header" >
    	<div class="header_inner">
        	<a class="logo" href="/support/">고객 지원</a>
            <nav class="menu-main">
    			<ul class="menu-main_list js-main-menu"></ul>
			</nav>
		</div>
	</header>
	
	
	
<div id="content">
	<section>
		<!-- 문단 분할을 위한 가로줄 -->
				<hr class="hr hr__main">
				
				<!-- 검색 구획 시작 -->
				
					<form action="/support/kb/search" class="search">
						
						<div>
							<button id="faqsearch" class="button-main button-main__search js-button-submit">찾기</button>
							<input autocomplete="off" class="field field__search js-input" maxlength="100" placeholder="검색" type="text">
							
							<!-- <span class="search_cancel js-button-reset" data-active-class="search_hint__active"></span> -->
						</div>
					
					</form>
				
				<!--  검색 구획 종료 -->
				
				
		<!-- -------------------------------------------------------- FAQ 시작 ---------------------------------------------------------------- -->
				
				<div data-region="kb-faq">
					
						<h1 class="heading-1">자주 묻는 질문</h1>
						<!-- <ul class="knowledgebase-faq js-list"> -->
						
						
							<!-- ---------------------------------------------- 컨텐츠 섹션 아이템 시작 --------------------------------------------------  -->
						
							<!-- FAQ 컨텐츠섹션 첫번째 아이템 -->
							
								<div class="knowledgebase-faq_item">
									<a class="knowledgebase-faq_link js-category-image"  href="/support/kb/categories/1" data-category-id="1">
										<img class="knowledgebase-fa_img" src="">
									</a>
									<h2 class="knowledgebase-faq_title">
										<a class="link-main link-main__title js-category-title" href="/support/kb/categories/1" data-category-id="1">월드 오브 탱크</a>
									</h2>
									<ul class="list-main">
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
									</ul>
								</div>
							
							
							
							<!-- FAQ 컨텐츠섹션 두번째 아이템 -->
							
							<div class="knowledgebase-faq_item">
									<a class="knowledgebase-faq_link js-category-image"  href="/support/kb/categories/2" data-category-id="2">
										<img class="knowledgebase-fa_img" src="">
									</a>
									<h2 class="knowledgebase-faq_title">
										<a class="link-main link-main__title js-category-title" href="/support/kb/categories/2" data-category-id="2">월드 오브 탱크</a>
									</h2>
									<ul class="list-main">
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
									</ul>
								</div>
							
							

							
							<!-- FAQ 컨텐츠섹션 세번째 아이템 -->
							
							<div class="knowledgebase-faq_item">
									<a class="knowledgebase-faq_link js-category-image"  href="/support/kb/categories/3" data-category-id="3">
										<img class="knowledgebase-fa_img" src="">
									</a>
									<h2 class="knowledgebase-faq_title">
										<a class="link-main link-main__title js-category-title" href="/support/kb/categories/3" data-category-id="3">월드 오브 탱크</a>
									</h2>
									<ul class="list-main">
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
									</ul>
								</div>
							
							
							<!-- FAQ 컨텐츠섹션 네번째 아이템 -->
							
							<div class="knowledgebase-faq_item">
									<a class="knowledgebase-faq_link js-category-image"  href="/support/kb/categories/3" data-category-id="3">
										<img class="knowledgebase-fa_img" src="">
									</a>
									<h2 class="knowledgebase-faq_title">
										<a class="link-main link-main__title js-category-title" href="/support/kb/categories/3" data-category-id="3">월드 오브 탱크</a>
									</h2>
									<ul class="list-main">
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
										<li class="list-main_item">
											<a class="link-list js-article" href="/support/kb/articles/278" data-article-id="278">
												"비매너 행위 신고 관련 자주 묻는 질문"
											</a>
										</li>
									</ul>
								</div>
								
								
							<!-- ---------------------------------------------- 컨텐츠 섹션 아이템 종료 --------------------------------------------------  -->
						
						<!-- </ul> -->
					
					</div>
				
				
				<!-- -------------------------------------------------------- FAQ 종료 ---------------------------------------------------------------- -->
				</section>
			</div>
	
	<!-- 우측 사이드 메뉴 시작 -->
			<aside>
					<div data-region="news.widget.announcements">
						<div class="widget">
							<h2 class="heading-2 heading-2__widget">
								<span class="widget_icon widget_icon__news"></span>
									"고객 지원 공지 사항을 참고해 주십시오"
								<sup class="sup">8</sup>
							</h2>
							
							<!-- 사이드 메뉴 주항목의 하위메뉴 리스트 시작 -->
							
							<ul class="js-list">
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										결제 관련 문제 직접 해결 방법 안내
									</a>
									<span class="news_category">결제 지원</span>
								</li>
								
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										결제 관련 문제 직접 해결 방법 안내
									</a>
									<span class="news_category">결제 지원</span>
								</li>
								
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										결제 관련 문제 직접 해결 방법 안내
									</a>
									<span class="news_category">결제 지원</span>
								</li>
								
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										결제 관련 문제 직접 해결 방법 안내
									</a>
									<span class="news_category">결제 지원</span>
								</li>
							</ul>
							
							<!-- 사이드 메뉴 주항목의 하위메뉴 리스트 종료 -->
							
							<a class="link-action js-all-link" href="/support/news">
								"전체 공지 보기"
							</a>
						</div>
					</div>
			</aside>
				<!-- 우측 사이드 메뉴 종료 -->

</div>

</body>
</html>