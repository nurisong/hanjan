<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.product_sub.model.vo.Subscription" %>
<%

	ArrayList<Subscription> subscriptionList = (ArrayList<Subscription>)request.getAttribute("subscriptionList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sub_productListView.css">
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
		background-color: rgb(178, 216, 235);
	}
	
</style>
</head>
<body>
	<div class="outer">
	<%@ include file="../../common/menubar.jsp" %>
		<div class="sub-contentWrapper">
			<div class="sub-content">
				<div class="sub-header">
					<!-- 로그인 X-->
					<div class="first-header grey12">한 달에 한번, 찾아오는 인생술</div>
					<div class="bold grey12">궁금한 술렁박스를 선택해보세요</div>
					<!-- 로그인 O
					<div class="first-header grey12">경호 님,</div>
					<div class="bold grey12">궁금한 술렁박스를 선택해보세요</div>
					-->
				</div>
				<div class="sub-menuwrapper">
					<div class="sub-menubox">
						<% if (subscriptionList.isEmpty()) {%>
							<h1>아무것도없다고</h1>
						<% } else { %>
							<% for (Subscription s : subscriptionList.subList(0, 2)) {%>
							<div class="sub-boxCard">
								<input type="hidden" name="subscriptionNo" value="<%= s.getSubscriptNo() %>">
								<img id="basic" class="sub-boxImg" src="<%= s.getSubscriptImage1() %>"></img>
								<div class="sub-boxDescription">
									<div class="sub-box-header">
										<span class="sub-type bold"><%= s.getSubscriptName() %></span>
										<span class="sub-price bold">
											<%= s.getSubscriptPrice() %> 원 / 월
										</span>
									</div>
									<div class="sub-des">
										다양한 술렁박스 보러가기 >
									</div>
									<div class="divider"></div>
									<div class="date-wrapper">
										<div class="sub-date">결제일</div>
										<div>12월 17일</div>
									</div>
									<div class="sub-text-wrapper">매 달 선별해서 보내드려요</div>
								</div>
							</div>
							<% } %>
						<% } %>
						<!---->
					
						<!---->
					</div>
				</div>
				<div class="sub-primary bold reason">
					<div>술렁술렁에서 편리하게</div>
					<div>한달을 특별하게 만들어보세요</div>
				</div>
				<div class="sub-main-img"></div>
				<div class="key-point-box">
					<div class="key-points">
						<div class="icon landingIcon1"></div>
						<div class="sub-main sub-small-font sub-primary bold">
							결제 3일전 알림 문자
						</div>
						<div class="sub-smaller-font bold">
							결제전에 알려드릴게요
						</div>
						<div class="sub-smaller-font bold">
							이 달의 술렁박스는 무엇이 있을까요?
						</div>
					</div>
					<div class="sub-line"></div>
					<div class="key-points">
						<div class="icon landingIcon2"></div>
						<div class="sub-main sub-small-font sub-primary bold">
							전통주는 유일하게 문앞 배송이 가능해요
						</div>
						<div class="sub-smaller-font bold">
							매월 배송비 없이 원하는 곳에서 편하게
						</div>
						<div class="sub-smaller-font bold">
							다양한 술자리를 즐길 수 있어요
						</div>
					</div>
				</div>
				<div class="sub-specialBox">
					<div class="sub-primary bold">전통주 구독을</div>
					<div class="sub-primary bold">술렁술렁에서 시작해야 되는 이유</div>
					<div class="specialBox-content">
						<div class="specialBox-cardWrapper">
							<div class="special-card">
								<div class="special-card-icon special-iconimg"></div>
								<div class="special-cardText">술렁술렁은</div>
								<div class="special-cardText">국내 최고의</div>
								<div class="special-cardText">전통주 No.1 구독 서비스입니다</div>
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
						<button id="goSubBox" class="subscription-button buttonstyle">구독 박스 구경하기 ></button>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function(){ // 상품 클릭시 상품디테일로 이동
						
				$('.sub-boxCard').click(function(){
					
					location.href = '<%= contextPath %>/userSubscribe/detail?subscriptionNo=' + $(this).find('input').val();
					
				})

				$('#goSubBox').click(function(){
					
					location.href = '<%= contextPath %>/userSubscribe/detail?subscriptionNo=' + 1;
					
				})
				
			})
		
		</script>
		
	<%@ include file="../../common/footer.jsp" %>
	</div>
</body>
</html>