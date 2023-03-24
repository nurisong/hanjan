<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.order.model.vo.Cart"  %>
<%
	ArrayList<Cart>list = (ArrayList<Cart>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    body{
        margin: 0;
        width: 100%;
        line-height: 1.5715;

    }
    .thumbnail img{
        border-radius: 10px;
        cursor : pointer;
    }
   
    .cartwrap {
        display: grid;
        /* grid-template-rows: auto 1fr; */
        /* grid-template-columns: 1.4fr 1fr; */
        -webkit-box-align: start;
        align-items: start;
        max-width: 1024px;
        width: 100%;
        min-width: 100vh;
        padding: 0px 69px;
    }
    .cart-top{
        margin: 40px 20px 10px;
        height: 30px;
        display: flex;
        flex-direction: column;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
    }
    .top-wrap{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .top-left {
        margin-left: 8px;
        display: inline-block;
        font-size: 13px;
    }
    .bill-main {
        margin-left: 45px;
        position: sticky;
        top: 120px;
    }
    .bill {
        height: 100%;
        padding: 20px;
        border-radius: 10px;
        border: 0.5px solid rgb(224, 224, 224);
        margin-bottom: 60px;
        background-color: rgb(255, 255, 255);
    }
    .cart-inner {
        margin-bottom: 15px;
        padding: 20px;
        border-radius: 10px;
        border: 1px solid rgb(224, 224, 224);
        background-color: rgb(255, 255, 255);
    }
    .inner-content{
        display: grid;
        grid-template-columns: 32px 1fr;
        text-align: left;
        grid-template-rows: 1fr auto;
    }
    .custom-btn {
        display: flex;
        padding: 0px;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        width: 20px;
        height: 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .product-info {
        display: grid;
        grid-template-rows: 1fr auto;
        grid-template-columns: auto 1fr auto;
        column-gap: 15px;
        margin-bottom: 12px;
    }
    .thumbnail{
        height: 68px;
        grid-row: span2 / auto;
    }
    .product-name {
        -webkit-box-flex: 1;
        flex-grow: 1;
        word-break: keep-all;
        font-size: 15px;
        font-weight: bold;
    }
    .product-remove-btn{
        display: flex;
        padding: 0px;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        width: 20px;
        height: 20px;
        border-radius: 5px;
        cursor: pointer;
        float:right;
    }
    .inner-bottom {
        width: 100%;
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
    }
    .amount-control {
        display: grid;
        width : 90px;
        grid-template-rows: 27px;
        grid-template-columns: 1fr 1fr 1fr;
        -webkit-box-pack: center;
        place-content: center;
        text-align: center;
        color: rgb(112, 112, 112);
    }
    .decrease {
        padding : 0px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        border: 1px solid rgb(224, 224, 224);
        font-size: 11.4px;
    }
    .amount {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        padding : 0px;
        border-width: 1px;
        border-style: solid none;
        border-color: rgb(224, 224, 224);
        border-image: initial;
    }
    input[type=number]{
        width: 45px;
        font-size: 12px;
        font-weight: bold;
        padding: 2px 0px 0px;
        text-align: center;
        border: none;
        background-image: none;
        background-color: transparent;
        box-shadow: none;
    }
    .increase{
        padding : 0px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        border: 1px solid rgb(224, 224, 224);
        font-size: 11.4px;
    }
    .inner-bottom.price{
        display: flex;
        -webkit-box-align: center;
        align-items: center;
    }
    .discount {
        margin-left: 10px;
        font-size: 15px;
        font-weight: bold;
    }
    .inner-footer {
        font-size: 12px;
        margin-left: 30px;
    }
    .frow{
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        height: 15px;
        line-height: 15px;
        margin-bottom: 8px;
    }
    .total-price {
        margin-top: 12px;
        height: 21px;
        line-height: 21px;
    }
    .bill-main {
        margin-left: 50%;
        position: sticky;
        top: 120px;
    }
    .bill {
        height: 100%;
        padding: 20px;
        border-radius: 10px;
        border: 0.5px solid rgb(224, 224, 224);
        margin-bottom: 60px;
        background-color: rgb(255, 255, 255);
    }
    .btitle {
        height: 24px;
        text-align: left;
        color : rgb(62, 62, 62);
        font-size: 13px;
        font-weight: bold;
    }
    .solid-top{
        border-top : 0.5px solid rgb(178, 178, 178);
        margin: 15px 0px 20px;
    }
    .bill-content {
        box-sizing: border-box;
    }
    .row {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        margin-bottom: 10px;
        height: 15px;
        line-height: 15px;
        font-size: 12px;
        font-weight: bold;
    }
    .info {
        display: flex;
        color: rgb(178, 178, 178);
        font-size: 10px;
        text-align: left;
    }
    .solid-bottom {
        border-top: 0.5px solid rgb(178, 178, 178);
        margin : 15px 0px;
    }
    .bill-footer {
        display : flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        height: 21px;
        line-height: 21px;
        font-weight: bold;
    }
    .bill-btn-wrap{
        margin-top : 20px;
    }
    .solid{
        width: 100%;
        border-top: 0.5px solid rgb(178, 178, 178);
        margin: 15px 0px 20px;
    }
    .bill-btn-wrap{
        float : right;
    }
</style>
</head>
<body>

	<%@include file="../common/menubar.jsp" %>
    <div class="cartwrap">
        <div class="cart-top">
            <div class="top-wrap">
                <div class="top-left">
                    <button type="button" onclick="checkedAll();">모두선택</button>
                </div>
                <div class="top-right">
                    <button type="button">선택삭제</button>
                </div>
            </div>
        </div>

        <div class="cart-main">

            <!-- 포문 시작 --> 
            <% if(list.isEmpty()){ %>
                <div class="empty">
                    <p style="text-align:center">장바구니가 비어있어요 :(</p><br><br><br>
                </div>
            <% } else { %>
                <% for(Cart c: list) { %>
                    <form id="cartForm" action="<%= contextPath %>/mainOrder.or" method="post"> <!--input type:text hidden name="pno" value="list.get(i).getPno"-->
                     <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                     <input type="hidden" name="productNo" value="<%= c.getProNo() %>">
                        <div class="cart-inner">
                            <div class="inner-head">
                                <div class="product-name">내 장바구니</div> 
                            </div>
                            <div class="solid"></div>
                            <div class="inner-content">
                                <div class="content-wrap">
                                    <div class="inner-btn">
                                        <input type="checkbox" class="custom-btn">
                                    </div>
                                </div>
                                <div class="product-info">
                                    <div class="thumbnail">
                                        <img src="https://d38cxpfv0ljg7q.cloudfront.net/admin_contents/thumbnail/ASey-1659682487252-krate_Thumb.jpg" width="53" height="68" alt="해당상품명"> <!-- 상품img-->
                                    </div>
                                    <div class="product-name">
                                            <%= c.getProName() %> <!-- 상품명 불러오기-->
                                    </div>
                                    <div>
                                        <!-- <input type="checkbox" class="product-remove-btn"> 개별 삭제하기 버튼은 지우는 것이 깔끔한 것 같다. -->
                                    </div>
                                </div>
                            </div>
                            <div class="inner-bottom">

                                <div class="amount-control">
                                    <div class="decrease"><button type="button">-</button></div>    <!-- 수량 감소 버튼 마이너스로 내려가지않도록...-->
                                    <div class="amount"><input type="number" id="amount" name="orderCount" pattern="\d*" maxlength="3" value="<%= c.getOrderCount() %>"></div>
                                    <div class="increase"><button type="button">+</button></div>    <!-- 수량 증가 버튼-->
                                </div>

                                <script>
                                    $(function(){
                                        $('.increase').click(function(){
                                            var amount= $('#amount').val();
                                            amount++;
                                            $('#amount').val(amount);
                                            var discount = $('#price').html();
                                            // console.log($('#price').html());
                                            var count = $('#amount').val();
                                            // console.log(count);
                                            var sum = discount * count;
                                            // console.log(sum);
                                            $('#discount').text(sum);
                                            $('#price1').text(sum);
                                            $('#billPrice').text(sum);
                                            $('#finalPrice').text(sum + 3000);
                                        })
                                        $('.decrease').click(function(){
                                            
                                            if($('#amount').val() > 1){
                                                var amount = $('#amount').val();
                                                amount--;
                                                $('#amount').val(amount);
                                                var totalPrice = $('#discount').html();
                                                var originPrice = $('#price').html();
                                                var result = totalPrice - originPrice;
                                                //console.log(result);
                                                $('#discount').text(result);
                                                $('#price1').text(result);
                                                $('#billPrice').text(result);
                                                $('#finalPrice').text(result + 3000);
                                            }
                                        })

                                        
                                    })

                                </script>

                                <div class="price">
                                    <div class="discount" id="discount"><%= c.getProPrice() %></div>
                                </div>
                            </div>

                            <div class="inner-footer">
                                <div class="frow footer-price">
                                    <div class="title">상품금액</div>
                                    <div id="price" class="price" style="font-weight: 500;"><%= c.getProPrice() %></div>  <!--개별 상품 가격 SQL-->
                                </div> 
                                <div class="frow footer-discount">
                                    <div class="title">즉시할인금액</div>
                                    <div class="price">0 원</div> <!--0원 고정-->
                                </div>
                                <div class="frow footer-deliveryprice">
                                </div>
                                <div class="frow footer-totalprice">
                                    <div class="title-total" style="font-weight: bold;">총 금액</div>
                                    <div class="price-total" id="price1" style="font-size: 16px; font-weight: bold; color:rgb(0, 151, 243) "><%= c.getProPrice() %></div> 
                                </div>
                            </div>
                        </div>
                    
                <% } %>
            <%}%>
            <!-- 포문 끝 -->

        </div>
        
        <div class="bill-main">
            <div class="bill">
                <div class="btitle">계산서</div>
                <div class="solid-top"></div>
                <div class="bill-content">
                    <div class="row">
                        <div>총 상품금액</div>
                        <div class="price" id="billPrice"></div>    <!-- 장바구니에 상품이 여러 개라면 각 제품들 가격의 총 합-->
                    </div>
                    <div class="row">
                        <div>총 할인 금액</div>
                        <div class="price">0원</div>    <!-- 0원 고정-->
                    </div>
                    <div class="row">
                        <div>배송비</div>
                        <div class="price" id="deliveryFee">3000원</div>    <!-- 3000원 고정-->
                    </div>
                    <div class="info">
                        <div>*제주도 및 도서산간의 경우 배송비가 추가될 수 있습니다.</div>
                    </div>
                </div>
                <div class="solid-bottom"></div>
                <div class="bill-footer">
                    <div style="font-size: 13px;">총 결제 예상 금액</div>
                    <div class="price-total" id="finalPrice" style="font-size: 16px; color:rgb(0, 151, 243)"></div>  <!-- 총 상품들의 가격의 합 + 배송비 3000원-->
                </div>
            </div>
            <div class="bill-btn-wrap">
                <button type="submit" class="buy-btn" style="outline: none; cursor:pointer">구매하기</button> <!-- 구매하기 버튼을 누르면 주문페이지로 이동-->
            </div>

        </div>
    </form>
    </div>
    <%@include file="../common/footer.jsp" %>





    <script>
        function checkedAll(){
            // $('.custom-btn').val();
            // console.log( $('.custom-btn').val());
            if($('.custom-btn').is(':checked')){
                $('.custom-btn').prop('checked', false);
            }
            else {
                $('.custom-btn').prop('checked', true);
            }
        }


    </script>
</body>
</html>