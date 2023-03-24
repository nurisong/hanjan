<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.product.model.vo.Product, com.hj.community.review.model.vo.Review" %>
<%
	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
	//ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productListView.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="outer">
	<%@ include file="../../common/menubar.jsp" %>
		<div class="header-Menu">
			<ul class="menu-list">
				<li>
					<div class="menu-label">
						<span id="totalList">전체상품</span>
					</div>
				</li>
				<li>
					<div class="menu-label">
						<span id="newList">신상품</span>
					</div>
				</li>
				<li>
					<div class="menu-label">
						<span id="bestList">베스트</span>
					</div>
				</li>
				<li>
					<div class="menu-label">
						<span>이벤트</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="content-outer">
			<div class="content">
				<div id="demo" class="carousel slide" data-ride="carousel">

					<!-- Indicators -->
					<ul class="carousel-indicators">
					  <li data-target="#demo" data-slide-to="0" class="active"></li>
					  <li data-target="#demo" data-slide-to="1"></li>
					  <li data-target="#demo" data-slide-to="2"></li>
					</ul>
					
					<!-- The slideshow -->
					<div class="carousel-inner">
					  <div class="carousel-item active">
						<img src="https://img.freepik.com/free-photo/pink-and-yellow-plain-background_53876-98329.jpg?w=2000" alt="Los Angeles" width="1100" height="500">
					  </div>
					  <div class="carousel-item">
						<img src="https://htmlcolorcodes.com/assets/images/colors/pastel-purple-color-solid-background-1920x1080.png" alt="Chicago" width="1100" height="500">
					  </div>
					  <div class="carousel-item">
						<img src="https://i.pinimg.com/originals/13/de/93/13de93382f066b8c350903be031e192b.jpg" alt="New York" width="1100" height="500">
					  </div>
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev" id="prev">
					  <span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#demo" data-slide="next" id="next">
					  <span class="carousel-control-next-icon"></span>
					</a>
				</div>

				<div class="drinklist">
					<div class="drinklist-inner">
						<div class="drinklist-section">
							<div id="takju">
								<img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_takju.png" alt="" width="55px" height="55px">
							</div>
							<label class="name">탁주</label>
						</div>
						<div class="drinklist-section">
							<div id="chungju">
								<img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_cheongju.png" alt="" width="55px" height="55px">
							</div>
							<label class="name">청주</label>
						</div>
						<div class="drinklist-section">
							<div id="wine">
								<img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_gwashilju.png" alt="" width="55px" height="55px">
							</div>
							<label class="name">과실주</label>
						</div>
						<div class="drinklist-section">
							<div id="soju">
								<img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_jeungryuju.png" alt="" width="55px" height="55px">
							</div>
							<label class="name">증류주</label>
						</div>
					</div>
				</div>
				<div class="line"></div>
				<div class="product-pick">
					<div class="picktitle">
						<img src="http://skg1891.cafe24.com/wp-content/uploads/2013/11/dummy-image-square.jpg" alt="" width="45" height="45">
						<div class="title">
							<div class="main-title">특별한날엔</div>
							<div class="sub-title">이런 술 어때요?</div>
						</div>
						<div class="more">
							<a href="#" class="flex view-more">더보기</a>
						</div>
					</div>
				</div>
				<div class="ProductListWrapper">
					<div class="data-List">
						<div class="component-outerdiv">
							<div class="component" style="height : auto;">
								<div class="DataListWrapper">
									<div class="plistGrid2">
								<% if (productList.isEmpty()){ %>
								
									<h1>아무것도없다고</h1>
									
								<% } else {  %>
									<% for (Product p : productList.subList(0, 4)) { %>
										
										<!-- 상품-->
										
											<div class="plist2">
												<div width="160" class="plist-card">
													<div class="ispimgwrapper2">
														<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
															<span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 126.923% 0px 0px;"></span>
																<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPsAAADJCAMAAADSHrQyAAAAY1BMVEX///+VlZWPj4/j4+O0tLT7+/ucnJyfn5/b29uSkpKkpKSrq6uurq7m5uZmZmaWlpbz8/OIiIjs7Ox5eXlkZGRsbGzNzc2BgYF0dHTU1NRvb2+7u7ve3t7w8PDCwsKKiopcXFxuhZvhAAAELklEQVR4nO3b25KiOhQG4HBIICgHUQgg6rz/U85Kgt3OlNDs6mrdrPm/Kwtzwc9KApIoBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAU3LBu8/tR8k23i2IW77xcxXqRaGq332OPyRSOviCVjwrX5dfRg+CsH33af6Eqerhc/fLouN3n+cPqF10rdvombzVfLNHrsNrlT//ulZ8s+e+6uVM9Ivi2+f9NDcbfaq65pjdT3PzHX4aD2fNL/uUTc91+MR3+HEM2WX301yQzDyyTVcmyEXKLns+DeY2f353m2bBUYieW/aPpzk981TjZzmKzq7u9dfP8KSMbFtu2Xdrogepa8ssexU+Sfr35QhH35hZ9shnV3N89sg35ph94Xep+wkT+i7PMnu50KBknj1ZaJDpz+zM7u/IvtCAeXb9D2dfXfd/ea5D9pec1ysg+0IDZPefMc+/5LxeAdkXGjxmb3m9o/4vz3W5vU7Msq+su1/AYLQGvT77/TU9n70Hq7N/sU67RWuz31fnGUVfmX2sta86q51Gq7Lra+KjRy87r1dYlT3wVQ9YVX1t9oDbNOeszs5rmnP8usxCg/JedWYdXny9LtP7suuS1zTn+LprtX9OhVN0flX/XIed2Tt87/AMqy4e5vF5DKc5776JaiE6u5vbh3r30b21fYjRbgB8bEDQesdxrN9d8iWckwMAAAAAAAAA/A/FqqyEONtliTExJptez1S7sxBXpXr6nCfKbTDJy+lvg73yDa/u7ySbfYsng6GhfOpE0bpuv+tM5Y5XByVF3DQZfW6bQdtj16Zxixd9YeJsuFX0vUo2nF2Ux+NOiISyx4P9y+Pg12Z89uFg6HPSGbdaVQadvRSyPF7oQpxSERfVG8/8+8qbogra7MqWPD/6/VNT9uxIXdvog627NLE2969ESn0gLi5vPffvKsNrEz1m37vDU5+/dqkQp7PLHnXpeaCwl8N9vXbz2W91Ec9mT81VpMVobPb2mPd2bnjMHlWXarsbrsqbMLe57EUdKnE1tcu+M1XenX32KI7jiMbEsevMdl/clzdJPTmbyV7tjcxK6bLfSn/UZu/DQ0HjvWn7vt9y3eU49LPZWyp9LGx2WVDNE2rj+rzsCwZz3U1Wh11STNnrP7NfquLc9S572jSnU9Pk03hPeWQXmQkKW1MauWP3eI8rLtIc6CZus8cDdXCa+UV1CyWX7BU9uJnCPrZdhcjsTC4+s4tk6IQb7+pAiauCap4N1KZ12Wmev2x2vMuQerpsml+USzfD0CQ+SmVKKfa/anp+S4Q8hjQY3J2tM1LUxjakobAvGhoI291QHdn/84+p3SFd9efzOFVRjhEN/lSKKrUjIRIydfeyiA6JCzXsc7oIqbXt51oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+K7fw2lApeR5FTgAAAAASUVORK5CYII=" alt="" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;"/>
														</span>
													</div>
													<div class="card-content">
														<div class="pimgwrapper">
															<input id="productNo" type="hidden" value="<%= p.getProductNo() %>">
															<div class="productName"><%= p.getProductName() %></div>
														</div>
														<div class="pimgwrapper">
															<div class="productPrice">
																<div class="flex Prispimgwrapper">
																	<p class="price"><%= p.getProductPrice() %>원</p>
																</div>
																<div class="review-wrap flex">
																	<img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt="" height="12"/>
																	<p class="rateScore"><%= p.getProductRate() %></p>
																	<p class="rateReview">판매량&nbsp;<%= p.getUserProductCount() %></p>
																</div>
															</div>
															<div class="list-card-footer">
																<div class="cf-content">
																	<div><%= p.getProductDetail() %></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										<!-- 상품 끝-->
										<% } %>
									<% } %>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 타임세일 시작-->
				<div class="SpecialPrice">
					<div class="upper-parts">
						<div class="upper-parts">
							<div class="flex alignCenter">
								<img class="clockImg" src="https://www.sooldamhwa.com/images/modules/damhwaMarket/clock.png" alt="">
								<span class="clockTitle">오늘의 특가 : </span>
							</div>
						</div>
						<div class="realTime">
							<span id="sale-hours"></span>
							<span id="sale-col">&nbsp;:&nbsp;</span>
							<span id="sale-minutes"></span>
							<span id="sale-col">&nbsp;:&nbsp;</span>
							<span id="sale-seconds"></span>
							<span id="realTime-text">&nbsp;남았어요</span>
						</div>
						<div class="sp-today">
							시간이 지나면 할인이 끝나요
						</div>
					</div>

				
					
					<div class="sp-contentWrapper">
						<a href="#" class="sp-content">
							<div class="sp-img-wrapper">
								<div class="spimg" src="https://sooldamhwa-static-files.s3.ap-northeast-2.amazonaws.com/admin_contents/origin/g5PJ-1669255915446-hoho.jpg"></div>
							</div>
							<div class="content-container">
								<div class="r-content">
									<div class="red-box center">특가할인!</div>
									<div class="selling">많이 팔린술이에요</div>
									<div class="flex alignCenter rName">
										<div class="rp-name">[신상품]집에가자</div>
									</div>
									<div class="r-footer flex alignCenter">
										<div class="flex alignCenter">
											<img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt="" width="16px" height="16px">
											<div class="rateScore">3.5</div>
											<div class="numberOfreivew">리뷰 999</div>
										</div>
										<div class="flex alignCenter">
											<div class="r-pirce">1,830,500원</div>
										</div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<!-- 타임세일 끝 -->
				<div class="product-pick">
					<div class="picktitle" style="margin-top : 135px;">
						<img src="http://skg1891.cafe24.com/wp-content/uploads/2013/11/dummy-image-square.jpg" alt="" width="45" height="45">
						<div class="title">
							<div class="main-title">인생 술</div>
							<div class="sub-title">경험해보셨나요?</div>
						</div>
						<div class="more">
							<a href="#" class="flex view-more">더보기</a>
						</div>
					</div>
				</div>
				<div class="ProductListWrapper">
					<div class="data-List">
						<div class="component-outerdiv">
							<div class="component" style="height : auto;">
								<div class="DataListWrapper">
								
									<div class="plistGrid2">
									<% if (productList.isEmpty()){ %>
								
									<h1>아무것도없다고</h1>
									
									<% } else {  %>	
										<% for (Product p : productList.subList(4, 8)) { %>
										<!-- 상품-->
										<div class="plist2">
											<div width="160" class="plist-card">
													<div class="ispimgwrapper2">
														<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
															<span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 126.923% 0px 0px;"></span>
																<img src="<%= p.getProductImage1() %>" alt="" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
														</span>
													</div>
													<div class="card-content">
														<div class="pimgwrapper">
															<input id="productNo" type="hidden" value="<%= p.getProductNo() %>">
															<div class="productName"><%= p.getProductName() %></div>
														</div>
														<div class="pimgwrapper">
															<div class="productPrice">
																<div class="flex Prispimgwrapper">
																	<p class="price"><%= p.getProductPrice() %>원</p>
																</div>
																<div class="review-wrap flex">
																	<img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt="" height="12">
																	<p class="rateScore"><%= p.getProductRate() %></p>
																	<p class="rateReview">판매량&nbsp;<%= p.getUserProductCount() %></p>
																</div>
															</div>
															<div class="list-card-footer">
																<div class="cf-content">
																	<div><%= p.getProductDetail() %></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- 상품 끝-->
											<% } %>
										<% } %>
									</div>
								</div>
							</div>				
						</div>
					</div>	
				</div>					
			</div>
		</div>
	</div>	
	
	<script>
		function saleTime(){
			var now = new Date();
			var end = new Date(2022,11,14,12,00,00);  // 달수는 -1 Wed Dec 14 2022 12:00:00 GMT+0900 (한국 표준시)
			// console.log(end);

			var nowtime = now.getTime();
			var endtime = end.getTime();

			if(nowtime<endtime){ // 현재시간이 끝나는 시간보다 적다면
				sec = parseInt(endtime - nowtime) / 1000 ;
				hour = parseInt(sec/60/60);
				sec = (sec - (hour*60*60));
				min = parseInt(sec/60);
				sec = parseInt(sec-(min*60));
			}

			// console.log(sec);
			// console.log(hour);
			// console.log(min)

			if(hour<10){hour="0"+hour;}
			if(min<10){min="0"+min;}
			if(sec<10){sec="0"+sec;}

			
			$('#sale-hours').html(hour);
			$('#sale-minutes').html(min);
			$('#sale-seconds').html(sec);
		}
		setInterval(saleTime,1000); //내가 지정한 시간 간격마다 함수 실행 1000ms == 1초
		
		$(function(){ // 상품 클릭시 상품디테일로 이동
			
			$('.plist-card').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarketDetail.pro?pno=' + $(this).find('input').val();
				
			})
			
		})
		
		$(function(){
			
			$('#totalList').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/total';
				
			});
			
			$('#newList').click(function(){
							
				location.href = '<%= contextPath %>/userProductMarket/new';
							
			});
						
			$('#bestList').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/best';
				
			});
		});
		
		$(function(){
			
			$('#takju').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/type?type=' + '탁주';
				
			})
			
			$('#chungju').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/type?type=' + '청주';
				
			})
			
			$('#wine').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/type?type=' + '과실주';
				
			})
			
			$('#soju').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket/type?type=' + '증류주';
				
			})
			
			
		})

		
	</script>
	
	<!-- 
	<script>
			
		function selectReviewRateCount(){
			$.ajax({
				url : 'userProductReviewRateCount.pro',
				data : { pNo : $('#productNo').val()},
				
				success : function(reviewList){
					
					alert('성공');
					console.log(reviewList);
				},
				error : function(){
					alert('실패');
				}
			})	
		};
		
		$(function(){
			selectReviewRateCount();
		});
		
	</script>
	 -->
	
</body>
<%@ include file="../../common/footer.jsp" %>
</html>