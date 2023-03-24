<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.order.model.vo.Shipment, java.util.ArrayList, com.hj.order.model.vo.OrderMain" %>    
    
<%
	Shipment orderShip = (Shipment)request.getAttribute("orderShip");
	ArrayList<OrderMain> orderProductList = (ArrayList<OrderMain>)request.getAttribute("orderProductList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .orderListHeader{
        width: 390px;
        display: flex;
        flex-direction: column;
        margin: 0px auto 12px;
        padding: 20px 20px 30px;
        font-size: 13px;
        color: rgb(178, 178, 178);
    }
    .orderStatus{
        display: flex;
        justify-content: space-around;
        width: 350px;
        height: 80px;
        border: 1px solid rgb(224, 224, 224);
        border-radius: 10px;
        padding: 24px 12px 16px;
        margin-top: 10px;
        background-color: white;
    }
    .headerBtn{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 0px;
        padding: 0px;
        color: rgb(178, 178, 178);
        font-weight: bold;
        cursor: pointer;
        background-color: transparent;
        border: none;
    }
    .myOrdersWrap{
        width: 390px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 0px auto 12px;
    }
    .myOrdersInfoWrap{
        border: 1px solid rgb(238, 238, 238);
        width: 390px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding-bottom: 20px;
    }
    .myOrderInfoHeaderWrap{
        width: 390px;
        border-radius: 10px;
        padding: 20px 20px 0px;
        text-align: left;
    }
    .myOrderHeader{
        margin-bottom: 3px;
        justify-content: space-between;
    }

    .itemCancelBtn {
        font-weight: bold;
        cursor: pointer;
        display: flex;
        align-items: center;
        -webkit-box-align: center;
        justify-content: flex-end;
    }
    .orderPersonInfo{
        height: 36px;
        align-items: center;
        margin: 20px 0px 50px;
        padding: 0px 20px;
        font-size: 13px;
        font-weight: 700;
        z-index: 9;
    }
    .flex header{
        margin-bottom: 8px;
    }
    .status{
        color: rgb(250, 174, 52);
        font-size: 13px;
        font-weight: 700;
        text-align: left;
    }
    .product-box {
        height: 100%;
        display: flex;
        padding: 8px 0px 0px;
        border-top: 0.5px solid rgb(224, 224, 224);
        justify-content: space-between;
    }
    .a{
        text-decoration: none;
        outline: none;
        cursor: pointer;
        background-color: transparent;
        
        
    }
    .itemBoxTextWrap{
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-left: 12px;
        font-size: 13px;
        text-align: left;
    }
    .price-amount{
        display: flex;
        margin-top: 10px;
        font-size: 12px;
        line-height: 11px;
    }
    .btnWrap{
        white-space: nowrap;
        font-size: 16px;
        font-weight: 500;
        width: 70px;
        height: 28px;
        padding: 0px;
    }
    .deliveryPrice{
        width: 390px;
        margin: 16px 0px 0px;
        padding: 0px 20px;
        font-size: 13px;
    }
    .priceBox{
        display: flex;
        width: 100%;
        justify-content: flex-end;
        border-top: 0.5px solid rgb(224, 224, 224);
        padding: 8px 0px 12px;
    }
    #click-order{
        color: rgb(255, 175, 188);
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <%@ include file="myPageTopbar.jsp" %>

        <div class="main-area">
            <div id="title">주문 내역</div>
                <div id="title-line"><hr></div>
                <!-- 여기서부터 작업 -->
           
            <div class="orderListHeader">
                <div class="orderStatus">
                    <button class="headerBtn">
                        <span class="listNumber">0</span>
                        <span class="listText">입금대기</span>
                    </button>
                    <button class="headerBtn">
                        <span class="listNumber">0</span>
                        <span class="listText">상품 준비</span>
                    </button>
                    <button class="headerBtn">
                        <span class="listNumber">0</span>
                        <span class="listText">배송 중</span>
                    </button>
                    <button class="headerBtn">
                        <span class="listNumber">0</span>
                        <span class="listText">배송 완료</span>
                    </button>
                    <button class="headerBtn">
                        <span class="listNumber">0</span>
                        <span class="listText">수령 확인</span>
                    </button>
                </div>
            </div>

            <div class="infiniteScroll">
                <div class="infiniteScrollComponent">
                    <div class="myOrdersWrap">
                    <% if (orderProductList.isEmpty()) { %>
                    	<h1>주문내역이 없습니다</h1>
                    <% } else { %>
                    	<% for ( OrderMain o  : orderProductList) { %>
                        <div class="myOrdersInfoWrap">

                            <div class="myOrderInfoHeaderWrap">
                                <div class="myOrderHeader">
                                    <div class="flex">
                                        <div class="orderDay" style="font-size:16px; font-weight:bold;">
                                            <%= o.getOrderDate() %>	<!-- orderDate -->
                                        </div>
                                    </div>
                                    <div class="itemCancelBtn">
                                        <a href="#" style="font-size:11px">취소하기</a>
                                    </div>
                                </div>
                            </div>

                            <div class="myItemWrap">
                                <div class="orderPersonInfo">
                                	<div><%= orderShip.getShipName() %></div><br>
                                    <span><%= orderShip.getRecipient() %></span>	<!-- 이름 -->
                                    <span style="margin: 0px 4px;">|</span>
                                    <span><%= orderShip.getPhone() %></span><br>	<!-- phone -->
                                    <div><%= orderShip.getAddress() %></div>
                                </div>
                                <div class="orderItemBox">
                                    <div class="orderItemContent" style="padding: 0px 20px;">
                                        <div class="product-box">
                                            <div class="flex column" style="flex-direction:column;">
                                                <div class="productItemBoxWrap">
                                                    <a href="#">
                                                        <div class="flex column">
                                                            <img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/thumbnail/rC0W-1659321041025-0.jpg" width="59" height="74" alt="">
                                                        </div>
                                                    </a>
                                                    <div class="itemBoxTextWrap">
                                                        <span style="margin-bottom: 3px; font-weight:500; line-height:13px"><%= o.getOrderProductName() %></span>
                                                        <div class="product-name" style="margin-bottom:4px; line-height:100%"><%= o.getOrderProductDetail() %></div>
                                                        <div class="product-option" style="font-weight:400;">용량 : [<%= o.getOrderProductVolume() %>ml] 도수: <%= o.getOrderProductAlcohol() %> </div>
                                                        <div class="price-amount">
                                                            <span><%= o.getOrderPrice() %>원</span><!-- 가격 -->
                                                            <span>수량 <%= o.getOrderCount() %> 개</span><!-- 수량 -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btnWrap">
                                                <button onclick="location.href='<%=contextPath %>/enrollForm.rv'">
                                                    리뷰쓰기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="deliveryPrice">
                                    <div class="priceBox">
                                        <div class="price"></div>	<!-- 총 지불 가격 -->
                                    </div>
                                </div>
                            	</div>
                        	</div>
                        	<% } %>
                        <% } %>
                    </div>
                </div>
            </div>


        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>