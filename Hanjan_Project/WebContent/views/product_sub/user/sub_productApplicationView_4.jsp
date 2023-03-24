<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription, com.hj.member.model.vo.Shipment" %>    
<%
	
	Subscription sub = (Subscription)request.getAttribute("sub");
	Shipment ship = (Shipment)request.getAttribute("ship");
	int userNo = (int)request.getAttribute("userNo");
	
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독신청페이지4</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sub_productApplicationView_4.css">
</head>
<!-- 1에서 받은값 인풋히든으로 값 넘겨주기-->
<body>
	<div class="outer">
	<%@ include file="../../common/menubar.jsp" %>

		<div class="sub-app-contentWrapper">
			<div class="app-wrapper">
				<div class="app-title">
					<%= sub.getSubscriptName() %> 구독완료!<br>
					매 달 엄선해서 보내드릴게요
				</div>
				<div class="progress-label">
					&#127862; &#128077;
				</div>
				<div class="sub-deliveryWrapper">
					<div class="delivery-info-box">
						<img class="delivery-img" src="	https://d38cxpfv0ljg7q.cloudfront.net/icon-damhwabox-pc.png" alt="">
						<div class="right-text-wrapper">
							<div class="text first">
								<span><%= sub.getSubscriptName() %>&nbsp;(<%= sub.getSubscriptPrice() %>원)</span>
								매월 1박스
							</div>
							<div class="text">
								매월 <%= sub.getSubscriptPrice() %>원
							</div>
						</div>
					</div>
					<div class="delivery-info-member">
						<div class="delivery-default">기본배송지</div>
						<div class="text bold mname"><%= ship.getRecipient() %></div>
						<div class="text"><%= ship.getPhone() %></div>
						<div class="text"><%= ship.getAddress() %></div>
						<div class="member-Price">결제정보</div>
					</div>
					<div class="delivery-Price">
						<div class="total-price rmagin">총 상품금액</div>
						<div class="discount-price rmagin">할인 금액</div>
						<div class="del-price rmagin">배송비</div>
						<div class="final-price rmagin">결제 예정 금액</div>
					</div>
					<div class="delivery-PriceNum">
						<div class="total-price rmagin"><%= sub.getSubscriptPrice() %></div>
						<div class="rmaginsub">-</div>
						<div class="discount-price rmagin">0</div>
						<div class="rmaginsub">+</div>
						<div class="del-price rmagin">0</div>
						<div class="rmaginsub">=</div>
						<div class="final-price rmagin"><%= sub.getSubscriptPrice() %></div>
					</div>
					<div class="delivery-info-buttonWrapper">
						<button id="nextShopping" class="sub-app-button2">계속 쇼핑하기</button>
						<button id="mypageSub"class="sub-app-button2">구독내역 보기</button>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		
		$(function(){
			
				$('#nextShopping').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket.pro';
				
				})
				
				$('#mypageSub').click(function(){
					
					location.href = '<%= contextPath %>/subLookup.me?userNo=' + <%= userNo %>;
					
				})	
			
				
				
		})
		
	
	
	</script>
	
	
	<%@ include file="../../common/footer.jsp" %>
	</div>
</body>
</html>