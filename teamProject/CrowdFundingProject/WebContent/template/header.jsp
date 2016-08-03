<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	#lastAccess {
		font-size: 0.8em;
	} 
</style>
<script type="text/javascript">
	$(function(){
		$("#accessList").click(function(){
			location.href="/user/record.do";
		});
	});
</script>
<!-- Header -->
	<header id="header">
		<h1><a href="/index.jsp">(주)너와 나의 연결고리</a></h1>
		<nav class="links">
			<ul>
				<li><a href="/intro/intro.do" class="current-page-item">프로젝트 둘러보기</a></li>
				<!-- <li><a href="/establish/notice.do">프로젝트 올리기</a></li> -->
				<li><a href="/establish/userProgressCheck.do">프로젝트 올리기</a></li>
				<li><a href="/cc/faq.do">고객센터</a></li>
				<li><a href="/board/freeboard/list.do">게시판</a>		<!-- 임시로 변경한 메뉴 -->
					<ul>
						<li><a href="/board/freeboard/list.do">자유게시판</a></li>		<!-- 임시로 추가한 메뉴 -->
						<li><a href="/faq/list.do">FAQ게시판</a></li>		<!-- 임시로 추가한 메뉴 -->
						<li><a href="#">Sliders</a></li>
						<li><a href="#">Galleries</a></li>
						<li><a href="#">Apps</a></li>
						<li><a href="#">Extensions</a></li>
					</ul>
				</li>
				<!-- <li><a href="#">로그인</a></li> -->
			</ul>
			
			


		</nav>
		<nav class="main">
			<ul>
				<li class="search">
					<a class="fa-search" href="#search">Search</a>
					<form id="frmSearch" method="get" action="#"> <!-- 게시판 검색 기능과 ID 겹침 -->
						<input type="text" name="query" placeholder="Search" />
					</form>
				</li>
				<li class="menu">
					<a class="fa-bars" href="#menu">Menu</a>
				</li>
			</ul>
		</nav>
	</header>

<!-- Menu -->
	<section id="menu">

		<!-- Search -->
			<!-- <section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section> -->

		<!-- Links -->
			<section>
				<ul class="links">
					<li>
						<a href="#">
							<h3>영화 / 공연</h3>
							<p>Movie & Performance</p>
						</a>
					</li>
					<li>
						<a href="#">
							<h3>음악</h3>
							<p>Music</p>
						</a>
					</li>
					<li>
						<a href="#">
							<h3>디자인</h3>
							<p>Design</p>
						</a>
					</li>
					<li>
						<a href="#">
							<h3>출판</h3>
							<p>Publication</p>
						</a>
					</li>
					<li>
						<a href="#">
							<h3>요리</h3>
							<p>Cooking</p>
						</a>
					</li>
				</ul>
			</section>

		<!-- Actions -->
			<section>
				<c:choose>
					<c:when test="${empty sessionScope.blancheUser}">
						<ul class="actions vertical">
							<li><a href="/user/login.do" class="button big fit">Log In</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<form name="formLogout" id="formLogout">
							<ul class="actions vertical">
								<li>[${sessionScope.blancheUser.us_nickname}] 님 환영합니다.</li>
								<%-- <li>회원등급 : ${sessionScope.blancheUser.us_rank}</li> --%>	<!--임시로 추가한 등급 확인용 텍스트 -->
								<li>
									<c:choose>
										<c:when test="${sessionScope.blancheUser.us_rank == '0'}">
											<a href="/usermanage/pwchange.do" class="button big fit">My Page</a><br />
											<a href="/mywrite/list.do" class="button big fit">My Writing</a>
										</c:when>
										<c:when test="${sessionScope.blancheUser.us_rank == '3'}">
											<a href="/establish/applicationAdminList.do" class="button big fit">프로젝트 관리</a><br />
											<a href="/manage/list.do" class="button big fit">게시판 관리</a>
										</c:when>
									</c:choose>
								</li>
								<li><a href="/user/exit.do" class="button big fit">Log Out</a></li>
								<c:if test="${not empty sessionScope.blancheUser.accessIP}">
									<li id="lastAccess">
										<span>최근접속 : ${sessionScope.blancheUser.accessIP} (${sessionScope.blancheUser.accessDate})</span><br />
										<span id="accessList">[최근 접속 기록 자세히 보기]</span>
									</li>
								</c:if>
							</ul>
						</form>
					</c:otherwise>
				</c:choose>
			</section>

	</section>