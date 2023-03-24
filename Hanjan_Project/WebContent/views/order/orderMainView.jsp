<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.order.model.vo.Shipment, com.hj.product.model.vo.Product"%>
<%
	Shipment s = (Shipment)request.getAttribute("Shipment");
	Product p = (Product)request.getAttribute("Product");
	int userNo = (int)request.getAttribute("userNo");
	//System.out.println(p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderMainView</title>
<style>
    .orderInner{
        width: 100%;
        height: 100%;
        max-width: 1144px;
        margin: 30px auto;
        padding: 40px 60px 50px;
        border: 1px solid rgb(238, 238, 238);
        border-radius: 10px;
    }
    .orderHeader{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
    }
    .title{
        font-size: 16px;
        font-weight: bold;
    }
    .divider{
        margin: 15px 0px 20px;
        border-bottom: 0.5px solid rgb(225, 222, 168);
    }
    .orderContent{
        width: 100%;
        height: 100%;
        margin: 0px auto;
    }
    .contentWrap{
        width: 100%;
        padding-bottom: 50px;
        margin: 0px auto !important;
    }
    .personInfo {
        width: 100%;
        max-width: 390px;
        background-color: rgb(255, 255, 255);
        padding: 30px 20px;
        margin: 0px auto;
        border: 1px solid rgb(238, 238, 238);
    }
    .infoHeader{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
        margin-bottom: 16px;
    }
    .addressInfoBox{
        text-align: left;
        color: rgb(62, 62, 62);
        font-size: 13px;
        font-weight: 400;
    }
    .reciverInfo{
        display: flex;
        flex-direction: column;
    }
    .addressInfo{
        line-height: 20px;
    }
    .badge{
        width: 83px;
        height: 22px;
        padding: 6px 0px;
        margin: 20px 0px 0px;
        text-align: center;
        font-weight: bold;
        font-size: 10px;
        color: rgb(0, 151, 243);
        line-height: 10px;
        border-radius: 11px;
        border: 1px solid rgb(0, 151, 243);
    }
    .productWrap{
        border: 1px solid rgb(238, 238, 238);
        width: 100%;
        max-width: 390px;
        background-color: rgb(255, 255, 255);
        padding: 30px 20px;
        margin: 0px auto;
    }
    .productHeader{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
        margin-bottom: 16px;
    }
    .product1{
        display: flex;
        margin: 0px;
    }
    .productName{
      margin-bottom: 4px;
      line-height: 100%;
      font-weight: 700;
    }
    .productInfoWrap{
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-left: 12px;
        font-size: 13px;
        text-align: left;
    }
    .delivery{
        margin-bottom: 8px;
        text-align: right;
        display: flex;
        -webkit-box-pack: end;
        justify-content: flex-end;
    }
    .delivery img{
        margin-left: 3px;
        vertical-align: middle;
        width: 18px;
    }
    .totalPrice{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
    }
    .pointWrap{
        width: 100%;
        max-width: 390px;
        padding: 30px 20px;
        margin: 0px auto 12px;
        border: 1px solid rgb(238, 238, 238);
    }
    .pointHeader{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
        margin-bottom: 16px;
    }
    .pointTitle{
        text-align: left;
        font-size: 16px;
        font-weight: 700;
        line-height: 100%;
    }
    .ponitflex{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
    }
    .pointRoot{
        display: inline-flex;
        flex-direction: column;
        position: relative;
        min-width: 0px;
        padding: 0px;
        margin: 0px;
        border: 0px;
        vertical-align: top;
    }
    .pointBase{
        width: 262px;
        height: 32px;
        padding-left: 10px;
        cursor: text;
        border-radius: 4px;
    }
    #pointInput {
        width: 250px;
        text-align: right;
        margin-left: 60px;
    }
    .cardWrap {
        width: 100%;
        max-width: 390px;
        background-color: rgb(255, 255, 255);
        padding: 30px 20px;
        margin: 0px auto 12px;
        border: 1px solid rgb(238, 238, 238);
    }
    .paymentTitle{
        text-align: left;
        font-size: 16px;
        font-weight: 700;
        line-height: 100%;
    }
    .payments{
        box-sizing: border-box;
        display: flex;

    }
    .billWrap{
        width: 100%;
        max-width: 390px;
        background-color: rgb(255, 255, 255);
        padding: 30px 20px;
        margin: 0px auto 12px;
        border: 1px solid rgb(238, 238, 238);
    }
    .billTitle{
        text-align: left;
        font-size: 16px;
        font-weight: 700;
        line-height: 100%;
    }
    .billflex{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        margin-bottom: 16px;
    }
    .billLabel{
        font-size: 13px;
        font-weight: 500;
    }
    .value{
        font-size: 13px;
        font-weight: 700;
    }
    .billFinal {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
    }
    .bottomMainWrap{
        width: 100%;
        max-width: 390px;
        background-color: rgb(255, 255, 255);
        padding: 20px;
        margin: 0px auto;
        border: 1px solid rgb(238, 238, 238);
    }
    .bottomflex{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
    }
    .bottomchkbox{
        padding: 0px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        width: 20px;
        height: 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .bottomchkMessage{
        width: 80%;
        text-align: left;
        cursor: pointer;
    }
    .payAgreeWrap{
        margin: 0px auto;
        text-align: center;
    }
    .agreebtn{
        width: 355px;
        height: 44px;
        background-color: rgb(63,72,107);
        border: 1px solid rgb(63,72,107);
        border-radius: 5px;
        padding: 0px;
        color: rgb(255, 255, 255);
        font-size: 18px;
        font-weight: 500;

    }
    .agreeA{
    	text-decoration: none;
    	color:white;}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="orderWrap">
        <div class="orderInner">
            
            <div class="orderHeader">
                <div class="title">주문 / 결제</div>
            </div>
            
            <div class="divider"></div>
            <form action="<%= contextPath %>/insertOrder.or" method="post">
            	<input type="hidden" name="userNo" value="<%= userNo %>">
            	<input type="hidden" name="productNo" value= "<%= p.getProductNo() %>">
            	<input type="hidden" name="orderCount" value= "<%= p.getOrderCount() %>">
            	<input type="hidden" name="orderPrice" value= "<%= (Integer.parseInt(p.getProductPrice()) * p.getOrderCount()) + 3000  %>">
            	<input type="hidden" name="shipNo" value= "<%= s.getShipNo() %>">
            	
            	
            	
            	
                <div class="orderContent">
                    <div class="contentWrap">

                        <div class="personInfo">
                            <div class="infoHeader">
                                <div>배송지</div>
                                <div>변경</div>
                            </div>
                            <hr style="margin: 0px 0px 20px;">
                                <div class="addressInfoWrap">
                                    <div class="addressInfoBox">
                                        <div class="reciverInfo">
                                            <span class="name" style="display: inline-block;"><%=s.getRecipient() %></span> <!--유저이름recipient-->
                                            <span class="phone"><%= s.getPhone() %></span>    <!--전화번호-->
                                        </div>
                                        <div class="addressInfo">
                                            <span><%=s.getAddress() %></span>  <!-- 유저 주소-->
                                            <span>&nbsp;<%=s.getDetailAddress() %></span> <!-- 상세주소 -->
                                        </div>
                                    </div>
                                
                                    <div class="addressSelect">
                                        <div class="badgeWrap">
                                            <div class="badge">
                                                기본배송지
                                            </div>
                                        </div>
                                    </div>
                        </div>
    
    
                    </div>
                    <div class="innerDivider" style="margin: 0px 0px 12px;"></div>

                    <div class="productWrap">
                        <div class="productHeader">
                            <div class="productTitle">주문 예정 상품</div>
                        </div>
                        <hr style="margin: 0px 0px 20px;">

                        <div class="productBox">
                            <div class="product1">
                                <a href="#" style="color:#1890ff; text-decoration:none; outline:none; cursor:pointer; background-color:transparent">
                                    <div class="flexcolumn">
                                        <img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/thumbnail/WTj2-1629257790790-%E1%84%83%E1%85%A9%E1%86%BC%E1%84%87%E1%85%A2%E1%86%A8%E1%84%81%E1%85%A9%E1%86%BE%2C%E1%84%8C%E1%85%A6%E1%84%8C%E1%85%AE-1.jpg" style="width:59px; aspect-ratio:auto 59 / 74; height:74px">
                                    </div>
                                </a>
                                <div class="productInfoWrap">
                                    <div class="productName"><%= p.getProductName() %></div> <!-- 상품명-->
                                    <div class="productNameOption" style="font-weight: 100;"><%= p.getProductAlcohol() %>%, 350ml</div> <!--용량과 정보-->
                                    <div class="price-amount" style="margin-top:10px; font-size:11px; line-height:11px;">
                                        <span><%= p.getProductPrice() %>원</span>   <!-- 상품가격-->
                                        <span><%= p.getOrderCount() %>개</span>  <!--수량-->
                                    </div>
                                </div>
                            </div>
                            <hr style="margin:0px 0px 20px;">
                        </div>
                        <div class="delivery">
                            <div class="flex flex-col">
                                <div class="deliveryText">
                                    <img src="https://www.sooldamhwa.com/images/modules/myDamhwa/icon-truck.png">
                                    <span style="font-size: 11.5px;">3,000원</span> <!-- 배송비 3천원 고정-->
                                </div>
                            </div>
                        </div>
                        <hr style="margin: 8px 0px 16px;">
                        <div class="totalPrice">
                            <div style="font-size: 13px; font-weight:bold;">
                                주문 총액
                            </div>
                            <div style="font-size: 13px; font-weight:bold;">
                                <%= (Integer.parseInt(p.getProductPrice()) * p.getOrderCount()) + 3000  %> 원 <!-- 상품가격 + 배송비 3000원-->
                            </div>
                        </div>
                    </div>
                    
                    <div style="margin: 15px 0px 20px; border-bottom: 0.5px solid rgb(255, 255, 255);"></div>
                    <div class="pointWrap">
                        <div class="pointHeader">
                            <div class="pointTitle">적립금</div>    
                        </div>
                        <hr style="margin: 0px 0px 20px;">
                        <div class="usablePointWrap" style="margin-top: 20px;">
                            <div class="pointflex">
                                <div class="label" style="display: inline-block;">
                                    포인트
                                </div>
                                <div class="inputWrap" style="display: inline-block;">
                                    <div class="pointRoot">
                                        <div class="pointBase">
                                            <input type="text" id="pointInput" placeholder="사용 할 적립금만큼 입력">   <!-- 적립금 불러오기-->
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="paymentWrap">
                        <div class="paybtn">
                            <div class="cardWrap">
                                <div class="paymentHeader">
                                    <div class="paymentTitle">결제방법</div>
                                </div>
                            <hr style="margin: 0px 0px 20px;">
                            <div class="payments">
                                <div> <input type="radio" name="orderTool" value="card">신용카드</div>
                                <div> <input type="radio" name="orderTool" value="cash">무통장입금</div>
                            </div>
                        </div>
                    </div>
                    <div class="billWrap">
                        <div class="billHeader">
                            <div class="billTitle">계산서</div>
                        </div>

                        <hr>

                        <div class="billContent">
                            <div class="billflex">
                                <div class="billLabel">결제방법</div>
                                <div class="value">선택한결제방법</div>
                            </div>
                            <div class="billflex">
                                <div class="billLabel">총 상품금액</div>
                                <div class="value"><%= (Integer.parseInt(p.getProductPrice()) * p.getOrderCount()) %>원</div>    <!-- 상품의 가격-->
                            </div>
                            <div class="billflex">
                                <div class="biLLlabel">배송비</div> <!-- 배송비는 3천원 고정-->
                                <div class="value">3000원</div>
                            </div>
                            <div class="billflex">
                                <div class="billLabel">적립금 사용</div>
                                <div class="value">?원</div>        <!-- 적립금 input에 입력한만큼 가격을 깎는다 자바스크립트-->
                            </div>
                        </div>

                        <hr>

                        <div class="billFinal">
                            <div style="color: rgb(63,72,187); font-weight: 700; font-size: 16px;">총 결제 금액</div>
                            <div style="color: rgb(63,72,187); font-weight: 700; font-size: 16px;"><%= (Integer.parseInt(p.getProductPrice()) * p.getOrderCount()) + 3000  %>원</div>    <!-- (총상품금액 + 배송비) - 적립금사용만큼-->
                        </div>

                    </div>

                    <div>
                        <div class="bottomchkWrap">
                            <div class="bottomMainWrap">
                                <div class="bottomflex">
                                    <div class="bottomchkboxWrap">
                                        <button type="button" class="bottomchkbox"></button>
                                    </div>
                                    <div class="bottomchkMessage">
                                        <span style="font-weight: 700; font-size:14px">전통주 구매자의 정보수집, 이용</span>
                                        <span style="margin-left: 5px;">(필수)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div class="payAgreeWrap">
                        <button type="submit" class="agreebtn">
                            <%= (Integer.parseInt(p.getProductPrice()) * p.getOrderCount()) + 3000  %>원 결제하기    <!-- 442행의 값을 버튼에 추가-->
                        </button>
                    </div>


                </div>
            </div>
        </form> 
        </div>
    </div>




</body>
</html>