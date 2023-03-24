<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600;700&display=swap" rel="stylesheet">
       

<style>
    
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    
    div{
        box-sizing: border-box;
    }
    .header{
        width: 100%;
        max-height: 80px;
        margin: 0px auto;
        padding: 18px 69px 18px 55px;
        position: sticky;
        z-index: 999;
        background-color: white;
        border-bottom: 2px solid rgb(224, 224, 224);
    }
    .header-inner{
        width: 98%;
        /* max-width: 1144px; */
        height: 44px;
        margin: 0px auto;
        display: flex;
        justify-content: space-between;
    }
    .navigation-menu{
        width: 100%;
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    .user-menu{
        margin-left: 5px;
        width: 100%;
        min-width: 200px;
        max-width: 300px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    .logo{
        padding: 0px;
        /* margin-right: 30px; */
    }

    .landing-list{
        width: 100%;
        margin: 0px;
        padding: 0px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        font-family: 'Pretendard-Regular';
        font-weight: 700;
        transform : rotate(0.04deg);
    }

    .landing-list li{
        cursor: pointer;
        display: block;
        font-size: 16px;
        font-weight: bold;
        color: rgb(112, 112, 112);
        margin-right: 20px;
        white-space: nowrap;
    }

    .inner{
        max-width: 200px;
        height: 100%;
        display: flex;
        align-items: center;
    }
    
    .user-list{
        width: 100%;
        margin: 0px;
        padding: 0px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        font-family: 'Pretendard-Regular';
        font-weight: 400;
        font-style: normal;
    }

    .user-list li{
        cursor: pointer;
        display: block;
        font-size: 14px;
        font-weight: bold;
        line-height: 18px;
        padding-right: 10px;
        white-space: nowrap;
    }
    
    .username{
        text-align: right;
        min-width: 10ch;
        overflow: hidden;
        color: rgb(63, 72, 107);
        text-overflow: ellipsis;
        padding-right: 0px;
    }
    

    .user-menu .user-list li.logout{
        color: rgb(178, 178, 178);
    }

    .user-menu .user-list li.login{
        color: rgb(63, 72, 107);
    }

    .basket-icon{
        cursor: pointer;
    }

    .login{
        font-family: 'Pretendard-Regular';
        font-style: normal;
    }
</style>
</head>
<body>
    <div class="header">
        <div class="header-inner">
            <section class="navigation-menu">
                <div class="logo">
                    <div>
                        <!-- 로고 이미지-->
                        <img src="<%=contextPath %>/resources/mainLogo2.png" width="120">
                    </div>
                </div>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    <li class="username" onclick="location.href='<%= contextPath %>';">메인 페이지로 ></li>
                    <li></li>
                    <li class="logout" onclick="logout();">로그아웃</li>
                </ul>
                </div>
            </section>
            <script>
                function logout() {
                    location.href = "<%= contextPath %>/logout.me";
                }
            </script>
        </div>
    </div>
</body>
</html>