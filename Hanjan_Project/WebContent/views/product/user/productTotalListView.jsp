<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.product.model.vo.Product" %>
<%
	ArrayList<Product> productTotalList = (ArrayList<Product>)request.getAttribute("productTotalList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색결과페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productTotalListView.css">
</head>
<body>
	<div class="outer">
		<%@ include file="../../common/menubar.jsp" %>
			<div class="search-detail-outer">
					
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
			</div>
					<!-- <div class="search-filterwrapper">
						<div class="filter-list">
							<div class="filter flex">
								<div>
									각 옵션마다 쿼리스트링이용해서 키값 서블릿으로넘겨서 db다녀와서 각자 맞는 페이지이동?  
									<select onchange="window.location.href=this.value">
										<option value="">주종</option>
										<option value="#">하아</option>
										<option value="#">구글</option>
									</select>
								</div>
			
							</div>
						</div>
					</div> -->
				</div>
				<div class="search-detail-productwrapper">
					<div class="detail-filter">
						<div class="detail-wrapper flex">
							<div class="search-result flex">
								<div></div>
								<div>총&nbsp;</div>
								<div class="search-result-div"><%= productTotalList.size() %></div>
								<div>건의 결과가 있어요</div>
							</div>
						</div>
					</div>
		
				</div>
				<div class="search-ProductListWrapper">
					<div class="data-List">
						<div class="component-outerdiv">
							<div class="component" style="height : auto;">
								<div class="search-DataListWrapper">
									<div class="search-listGrid2">
									<% if (productTotalList.isEmpty()) { %>
									
										<h1>아무것도없다고</h1>
										
										<!-- 상품-->
									<% } else {  %>
										<% for (Product p : productTotalList) { %>
										<div class="search-list2">
											<div width="160" class="searchlist-card">
													<div class="search-imgwrapper2">
														<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
															<span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 126.923% 0px 0px;"></span>
																<img src="<%= p.getProductImage1() %>" alt="" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
														</span>
													</div>
													<div class="search-card-content">
														<div class="pimgwrapper">
															<input id="productNo" type="hidden" value="<%= p.getProductNo() %>">
															<div class="search-productName"><%= p.getProductName() %></div>
														</div>
														<div class="pimgwrapper">
															<div class="search-productPrice">
																<div class="flex search-Prispimgwrapper">
																	<p class="price"><%= p.getProductPrice() %></p>
																</div>
																<div class="search-review-wrap flex">
																	<img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt="" height="12">
																	<p class="rateScore"><%= p.getProductRate() %></p>
																	<p class="rateReview">판매량 <%= p.getUserProductCount() %></p>
																</div>
															</div>
															<div class="search-card-footer">
																<div class="search-cf-content">
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
		<script>
		
			$(function(){ // 상품 클릭시 상품디테일로 이동
				
				$('.searchlist-card').click(function(){
					
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
			
		</script>		
		<%@ include file="../../common/footer.jsp" %>
</body>
</html>