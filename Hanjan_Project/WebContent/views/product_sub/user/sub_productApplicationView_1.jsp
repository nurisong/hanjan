<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription" %>
<%
	Subscription sub = (Subscription)request.getAttribute("sub");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독신청페이지1</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sub_productApplicationView_1.css">
</head>
<body>
	<div class="outer">
	<%@ include file="../../common/menubar.jsp" %>
		<div class="sub-app-contentWrapper">
			<div class="app-wrapper">
				<div class="app-title">
					매 월 몇개의 <%= sub.getSubscriptName() %>가 필요하세요?
				</div>
				<div class="progress-label">
					<span>1</span>
					/ 3
				</div>
				<div class="sub-introWrapper">
					<div class="intro-content-wrapper">
						<div class="subscribe-amount-content">
							<img class="sub-box-img"src="https://d38cxpfv0ljg7q.cloudfront.net/icon-damhwabox-pc.png" alt="">
							<div class="right-text-wrapper">
								<div class="price-text"><%= sub.getSubscriptName() %></div>
								<div class="select-box-wrapper">
									<span class="icon-multiply">x</span>
									<div class="sub-select-wrapper">
											<select name="count">
												<option value="1">1</option>
											</select>
										</div>
									</div>
								<div class="price-text second">
									<input type="hidden" name="subPrice" value="<%= sub.getSubscriptPrice() %>">
									매월 <span id="totalPrice"><%= sub.getSubscriptPrice() %></span> 원
								</div>
								<div class="detail-text">*매월 17일 자동으로 결제돼요</div>
							</div>
						</div>
					</div>
					<button id="nextsub" class="sub-app-button">다음 단계</button>
				</div>
			</div>
		</div>
		<script>
			$(function(){
				
				$('#nextsub').click(function(){
					//여기까지했음
					location.href = '<%= contextPath %>/userSubscribe/enroll/second?subType=' + '<%= sub.getSubscriptNo() %>' 
																			      + '&subName=' + '<%= sub.getSubscriptName() %>'
																				  +	'&subPrice='+ '<%= sub.getSubscriptPrice() %>';
				})
				
			})
		
		</script>
		
	
	
	<%@ include file="../../common/footer.jsp" %>
	</div>
</body>
</html>