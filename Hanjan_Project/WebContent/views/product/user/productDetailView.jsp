<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product.model.vo.Product, java.util.ArrayList, com.hj.community.review.model.vo.Review"%>   
<%

	Product productDetail = (Product)request.getAttribute("productDetail");
	ArrayList<Review> productReviewList = (ArrayList<Review>)request.getAttribute("productReviewList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productDetailView.css">
<style>
    .ReviewTitleWrapper{
        border: 1px solid rgb(63,72,107);
        border-radius: 15px;
        background-color: rgb(63,72,107);
        color: white;
        width: 100px;
        margin-bottom: 20px;
    }

    .DetailReviewWrapper{
        border-radius: 5px;
        height: 30px;
        background-color: rgb(240, 240, 240);
        text-align: left;
        display: flex;
        justify-content: flex-start;
    }

    .recontent1{
        margin-top: 3px;
        margin-left: 20px;
    }

    .recontent3{
        margin-top: 3px;
        margin-left: 430px;
    }

    .recontent3 > img{
        margin-top: 3px;
    }

    .recontent4{
        margin-top: 3px;
        margin-left: 50px;
    }

    .DetailReviewContentWrapper{
        border: 1px solid rgb(178, 178, 178);
        border-radius: 5px;
        margin-bottom: 10px;
    }

    .DRCWrapper{
        padding: 20px;
        text-align: left;
        font-size: 13px;
    }

</style>
</head>
<body>
    <div class="outer">
        <%@ include file="../../common/menubar.jsp" %>
        <div class="Detail-ContentWrapper">
            <div class="DetailWrapper">
                <div class="left-side">
                    <div class="Detail-Card">
                        <div class="detail-box" id="image">
                            <div class="detail-soolcard">
                                <div class="card1">
                                    <div class="card2">
                                        <div class="card3">
                                            <div class="card4">
                                                <div>
                                                    <span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
                                                        <span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 133.333% 0px 0px;">
                                                            <img src="<%= productDetail.getProductImage1() %>" alt="" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="detail-box">
                            <div class="detail-con">
                                <div class="sector first">
                                    <div class="detail-productName"><%= productDetail.getProductName() %></div>
                                </div>
                                <div class="sector second">
                                    <div class="detail-subtitle">
                                        	<%= productDetail.getProductDetail() %>
                                    </div>
                                    <div class="detail-tag">
                                        	#집가기 #집가자 #도망가자
                                    </div>
                                    <div class="rating">
                                        <span><img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt="" height="30px"><span class="rating-text"><%= productDetail.getProductRate() %></span></span><span class="review">[판매량 <%= productDetail.getProductCount() %>]</span>
                                    </div>
                                </div>
                                <div class="sector third">
                                    <div class="flex">
                                        <label>주종:</label>
                                        <span class="p-category"><%= productDetail.getProductType()  %></span>
                                    </div>
                                    <div class="flex">
                                        <label>도수:</label>
                                        <span><%= productDetail.getProductAlcohol() %>%</span>
                                    </div>
                                    <div class="flex">
                                        <label>용량:</label>
                                        <span><%= productDetail.getProductVolume() %>ml</span>
                                    </div>
                                </div>
                                <div class="sector fourth">
                                    <div class="flex de-price">
                                        <label>판매가격:</label>
                                    </div>
                                    <div class="flex de-discount">
                                        <div class="purchasebox">
                                            <span class="pricetext origin-price"><%= productDetail.getProductPrice() %></span><span class="pricetext">원</span>
                                        </div>
                                    </div>
                                    <div class="flex">
                                        <label class="blue">유통기한:</label>
                                        <span class="blue">병입일로부터 30일</span>
                                    </div>
                                    <div class="flex">
                                        <label class="blue">보관방법:</label>
                                        <span class="blue">세워서 냉장보관 (10˚C)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="de-line"></div>
                    <div class="Detail-img">
                        <img src="https://shop-phinf.pstatic.net/20221114_94/1668416105740ruWsG_JPEG/221114_%EC%83%81%EC%84%B8_%EC%A0%9C%EC%A3%BC%ED%95%9C%EC%9E%94_%EA%B3%A0%EC%86%8C%EB%A6%AC%EC%88%A029-(1).jpg?type=w860" alt="" width="700px">
                        <div class="ReviewTitleWrapper">리뷰</div>
                        <% if (productReviewList.isEmpty()) { %>
                            <div class="DetailReviewWrapper">
                            </div>
                            <div class="DetailReviewContentWrapper">
                                <div class="DRCWrapper">
                                    리뷰가 없습니다
                                </div>
                            </div>
                        <% } else {  %>
                        <% for (Review r : productReviewList) { %>
                        <div class="DetailReviewWrapper">
                            <div class="recontent1"><%= r.getRevWriter() %></div>
                            <div class="recontent3"><span><img src="https://www.sooldamhwa.com/images/components/atoms/star.png" alt=""width="13">&nbsp;</span><%= r.getRevRate() %></div>
                            <div class="recontent4"><%= r.getRevDate() %></div>
                        </div>
                        <div class="DetailReviewContentWrapper">
                            <div class="DRCWrapper">
                               <%= r.getRevContent() %>
                            </div>
                        </div>
                            <% } %>
                        <% } %>
                        <%@ include file="../../common/footer.jsp" %>
                    </div>
                    
               
                </div>
                <div class="right-side">
                    <div class="basket-sidebar">
                        <div class="label">
                            <label>옵션</label>
                        </div>
                        <div class="select-wrapper">
                            [<%= productDetail.getProductVolume() %>ml] <%= productDetail.getProductName() %> 
                        </div>
                        <div class="label">
                            <label>수량</label>
                        </div>

                        <div class="select-wrapper count" style="padding-left: 28px; padding-right: 28px;">
                            <div class="minus" id="minus">
                                <img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_minus_counter_inactive.png" alt="" width="24px" height="24px">
                            </div>
                                <!-- 장바구니넘길값 -->
                                   
                                <input id="number" type="number" name="pcount" value="1" maxlength="3" pattern="\d*" min="1">
                            <div class="plus" id="plus">
                                <img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_plus_counter.png" alt="" width="24px" height="24px">
                            </div>
                        </div>
                        <div class="label">
                            <label>총 상품가격</label>
                        </div>
                        <div class="select-wrapper">
                            <input id="total-price" class="total-price" type="number" name="total-price" value="<%= productDetail.getProductPrice() %>" readonly style="font-size: 18px; color : rgb(112, 112, 112); font-family: 'Pretendard-Regular';">
                            <!-- <span class="total-price">13,000원</span> -->
                        </div>
                        <div class="deilvery">
                            <div class="deilvery-icon">
                                <img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_truck.png" alt="" width="20px">
                            </div>
                            <div class="delivery-info">
                                <div>
                                    <label>(전국택배)</label>
                                    <label class="t-price">
                                        3,000원
                                    </label>
                                </div>
                                <div>
                                    <label>제주도 및 도서산간</label>
                                    <label class="t-pirce">
                                        3,000원
                                    </label>
                                </div>
                                <div class="note">
					                                    술렁술렁에서 30000원 이상 구매 시<br>
					                                    배송비 무료! (제주도 및 도서산간 제외)
                                </div>
                            </div>
                        </div>
                        <div class="btn-wrapper">
                        	<% if (loginUser == null) { %>
                            	<button class="cart-btn gologin">장바구니</button>
                            <% } else { %>
                            	<button id="insertCart" class="cart-btn">장바구니</button>
                            <% } %>
                        </div>
                        <div>
                        	<% if (loginUser == null) { %>
                            	<button class="gopay gologin">바로 구매하기</button>
                        	<% } else {  %>
                            	<button id="insertOrder" class="gopay">바로 구매하기</button>
                        	<% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    
    	$(function(){
    		
    		$('.gologin').click(function(){
    			
    			alert('로그인이 필요한 페이지입니다');
    			location.href = '<%= contextPath %>/loginPage.me';
    			
    		});
    		
    		$('#insertCart').click(function(){
    			
    			location.href = '<%= contextPath %>/CartInsert.or?productNo=' + <%= productDetail.getProductNo() %> 
    							+ '&orderCount=' + $('#number').val();
   			});
    		
			$('#insertOrder').click(function(){
    			
    			location.href = '<%= contextPath %>/OrderInsert.or?productNo=' + <%= productDetail.getProductNo() %> 
    							+ '&orderCount=' + $('#number').val();
    		});
    		
    	});	
    	
    	
   
    	
        $(function(){

            $('#plus').click(function(){
                
                let $num = $('#number').val();
                $num++;
                $('#number').val($num);
                
                if($('#number').val() > 1) {
                    $('#minus img').attr('src', 'https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_minus_counter.png');
                    
                    var $price = $('.origin-price').html();
                    var $count = $('#number').val();

                    var $result = (Number($price) * $count);
                    
                    $('#total-price').val($result);
                };
            });

            $('#minus').click(function(){
                
                if($('#number').val() > 1){
                    let $num = $('#number').val();
                    $num--;
                    $('#number').val($num);

                    var $price = $('.origin-price').html();
                    var $totalprice = $('#total-price').val();

                    var $result = $totalprice - Number($price);

                    $('#total-price').val($result);
                }
                if($('#number').val() == 1){
                    $('#minus img').attr('src', 'https://www.sooldamhwa.com/images/modules/damhwaMarket/icon_minus_counter_inactive.png');
                }
            });


        });


    </script>
</body>

</html>