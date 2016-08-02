<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
	<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".col-md-4 portfolio-item").click(function() {
				var b_num = $(this).parents("tr").attr("data-num");
				$("#b_num").val(b_num);
				console.log("글번호 : " + b_num);
				// 상세 페이지로 이동하기 위해 form 추가
				// (id : detailForm)
				$("#detailForm").attr({
					"method":"get",
					"action":"/board/boardDetail.do"
				});
				$("#detailForm").submit();
			});
			$("#title").click(function() {
				$("#app_field").attr({
					"method" : "get",
					"action" : "/establish/contentDetail.do"
				})
				$("#app_field").submit();	
			});
		});
	</script>
	
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">
    
	<!-- jQuery -->
    <script src="/include/js/jquery-1.12.2.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/include/js/bootstrap.min.js"></script>

	<style type="text/css">
	.category {
		width: 200px;
		heigth: 120px;
		float: center;
		margin: 5px 5px;
	}
	
	.row {
		width: 400px;
		heigth: 900px;
		float: left;
		margin: 10px 10px;
	}
	#project {
		width: 200px;
		heigth: 120px;
		float: center;
		margin: 5px 5px;
	}
	#array {
		width: 200px;
		heigth: 120px;
		float: center;
		margin: 5px 5px;
	}
	#pj_text {
		float: right;
		vertical-align: middle;
	}
	
	</style>
   </head>
   <body>
   <table>
   <colgroup>
   		<col width="15%">
   		<col width="85%">
   </colgroup>   
   	<thead class="category">
  <form id="ca_array" name="ca_array" method="post">
   			<tr>
				<td>
					<select id="app_field" name="app_field">
							<option value="all">전체</option>
							<option value="movie">영화</option>
							<option value="music">음악</option>
							<option value="design">디자인</option>
							<option value="art">미술</option>
							<option value="ani">만화</option>
					</select>
				</td>
				<td>
				<select id="array" name="array">
					<option value="">최신순</option>
					<option value="">이름순</option>
				</select>
				</td>
			</tr>
	</thead>
	<tbody>	
		<tr>
		<td colspan="2">
		<c:forEach var="intro" items="${introList}" varStatus="status">
		<input type="hidden" id="intro_index" name="intro_index" value="${intro.intro_index}" />
        <div class="row">
            <div class="col-md-4 portfolio-item">
                    <img class="img-responsive" src= "${intro.intro_image}" alt="프로젝트 이미지">
                <h3>
                    <%-- <a href="/intro/introDetail.do" id="title">${intro.intro_title}</a> --%>
                    <a href="/intro/introDetail.do?intro_index=${intro.intro_index}" id="title">${intro.intro_title}</a>
                </h3>
                <table id="pj_text">
					<tr>
						<td>
							<h4>목표 금액</h4>
						</td>
						<td>
							<h4>${intro.app_fund} 원</h4>
						</td>
					</tr>
					<tr>
						<td>
						    <h4>현재까지 모집된 금액</h4>
						</td>
						<td>
							<h4>${intro.sponser_invest} 원</h4>
						</td>
					</tr>                     
                </table>
                <textarea readonly="readonly">${intro.intro_details}</textarea>
            </div>
        </div>
        </c:forEach>
        </td>
        </tr>
       </tbody>
       </form>
      </table>
 </body>
 </html>