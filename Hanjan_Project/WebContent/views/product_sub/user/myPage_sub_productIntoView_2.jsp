<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription, java.util.ArrayList" %>    
<%
	
	ArrayList<Subscription> mypageSubList = (ArrayList<Subscription>)request.getAttribute("mypageSubList");
	int userNo = (int)request.getAttribute("userNo");
	
%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지_구독조회화면2</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage_sub_productIntoView_2.css">
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
                <form action="<%= contextPath %>/deleteSub.me/result">
                    <div class="sub-app-contentWrapper">
                        <div class="app-wrapper">
                            <div class="app-title">
                                <span>어떤 구독을</span><br>
                                해지 하시겠어요?
                            </div>
                            <div class="progress-label">
                                <span>해지해도 이번달까진 함께해요</span>
                            </div>
                            
                            <div class="sub-deliveryWrapper">
                                <% for (Subscription sub: mypageSubList) { %>
	                                <div class="delivery-info-box">
	                                    <img class="delivery-img" src="	https://d38cxpfv0ljg7q.cloudfront.net/icon-damhwabox-pc.png" alt="">
	                                    <div class="right-text-wrapper">
	                                        <div class="text first">
	                                            <span><%= sub.getSubscriptName() %>(<%= sub.getSubscriptPrice() %>원)</span>
                                           		 매월 1박스
	                                        </div>
	                                        <div class="text">
                                           		 매월 <%= sub.getSubscriptPrice() %>원
	                                        </div>
	                                    </div>
	                                </div>
								<div class="unsubscribe"><%= sub.getSubscriptName() %><input type="radio" name="subscribe" value="<%= sub.getSubscriptNo() %>"></div>
                                <% } %>
								<input type="hidden" name="userNo" value="<%= userNo %>">
                                <div class="delivery-info-buttonWrapper">
                                    <button id="subDelete" type="submit" class="sub-app-button2">구독 해지하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
    
    	$(function(){
    		
    		
    		$('#subDelete').click(function(){
    			
    			if ($('input[type=radio]').is(':checked') == false){
    				alert('해지할 구독을 선택해주세요')
    				return false;	
    			}
    				return true;
    		})			
    		
    	})
    
    </script>
    

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>