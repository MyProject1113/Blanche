<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 - FAQ</title>

<style type="text/css">


#faqitems {
	width : 850px;
	margin : 0px;
}


#sidemenu{
	float : right;
	width : 300px;
	padding : 40px;
	
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
    width:1250px;
}

#content {
	float : left;
}


#faq_item_1{
	width : 330px;
	height : 230px;
	float: left;
	margin : 20px;
	padding : 30px;
	border : 3px;
	border-style: dashed;
}

#faq_item_2{
	width : 330px;
	height : 230px;
	float : left;
	margin : 20px;
	padding : 30px;
	border : 3px;
	border-style: dashed;
}

#faq_item_3{
	width : 330px;
	height : 230px;
	float: left;
	margin : 20px;
	padding : 30px;
	border : 3px;
	border-style: dashed;
}

#faq_item_4{
	width : 330px;
	height : 230px;
	float: left;
	margin : 20px;
	padding : 30px;
	border : 3px;
	border-style: dashed;
}

div#wrapper {
    width: 1300px;
}

#section {
	width : auto;
	height : auto;
}

input.field.field__search.js-input {
    float: left;
}



input.field.field__search.js-input {
    width: 650px;
    margin : 0px;
}

#faqh1{
	margin : 20px;
    clear: left;
}



form.search {
    margin-bottom: 50px;
    margin-left: 20px;
}

#endhr{
	margin-bottom : 30px;
}

div#content {
    margin-bottom: 50px;
}

div#main {
    background-color: white;
    padding: 60px;
    width: 1300px;
    border: 3px;
    border-style: double;
}

#faqtitle {
	font-size: 25px;
}

div#content {
    padding: 10px;
}
</style>

<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#fq_index").val(0);
	
	$(".goCategory").click(function() {
		$("#method").val("category");
		$("#keyword").val($(this).attr("data-category"));
		$("#formFaq").attr({
			"method" : "post",
			"action" : "/faq/list.do"
		});
		$("#formFaq").submit();
	});
	
	$(".goDetail").click(function() {
		$("#fq_index").val($(this).attr("data-index"));
		$("#formFaq").attr({
			"method" : "post",
			"action" : "/faq/detail.do"
		});
		$("#formFaq").submit();
	});
});
</script>

</head>
<body>

<div id="container">
<form name="formFaq" id="formFaq">
	<input type="hidden" name="method" id="method">
	<input type="hidden" name="keyword" id="keyword">
	<input type="hidden" name="fq_index" id="fq_index">
</form>
	
	
<!-- 	
<section> -->

<div  style="overflow:auto;" id="content">	
	<header class="header" >
    	<div class="header_inner" id="faqtitle">
        	고객센터
            <nav class="menu-main">
    			<ul class="menu-main_list js-main-menu"></ul>
			</nav>
		</div>
	</header>
	
	
	
	
	
	
	
	
		<!-- 문단 분할을 위한 가로줄 -->
				<hr class="hr hr__main">
				
				
				
				
				<!-- --------------------------------------------------- 검색 구획 시작 ----------------------------------------------------------- -->
				<!-- 
					<form action="/support/kb/search" class="search">
						
						<div>
							
							<input autocomplete="off" class="field field__search js-input" maxlength="100" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;검색" type="text">
							<button id="faqsearch" class="button-main button-main__search js-button-submit">찾기</button>
							<span class="search_cancel js-button-reset" data-active-class="search_hint__active"></span>
						</div>
					
					</form>
				 -->
				<!-- --------------------------------------------------- 검색 구획 종료 ----------------------------------------------------------- -->
				
				
				
				
				<!-- -------------------------------------------------------- FAQ 시작 ---------------------------------------------------------------- -->
				
				<div data-region="kb-faq" id="faqitems">
					<br>
					
						
						
							<!-- ---------------------------------------------- 컨텐츠 섹션 아이템 시작 --------------------------------------------------  -->
							
							<div id="faq_item_1">
									<h2 class="knowledgebase-faq_title">
										<span class="goCategory" data-category="기획">기획에 관한 질문</span>
									</h2>
									<ul class="list-main">
										<c:if test="${not empty faqList1}">
											<c:forEach var="faqData" items="${faqList1}">
												<li class="list-main_item">
													<span class="goDetail" data-index="${faqData.fq_index}">${faqData.fq_title}</span>
												</li>
											</c:forEach>
										</c:if>
									</ul>
							</div>
							
							<div id="faq_item_2">
									<h2 class="knowledgebase-faq_title">
										<span class="goCategory" data-category="투자">투자에 관한 질문</span>
									</h2>
									<ul class="list-main">
										<c:if test="${not empty faqList2}">
											<c:forEach var="faqData" items="${faqList2}">
												<li class="list-main_item">
													<span class="goDetail" data-index="${faqData.fq_index}">${faqData.fq_title}</span>
												</li>
											</c:forEach>
										</c:if>
									</ul>
							</div>
							
							<div id="faq_item_3">
									<h2 class="knowledgebase-faq_title">
										<span class="goCategory" data-category="운영">운영에 관한 질문</span>
									</h2>
									<ul class="list-main">
										<c:if test="${not empty faqList3}">
											<c:forEach var="faqData" items="${faqList3}">
												<li class="list-main_item">
													<span class="goDetail" data-index="${faqData.fq_index}">${faqData.fq_title}</span>
												</li>
											</c:forEach>
										</c:if>
									</ul>
							</div>
							
							<div id="faq_item_4">
									<h2 class="knowledgebase-faq_title">
										<span class="goCategory" data-category="그외">그외에 관한 질문</span>
									</h2>
									<ul class="list-main">
										<c:if test="${not empty faqList4}">
											<c:forEach var="faqData" items="${faqList4}">
												<li class="list-main_item">
													<span class="goDetail" data-index="${faqData.fq_index}">${faqData.fq_title}</span>
												</li>
											</c:forEach>
										</c:if>
									</ul>
							</div>
								
							
							<!-- ---------------------------------------------- 컨텐츠 섹션 아이템 종료 --------------------------------------------------  -->
			
					
					</div>
				
				
				<!-- -------------------------------------------------------- FAQ 종료 ---------------------------------------------------------------- -->
				
				
				</div>
				
				<!-- ----------------------------------------------------- 우측 사이드 메뉴 시작 ------------------------------------------------------------ -->
			
			<!-- <aside id="sidemenu">
					<div data-region="news.widget.announcements">
						<div class="widget">
							<h2 class="heading-2 heading-2__widget">
								<span class="widget_icon widget_icon__news"></span>
									고객센터 참고 사항
							</h2>
							
							사이드 메뉴 주항목의 하위메뉴 리스트 시작
							<br/>
							<ul class="js-list">
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										기획하러 가기
									</a>
								</li>
								
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										투자하러 가기
									</a>
								</li>
								
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										질문과 답변 게시판
									</a>
								</li>
								
								<li class="news">
									<a class="link-second js-item-link" href="/support/news/87">
										결제 관련 해결 방법 안내
									</a>
								</li>
							</ul>
							
							사이드 메뉴 주항목의 하위메뉴 리스트 종료
							
							<a class="link-action js-all-link" href="/board/qna/list.do">
								직접 질문하기 [ Q&A ]
							</a>
						</div>
					</div>
			</aside>
			
	</section>
			 -->
				<!-- ----------------------------------------------------- 우측 사이드 메뉴 종료 ------------------------------------------------------------ -->
</div>

	
		

</body>
</html>