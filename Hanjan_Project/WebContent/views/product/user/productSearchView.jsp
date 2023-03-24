<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productSearchView.css">
<style>
.search-contentpick{ white-space: nowrap; padding-left: 12px; }
.search-picklist{
	height: 100%;
	display: inline-block;
	width: 55%;
	position: relative;
	padding-top: 25px;
	cursor: pointer;
	width: 480px;
	margin-right: 15px;
}

</style>
</head>
<body>
	<div class="outer">
		<%@ include file="../../common/menubar.jsp" %>
			<div class="search-outer">
				<div class="searchbar">
					<div class="searchbar-inputWrapper">
						<div class="searchbar-inputBox">
							<form action="<%= contextPath %>/Search/result" class="inner">
								<img src="https://www.sooldamhwa.com/images/modules/search/icon-search-20.svg" alt="" width="20" height="36">
								<input type="text" placeholder="무엇을 찾고 계신가요?" name="keyword" required>
							</form>
							</div>
							<button class="cancel-button">취소</button>
						</div>
					</div>
				</div>
				<div class="search-content">
					<div class="searchcontent-wrapper">
						<div class="searchcontent-list">
							<div class="searchcontent-title-wrapper flex">
								<div class="title-text">요즘 이런 술은 어때요?</div>
							</div>
							<div class="search-contentpick">
								<div id="searchBest"
								 class="search-picklist">
									<div class="search-pick-img search-flexitem">
										<div class="search-img-wrapper">
												<img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/origin/LSNb-1664090420321-sommelier%20pick.png" alt="" width="30" height="30">
										</div>
									</div>
									<div class="search-pick-textbox">
										<div class="title-pick">이번 주 술렁 PICK</div>
										<div class="text-pick">요즘 가장 많이 팔려요!</div>
									</div>
								</div>
								<div class="search-picklist">
									<div class="search-pick-img search-flexitem">
										<div class="search-img-wrapper">
												<img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/origin/9l3N-1647311163752-icon.png" alt="" width="30" height="30">
										</div>
									</div>
									<div id="searchNew" class="search-pick-textbox">
										<div class="title-pick">이번 주 신상 PICK</div>
										<div class="text-pick">새로 나왔어요! </div>
									</div>
								</div>
							</div>
							<div class="search-contenttype">
								<div class="type-title">주종별로 검색해보세요</div>	
								<div class="type-container">
									<div class="type-box-wapper">
										<div id="searchTakju" class="type-box">
											<div class="type-box-title">막걸리를 좋아한다면</div>
											<img src="https://d38cxpfv0ljg7q.cloudfront.net/takju_icon.png" alt="">
											<div class="type-box-name">탁주</div>
										</div>
									</div>
									<div class="type-box-wapper">
										<div id="searchChungju" class="type-box">
											<div class="type-box-title">맑은게 좋다면</div>
											<img src="https://d38cxpfv0ljg7q.cloudfront.net/yakchungju_icon.png" alt="">
											<div class="type-box-name">청주</div>
										</div>
									</div>
									<div class="type-box-wapper">
										<div id="searchWine" class="type-box">
											<div class="type-box-title">와인을 즐긴다면</div>
											<img src="https://d38cxpfv0ljg7q.cloudfront.net/wine_icon.png" alt="">
											<div class="type-box-name">과실주</div>
										</div>
									</div>
									<div class="type-box-wapper">
										<div id="searchSoju" class="type-box">
											<div class="type-box-title">소주를 좋아한다면</div>
											<img src="https://d38cxpfv0ljg7q.cloudfront.net/soju_icon.png" alt="">
											<div class="type-box-name">증류주</div>
										</div>
									</div>
								</div>	
							</div>
							<div class="event-title">진행중인 기획전</div>
							<div class="search-event">
							<div class="event-bannerwrapper">
								<section class="event-banner-info">
									<div class="event-banner-title">블랙프라이데이</div>
									<div class="event-banner-date">22.11.11 ~ 21.12.05</div>
								</section>
								<section class="event-banner-icon">
									<img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/origin/yzAq-1668479453308-%2300d88e.png" alt="">
								</section>
							</div>
							<div class="event-bannerwrapper">
								<section class="event-banner-info">
									<div class="event-banner-title">블랙프라이데이</div>
									<div class="event-banner-date">22.11.11 ~ 21.12.05</div>
								</section>
								<section class="event-banner-icon">
									<img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/origin/yzAq-1668479453308-%2300d88e.png" alt="">
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%@ include file="../../common/footer.jsp" %>
	</div>
	
	<script>
		
		$(function(){
			
			$('#searchNew').click(function(){
							
				location.href = '<%= contextPath %>/userProductMarket/new';
							
			});
						
			$('#searchBest').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/best';
				
			});
			
		});
		
	
		$('#searchTakju').click(function(){
			
			location.href = '<%= contextPath %>/userProductMarket/type?type=' + '탁주';
			
		})
		
		$('#searchChungju').click(function(){
			
			location.href = '<%= contextPath %>/userProductMarket/type?type=' + '청주';
			
		})
		
		$('#searchWine').click(function(){
			
			location.href = '<%= contextPath %>/userProductMarket/type?type=' + '과실주';
			
		})
		
		$('#searchSoju').click(function(){
			
			location.href = '<%= contextPath %>/userProductMarket/type?type=' + '증류주';
			
		})
	
	</script>
</body>
</html>