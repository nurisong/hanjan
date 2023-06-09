<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바(검색X)</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/menubar.css">
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
        position: sticky;
        padding: 18px 69px;
        z-index: 999;
        background-color: white;
        border-bottom: 2px solid rgb(224, 224, 224);
    }
    .header-inner{
        width: 100%;
        max-width: 1144px;
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
        margin-right: 30px;
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

    .search-form{
        min-width: 180px;
        max-width: 230px;
        height: 40px;
        padding-left: 15px;
        background-color: rgb(247, 247, 247);
        border-radius: 10px;
    }

    .inner{
        max-width: 200px;
        height: 100%;
        display: flex;
        align-items: center;
    }
    .search-text{
        color: rgb(178, 178, 178);
        font-size: 14px;
        line-height: 14px;
        font-weight: 400;
        margin-left: 10px;
        margin-top: 1px;
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
                        <img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e16900cf-06ee-4f69-8301-b2c0e5e3b961/mainLogo.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221130%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221130T011237Z&X-Amz-Expires=86400&X-Amz-Signature=fef44320e83f560366bc61d47ef3859adfbd6914963ba32291da4c59a34fa99b&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22mainLogo.png%22&x-id=GetObject" width="85" height="25">
                    </div>
                </div>
                <ul class="landing-list">
                    <li>구독서비스</li>
                    <li style="color: rgb(255, 175, 188);">술렁마켓(스토어)</li>
                    
                </ul>
            </section>

            <section class="user-menu">
                <ul class="user-list">
                    <!-- 로그인 XXX 시작-->
                    <!-- <li class="login">로그인</li> -->
                    <!-- 로그인 XXX 끝-->

                    <!-- 로그인 되어있을때 시작 -->
                    
                    <li class="username">킹호님 ></li>
                    <li></li>
                    <li class="logout">로그아웃</li>
                    <div class="basket-icon">
                        <div class="basket-icon">
                            <img src="https://www.sooldamhwa.com/images/modules/damhwaMarket/basketIcon.png" alt="" width="28" height="28" >
                        </div>
                     <!-- 로그인 되어있을때 끝 -->
                </ul>
                </div>
            </section>
        </div>
    </div>
</body>
</html>