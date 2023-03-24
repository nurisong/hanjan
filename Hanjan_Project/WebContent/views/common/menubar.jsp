<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.hj.member.model.vo.Member" %>
<% 
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>

<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/menubar.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js">

</script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600;700&display=swap" rel="stylesheet">
       

<style>
    

</style>
</head>
<body>
    <div class="header">
        <div class="header-inner">
            <section class="navigation-menu">
                <div class="logo">
                    <div>
                        <!-- 로고 이미지-->
                        <img src="<%=contextPath %>/resources/mainLogo2.png" width="85" height="25" onclick="mainPage();">
                    </div>

                    <script>
                        function mainPage() {
                            location.href = "<%= contextPath %>"
                        }
                    </script>
                </div>
                <ul class="landing-list">
                    <li onclick="gosubscribe();" id="sub-menu-click">구독서비스</li>
                    <li class="goStore" onclick="goStore();" id="store-menu-click">술렁마켓(스토어)</li>
                    <li id="community-menu-click" onclick="location.href='<%=contextPath%>/list.bo?cpage=1'">커뮤니티</li>
                    <li class="search-form" style="margin-left: 400px;">
                        <div class="inner">
                            <!-- 돋보기 이미지 -->
                            <img src="https://w7.pngwing.com/pngs/870/689/png-transparent-computer-icons-desktop-illustrations-miscellaneous-glass-desktop-wallpaper.png" alt="" width="16" height="16">
                            <span class="search-text">여기에 검색해보세요.</span>
                        </div>
                    </li>
                </ul>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    <% if(loginUser == null)  { %>
                        <!-- 로그인 XXX 시작-->
                    	<li class="logout" onclick="loginPage();">로그인</li>
	                    <!-- <li class="login">로그인</li> -->
	                    <!-- 로그인 XXX 끝-->

                    <% } else { %>
	                    <!-- 로그인 되어있을때 시작 -->
                        <% if ((loginUser.getUserStatus()).equals("A")) { %>
                            <li class="username" onclick="adminPage();"><%= loginUser.getUserName() %> 페이지 ></li>
                        <% } else { %>
                            <li class="username" onclick="myPage();"> <%= loginUser.getUserName() %> 님 ></li>
                        <% } %>

                    <li></li>
                    <li class="logout" onclick="logout();">로그아웃</li>
                    <div class="basket-icon">
                        <div class="basket-icon">
                            <img onclick="cartList();" src="https://www.sooldamhwa.com/images/modules/damhwaMarket/basketIcon.png" alt="" width="28" height="28" >
                        </div>
                        <!-- 로그인 되어있을때 끝 -->
                        <% } %>
                        
                    <script>
                        function loginPage() {
                            location.href = "<%= contextPath %>/loginPage.me";
                        };

                        function adminPage() {
                            location.href = "<%= contextPath %>/views/admin/aSidebar.jsp";
                        }
						
                        function myPage() {
                            location.href = "<%= contextPath %>/subLookup.me";
                        };
                        

                        function cartList() {
                                location.href = "<%= contextPath %>/cartList.or";
                        };

                        function logout() {
                            location.href = "<%= contextPath %>/logout.me";
                        };
                        
                        function goStore(){
                        	location.href = "<%= contextPath %>/userProductMarket.pro"
                        }
                        
                        function gosubscribe(){
                        	location.href = "<%= contextPath %>/userSubscribe"
                        }
                        // 로그아웃
                        var msg = '<%= alertMsg %>'; // 메시지 문구/null
                        
                        if(msg != 'null') {
                            alert(msg);
                            <% session.removeAttribute("alertMsg"); %> 
                        }
                    </script>
                    <script type="text/javascript">
                    	$(function(){
                    		
                    		$('.search-text').click(function(){
                        		
                        		location.href = '<%= contextPath %>/Search';
                        		
                        	})
                    		
                    	})
                    </script>
                </ul>
                </div>
            </section>
        </div>
    </div>
</body>
</html>