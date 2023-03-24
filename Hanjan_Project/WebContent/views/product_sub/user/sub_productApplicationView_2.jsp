<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription, com.hj.member.model.vo.Shipment" %>
<%
	Subscription sub = (Subscription)request.getAttribute("sub");
	Shipment ship = (Shipment)request.getAttribute("ship");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독신청페이지2</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_productApplicationView_2.css">
</head>
<!-- 1에서 받은값 인풋히든으로 값 넘겨주기-->
<body>
	<div class="outer">
	<%@ include file="../../common/menubar.jsp" %>
		<div class="sub-app-contentWrapper">
			<div class="app-wrapper">
				<div class="app-title">
					배송지를 입력해주세요<br>
					 안전하게 배송해드릴게요
				</div>
				<div class="progress-label">
					<span>2</span>
					/ 3
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
					<% if ( ship.getAddress() == null) { %>
						<div class="delivery-info-member">
						</div>
					<% } else { %>
					<div class="delivery-info-member">
						<div class="delivery-default">기본배송지</div>
						<div class="text bold mname"><%= ship.getRecipient() %></div>
						<div class="text"><%= ship.getPhone() %></div>
						<div class="text"><%= ship.getAddress() %></div>
						<!-- insertShipForm.me -->
					</div>
					<% } %>
					<div class="delivery-info-buttonWrapper">
						<% if (ship.getAddress() == null) { %>
							<button id="insertSubShip"class="sub-app-button">배송지 추가</button>
						<% } else { %>
							<button id="updateSubShip"class="sub-app-button">배송지 수정</button>
						<% } %> 
						<!-- /updateShipForm.me -->
						<button id="nextsub2" class="sub-app-button2">다음 단계</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function(){
				
				$('#updateSubShip').click(function(){
					
					location.href = '<%= contextPath %>/updateShipForm.me?sno=' + <%= ship.getShipNo() %>;
					
				})
				
				$('#insertSubShip').click(function(){
					
					location.href = '<%= contextPath %>/insertShipForm.me';
					
				})
				
				$('#nextsub2').click(function(){
					
					if (<%= ship.getAddress() == null %>) {
						alert('배송지를 추가해주세요')
						return false
					} else {
						
					location.href = '<%= contextPath %>/userSubscribe/enroll/third?subType=' + '<%= sub.getSubscriptNo() %>' 
																		      + '&subName=' + '<%= sub.getSubscriptName() %>'
																			  +	'&subPrice='+ '<%= sub.getSubscriptPrice() %>'
																			  + '&shipUserName='+ '<%= ship.getRecipient() %>'
																			  + '&shipPhone=' + '<%= ship.getPhone() %>'
																			  + '&shipAddress=' + '<%= ship.getAddress() %>';
					}
				})
				
				
				
			})
			
		
		</script>
	
	<%@ include file="../../common/footer.jsp" %>
	</div>
</body>
</html>