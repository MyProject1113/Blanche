<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>프로젝트 올리기 공지</title>
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

		<script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#app_btn').click(function(e) {
					if($("input[name='agree']:checked").val() == "Y") {
						//location.href="/establish/applicationForm.do";
						//location.href="/establish/applicationDetailForm.do";
						location.href="/establish/contentDetail.do";
					} else {
						alert("위 내용을 모두 읽고 이해하셨으면 체크해주세요");
						return;
					}
				});
			}); //end ready()
		</script>

	</head>
	<body>
	
	<!-- contents 시작-->
	<div id="wrap">
		<!-- 프로젝트 신청 시작 -->
		<div class="prjOFA">
			<!-- 프로젝트 신청하기-->
			<div class="innerAct">
				<div class="join_bg">
					<div class="join">
						<h2>프로젝트 올리기</h2>
						<p><em>안녕하세요! Blanche에서 프로젝트를 신청하기 전<br/>
							아래를 읽어주시고 프로젝트 개설을 신청해주세요!</em></p>
						<p>Blanche는 더불어 사는 사회를 지향하고 사회를 아름답게 바꾸는 프로젝트를 소개합니다.</p>
						<p>
							개인이나 단체, 기업 등 프로젝트 신청 자격을 한정하지 않습니다.<br/>
							단, 프로젝트의 내용이 개인의 취미생활을 위해 또는 어떤 사업에나  사용할 수 있는 자금마련이<br/>
							아니라 사회를 바꾸고 변화시키는데 기여하고 그래서 보다 많은 분들에게<br/>
							공감을 일으킬 수 있는 프로젝트이기를 희망합니다.
						</p>
						<p>내용이 완성되지 않아도, 프로젝트에 대한 추진 의지와 실행력이 있다면 신청하세요.</p>
						<p>Blanche의 프로젝트매니저가 상담하고 방문하여 함께 프로젝트를 다듬어드리고<br/>
						   펀딩이 성공할 수 있도록 도와드리겠습니다. </p>
						
						<p style="padding-top: 15px"><input type="checkbox" class="chk" name="agree" value="Y" />&nbsp;<span style='display:inline-block; margin-top:-1px'>위의 내용을 읽었습니다.</span></p>
						<button type="button" id="app_btn" style="margin-top:15px;">프로젝트 신청하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 프로젝트 신청 끝 -->
	</div>
	<!-- contents 끝-->

	</body>
</html>
