<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지_구독조회화면3</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage_sub_productIntoView_3.css">
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
                                <span>구독 해지 되었습니다</span><br>
                                다른 상품도 둘러보세요.
                            </div>
                            <div class="progress-label">
                                <span>술잔이 비었네요.. &#128546;</span>
                            </div>
                            
                            <div class="sub-deliveryWrapper">
                                <div class="delivery-info-member">
                                    <div class="text bold mname"></div>
                                </div>
                               
                                <div class="delivery-info-buttonWrapper">
                                    <button id="gogogoShop" class="sub-app-button2">상품 둘러보기</button>
                                    <button id="gogogoSub" class="sub-app-button2">구독 둘러보기</button>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		
			$('#gogogoShop').click(function(){
				
				location.href = '<%= contextPath %>/userProductMarket.pro';
				
			})
			
			$('#gogogoSub').click(function(){
				
				location.href = '<%= contextPath %>/userSubscribe';
				
			})
    		
    		
    		
    	})
    
    
    </script>
    

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>