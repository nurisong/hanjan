<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
<style>
	.sub-boxCard #basic{
		width: 364px;
		height: 400px;
		border-radius: 9px;
	}

	.sub-boxCard .sub-boxImg{
		width: 364px;
		height: 400px;
		background-size: 364px 405px;
		background-repeat: no-repeat;
	}

	.sub-content .special-iconimg{
		margin-top: 100px;
		margin-bottom: 20px;
		background-image: url(https://www.sooldamhwa.com/images/modules/subscribe/thumbs_up.png);
	}

	.sub-content .special-iconimg2{
		margin-top: 100px;
		margin-bottom: 20px;
		background-image: url(https://www.sooldamhwa.com/images/modules/subscribe/img_pick_drink.png);
	}

	 
	.special-card{
		width: 364px;
		height: 400px;
		background-color: rgb(247, 247, 247);
	}

	.img-texttext{
		font-size: 20px;
		font-weight: bold;
		position: absolute;
		text-align: center;
		top: 13.5%;
		left: 50%;
		transform: translate(-50%, -50%);
		color: rgb(255, 255, 255);
		}
	
</style>
</head>
<body>
	<div class="outer">
	<%@ include file="views/common/menubar.jsp" %>
		<div class="sub-contentWrapper">
			<div class="sub-content">
				<div class="sub-menuwrapper">
				</div>
				<div class="sub-primary bold reason">
					<div>특별한 날을 완성시키는</div>
					<div>가장 쉬운 방법</div>
					<img class="sub-main-img" src="https://www.sooldamhwa.com/images/modules/home/backImg2.png">
					<p class="img-texttext">4도부터 53도까지<br>
					댜앙하게 갖춰진 쇼핑몰</p>
					</img>
				</div>
				<div class="key-point-box">
					<div class="key-points">
						<div class="icon landingIcon1"></div>
						<div class="sub-main sub-small-font sub-primary bold">
							2,000종이 넘는 다양한 전통주
						</div>
						<div class="sub-smaller-font bold">
							오프라인에서 구하기 어려운 전통주도
						</div>
						<div class="sub-smaller-font bold">
							술렁술렁에는 있어요!
						</div>
					</div>
					<div class="sub-line"></div>
					<div class="key-points">
						<div class="icon landingIcon2"></div>
						<div class="sub-main sub-small-font sub-primary bold">
							우리 제법 깐깐해요
						</div>
						<div class="sub-smaller-font bold">
							술렁술렁에서 판매되는 술은 
						</div>
						<div class="sub-smaller-font bold">
							내부에서 수많은 규정을 통과한 술들이에요
						</div>
					</div>
				</div>
				<div class="sub-specialBox">
					<div class="sub-primary bold">매번 주문하기 귀찮고 고르기 어렵다면?</div>
					<div class="sub-primary bold">술렁술렁에서 구독을 시작하세요</div>
					<div class="specialBox-content">
						<div class="specialBox-cardWrapper">
							<div class="special-card">
								<div class="special-card-icon special-iconimg"></div>
								<div class="special-cardText">술렁술렁은</div>
								<div class="special-cardText">호불호없는</div>
								<div class="special-cardText">전통주를 선별해서 보내드려요</div>
							</div>
						</div>
						
						<div class="specialBox-cardWrapper">
							<div class="special-card">
								<div class="special-card-icon special-iconimg2"></div>
								<div class="special-cardText">전문가들이</div>
								<div class="special-cardText">엄선하여 선별한</div>
								<div class="special-cardText">술만을 고집해요</div>
							</div>
						</div>
						
					</div>

					<div class="subscribe-box">
						<div class="bold navy">자, 이제 나만의 '인생술 찾기 여정'을</div>
						<div class="bold navy">술렁술렁에서 시작할 준비 되셨나요?</div>
					</div>
				</div>
			</div>
	
	
	<%@ include file="views/common/footer.jsp" %>
	</div>
</body>
</html>