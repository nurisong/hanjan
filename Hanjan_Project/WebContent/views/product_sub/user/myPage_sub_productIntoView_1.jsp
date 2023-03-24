<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription, com.hj.member.model.vo.Shipment, java.util.ArrayList" %>    
<%
	
	ArrayList<Subscription> mypageSubList = (ArrayList<Subscription>)request.getAttribute("mypageSubList");
	Shipment mypageShip = (Shipment)request.getAttribute("mypageShip");
	int userNo = (int)request.getAttribute("userNo");
    
	
	String interest = "";
	for ( Subscription s : mypageSubList) {
		if (mypageSubList != null) {
			interest = String.join(",", s.getSubscriptName());
		}
	}
	
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지_구독조회화면1</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage_sub_productIntoView_1.css">
<style>
    #click-sub{
        color: rgb(255, 175, 188);
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <%@ include file="../../member/myPage/myPageTopbar.jsp" %>

        <div class="main-area">
            <div id="title">구독 관리</div>
                <div id="title-line"><hr></div>
                    <div class="sub-app-contentWrapper">
                        <div class="app-wrapper">
                            <div class="app-title">
                            <% if (mypageSubList.isEmpty()) { %>
                            	<span>구독중인 상품이 없어요</span>
                            <% } else {%>
                            	현재 구독중인 상품은 총 <span> <%= mypageSubList.size() %></span>개 입니다<br>
                            <% } %>
                            <% for (Subscription s : mypageSubList) { %>
                            	<span><%= s.getSubscriptName() %></span>
                            <% } %>
                            </div>
                            <div class="progress-label">
                                <span>상품은 매월 17일에 배송돼요</span>
                            </div>
                            
                            <div class="sub-deliveryWrapper">
                                <div class="delivery-info-member">
                                    <div class="delivery-default">현재 구독중인 배송지</div>
                                    <div class="text bold mname"><%= mypageShip.getRecipient()  %></div>
                                    <div class="text"><%= mypageShip.getPhone() %></div>
                                    <div class="text"><%= mypageShip.getAddress() %></div>
                                    <div class="member-Price">구독정보</div>
                                </div>
                                <% for (Subscription sub : mypageSubList ) { %>
                                <div class="delivery-info-box">
                                    <img class="delivery-img" src="	https://d38cxpfv0ljg7q.cloudfront.net/icon-damhwabox-pc.png" alt="">
                                    <div class="right-text-wrapper">
                                        <div class="text first">
                                            <span><%= sub.getSubscriptName() %>(<%= sub.getSubscriptPrice() %>원)</span>
                                            매월 1박스
                                        </div>
                                        <div class="text">
                                            <button id="insertRev" onclick="location.href='<%=contextPath %>/enrollForm.rs?sProNo=<%=sub.getSubscriptNo()%>'" class="sub-app-button2" 
                                                style="border-radius:3px; font-size:13px; width:55px; height:18px; margin:0px; margin-right:15px;">구독리뷰</button>
                                            매월 <%= sub.getSubscriptPrice() %>원
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <% } %>
                                <div class="delivery-info-buttonWrapper">
                                    <button id="updateSubShip" class="sub-app-button2">배송지 수정</button>
                                    <button id="deleteSub" class="sub-app-button">구독 해지하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
           		 </div>
   		    </div>
    </div>
    <script>
    	$(function(){
    		
    		$('#updateSubShip').click(function(){
				
				location.href = '<%= contextPath %>/updateShipForm.me?sno=' + <%= mypageShip.getShipNo() %>;
                console.log('<%= mypageShip.getShipNo() %>');
				
			});
			
			$('#deleteSub').click(function(){
				
				location.href = '<%= contextPath %>/deleteSub.me?userNo=' + <%= userNo %>;
				
			});

    	})
    </script>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>