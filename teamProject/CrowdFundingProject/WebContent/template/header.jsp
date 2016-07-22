<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- Header -->
	<header id="header">
		<h1><a href="/CrowdFundingProject/index.jsp">(주)너와 나의 연결고리</a></h1>
		<nav class="links">
			<ul>
				<li><a href="#" class="current-page-item">프로젝트 둘러보기</a></li>
				<li><a href="/board/boardList.do">프로젝트 올리기</a></li>
				<li><a href="#">고객지원</a></li>
				<li><a href="#">도움말</a></li>
				<!-- <li><a href="#">로그인</a></li> -->
			</ul>
		</nav>
		<nav class="main">
			<ul>
				<li class="search">
					<a class="fa-search" href="#search">Search</a>
					<form id="search" method="get" action="#">
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
							<h3>지구촌 나눔</h3>
							<p>Global sharing</p>
						</a>
					</li>
					<li>
						<a href="#">
							<h3>영화 / 공연</h3>
							<p>Movie & Performance</p>
						</a>
					</li>
				</ul>
			</section>

		<!-- Actions -->
			<section>
				<ul class="actions vertical">
					<li><a href="#" class="button big fit">Log In</a></li>
				</ul>
			</section>

	</section>