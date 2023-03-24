<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.product_sub.model.vo.Subscription, com.hj.community.review.model.vo.Review" %>
<%

	ArrayList<Subscription> subDetailList = (ArrayList<Subscription>)request.getAttribute("subDetailList");
	ArrayList<Review> subReviewList = (ArrayList<Review>)request.getAttribute("subReviewList");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독상세페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sub_productDetailView.css">
<style>
	.sub-detail-wrapper .main-banner{
		height: 100%;
		position: relative;
		cursor: pointer;
		width: 100%;
	}

	.sub-detail-reviewWrapper .sub-content{
		display: flex;
		-webkit-box-pack: center;
		justify-content: flex-start;
		-webkit-box-align: start;
		align-items: start;
	}
</style>
</head>
<body>
	<div class="outer">
	<%@ include file="../../common/menubar.jsp" %>
		<div class="sub-detail-wrapper">
				<% if ( subDetailList.get(0).getSubscriptNo() == 1) { %>
					<% if (loginUser == null) { %>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/img_damhwabox_banner_basic_pc.png" class="main-banner gogologin">
					<% } else { %>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/img_damhwabox_banner_basic_pc.png" class="main-banner basicBannerImg">
					<% } %>
				<% } if ( subDetailList.get(0).getSubscriptNo() == 2 ) { %>
					<% if (loginUser == null) { %>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/img_damhwabox_banner_soju_pc.png" class="main-banner gogologin">
					<% } else { %>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/img_damhwabox_banner_soju_pc.png" class="main-banner basicBannerImg">
					<% } %>
				<% } %>
			<div class="sub-detail-advantegeWrapper">
				<div class="sub-detail-title"><%= subDetailList.get(0).getSubscriptName() %>의 매력포인트</div>
				<div class="sub-detail-content">
					<div class="sub-detail-card">
						<div class="subject">"재구독률 85%"</div>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/icon_damhwabox_advantage_resubscription.png" alt="">
						<div class="detail-description">
							수많은 구독자들이<br>
							이미 만족스러운<br>
							술자리중이라고
						</div>
					</div>
					<div class="sub-detail-card" style="margin-left: 190px; margin-right: 190px;">
						<div class="subject">"합리적인 가격"</div>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/icon_damhwabox_advantage_price.png" alt="">
						<div class="detail-description">
							좋은술들이<br>
							평균보다 12%가량<br>
							싸다고
						</div>
					</div>
					<div class="sub-detail-card">
						<div class="subject">"믿음직한 가격"</div>
						<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/icon_damhwabox_advantage_trust.png" alt="">
						<div class="detail-description">
							전통주 소믈리에가<br>
							엄선한 전통주가<br>
							담겨있다고
						</div>
					</div>
				</div>
			</div>
			<div class="sub-detail-reviewWrapper">
				<div class="sub-detail-title" style="margin-left: 25px;">
						<strong>99만 명의 고객님</strong>이<br>
						다채로운 술자리를 경험했어요
				</div>
				<div class="sub-detail-content">
					<% for ( Review r : subReviewList ) { %>
					<div class="sub-detail-reviewCard" style="margin-left: 50px; margin-right: 50px;">
						<div class="detail-reviewCard-body">
							<div class="detail-review">21년도 구독 리뷰</div>
							<div class="detail-mui"></div>
							<div class="subject"><%= r.getRevNo() %>번째 구독 리뷰에요</div>
							<div class="detail-mui2"></div>
							<div class="sub-content">
								<%= r.getRevContent() %>
							</div>
						</div>
						<div class="detail-reviewCard-footer">
							<img src="https://d38cxpfv0ljg7q.cloudfront.net/assets/icon_damhwabox_reviewer.png" alt="">
							<div class="detail-mui3"></div>
							<div class="reviewer"><%= r.getRevWriter() %></div>
							<div class="detail-mui4"></div>
							<img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt="">
							<div class="subscription-month">&nbsp;<%= r.getRevRate() %></div>
							<div class="subscription-origin">술렁술렁 리뷰 발췌</div>
						</div>
					</div>
					<% } %>
					
					
				</div>
			</div>
			<div class="detail-compositionWrappertitle">
				<div class="sub-com-title"><%= subDetailList.get(0).getSubscriptName() %>는</div>
				<div class="sub-com-title">이렇게 구성되었어요</div>
			</div>
			<div class="detail-compositionWrapper">
				<img src="<%= subDetailList.get(0).getSubscriptImage2() %>" alt="">
				<div class="sub-com-content">
					<div class="com-content-wrapper">
						<div class="content-number">1</div>
						<div class="subject">이달의 술</div>
						<div class="com-description">매월 컨셉에 맞는 2~4개의 전통주</div>
					</div>
					<div class="com-content-wrapper">
						<div class="content-number">2</div>
						<div class="subject">담화박스</div>
						<div class="com-description">깨질 위험없이 안전하게 포장하고 있는 박스</div>
					</div>
					<div class="com-content-wrapper">
						<div class="content-number">3</div>
						<div class="subject">큐레이션카드</div>
						<div class="com-description">추천안주,보관 방법, 등의 정보가 담긴 카드</div>
					</div>
					<div class="com-content-wrapper">
						<div class="content-number">4</div>
						<div class="subject">술렁피디아</div>
						<div class="com-description">매월 새로운 술과 관련된 카드</div>
					</div>
				</div>
			</div>
			<div class="detail-subscribe-box">
				<div class="bold sub-primary">나만의 인생술을 찾아가는 첫 시작</div>
				<% if (loginUser == null) { %>
					<button class="subscription-button buttonstyle gogologin">구독하러 가기 ></button>
				<% } else { %>
				<button id="gogoSubscription" class="subscription-button buttonstyle"> 구독하러 가기 >
				<input type="hidden" name="subType" value="<%= subDetailList.get(0).getSubscriptNo() %>">
				<input type="hidden" name="subName" value="<%= subDetailList.get(0).getSubscriptName() %>">
				<input type="hidden" name="subPrice" value="<%= subDetailList.get(0).getSubscriptPrice() %>">
				
				</button>
				<% } %>
			</div>
		</div>
		<script>
			
			$('.gogologin').click(function(){
				
				alert('로그인이 필요한 페이지입니다');
				location.href = '<%= contextPath %>/loginPage.me';
				
			});
			
			
			$('#gogoSubscription').click(function(){
				
				location.href = '<%= contextPath %>/userSubscribe/enroll/first?subType=' + $(this).find('input').val()
																				   + "&subName=" + $('input[name=subName]').val()
																				   + "&subPrice=" + $('input[name=subPrice]').val();	
			})
			
			$('.basicBannerImg').click(function(){
				
				location.href = '<%= contextPath %>/userSubscribe/enroll/first?subType=' + <%= subDetailList.get(0).getSubscriptNo() %>
																+ "&subName=" + "<%= subDetailList.get(0).getSubscriptName() %>"			
																+ "&subPrice=" + "<%= subDetailList.get(0).getSubscriptPrice() %>";
			})
		
		</script>
	
	
	<%@ include file="../../common/footer.jsp" %>
	</div>
</body>
</html>