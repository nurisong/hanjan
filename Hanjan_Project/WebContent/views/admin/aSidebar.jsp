<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 사이드바</title>
<style>
    body{
        height: 1200px;
        width: 1880px;
    }
    * > a {
        text-decoration: none;
        color: white;
    }
    #logo-area {
        margin-bottom: 50px;
    }
    #logo-area img {
        width: 190px;
    }
    #side-outer{
        background : rgb(47, 54, 82);
        width : 250px;
        /* width : 20%; */
        padding : 30px;
        padding-bottom: 30px;
        height : 1200px;
        display: inline-block;
        position: static;
    }
    .side-title{
        font-size : 25px;
        font-family: 'Pretendard-Regular';
        margin-bottom: 30px;
    }
    .side-main{
        width: 300px;
        height: 40px;
        line-height: 40px;
        border-radius: 10px;
        padding: 8px;
        color: white;
        margin-bottom: 30px;
    }
    .side-detail{
        display : block;
        width: 150px;
        text-decoration: none;
        font-family: 'Pretendard-Regular';
        font-size: 18px;
    }
    .side-img{
        width : 30px;
        height : 30px;
        padding-top : 0px;
    }
    .side-list{
        list-style-type : none;
        margin : 30px;
        padding: 0px;
    }
    .side-list>li{
        padding : 3px;
        width: 50px;
        height: 22px;
        margin-bottom: 10px;
    }
    .side-list>li>a:hover{
        color : rgb(197, 197, 197);
        font-size : 18px;
    }

    .side-main tr>td:first-child{
        width: 125px;
    }
    .side-main div,img:hover{
        cursor : pointer;
    }


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>

    <%@ include file="aMenubar.jsp" %>

    <div id="side-outer">
        <div id="logo-area">
            <!-- <img src="../../resources/mainLogo.png"> -->
        </div>
        <div class="side-main">
            <table>
                <tr>
                    <td class="side-title"><div>상품 관리</div></td>
                    <td ><img align="center" class="side-img" src="<%=contextPath %>/resources/pngwing.com.png" alt=""></td>
                </tr>
            </table>
        </div>
        <ul class="side-list">
            <li>
            <a href="<%=contextPath %>/plist.pro" class="side-detail">상품관리</a>
            </li>
            <li>
                <a href="<%=contextPath %>/slist.sub" class="side-detail">구독상품관리</a>
            </li>
            <li>
                <a href="<%= contextPath %>/StockList.do?cpage=1" class="side-detail">재고현황관리</a>
            </li>
            <li>
                <a href="<%= contextPath %>/SoldOut.do?cpage=1" class="side-detail">품절상품조회</a>
            </li>
        </ul>
        
        <div class="side-main">
            <table>
                <tr>
                    <td class="side-title" ><div>회원 관리</div></td>
                    <td ><img align="center" class="side-img" src="<%=contextPath %>/resources/pngwing.com.png" alt=""></td>
                </tr>
            </table>    
        </div>
        <ul class="side-list">
            <li>
                <a href="<%=contextPath %>/MemberManage.do?cpage=1" class="side-detail">회원 조회</a>
            </li>
            <li>
                <a href="<%=contextPath %>/deleteMemberList.do?cpage=1" class="side-detail">탈퇴 회원 조회</a>
            </li>
            <li>
                <a href="#" class="side-detail">회원정보 수정</a>
            </li>
            <li>
                <a href="#" class="side-detail">회원 탈퇴</a>
            </li>
        </ul>
       
        <div class="side-main">
            <table>
                <tr>
                    <td class="side-title" ><div>커뮤니티</div></td>
                    <td ><img align="center" class="side-img" src="<%=contextPath %>/resources/pngwing.com.png" alt=""></td>
                </tr>
            </table>    
        </div>
        <ul class="side-list" id="comm-side">
            <li>
                <a href="<%=contextPath%>/aList.bo?cpage=1" class="side-detail">게시판관리</a>
            </li>
            <li>
                <a href="<%=contextPath%>/aList.rs?cpage=1" class="side-detail">구독후기관리</a>
            </li>
            <li>
                <a href="<%=contextPath%>/aList.rv?cpage=1" class="side-detail">리뷰관리</a>
            </li>
            <li>
                <a href="<%=contextPath%>/aList.no?cpage=1" class="side-detail">공지관리</a>
            </li>
        </ul>
        
        <div class="side-main">
            <table>
                <tr>
                    <td class="side-title" ><div>매출 관리</div></td>
                    <td ><img align="center" class="side-img" src="<%=contextPath %>/resources/pngwing.com.png" alt=""></td>
                </tr>
            </table>    
        </div>
        <ul class="side-list">
            <li>
                <a href="<%= contextPath %>/sales.do" class="side-detail">전체매출조회</a>
            </li>
            <li>
                <a href="#" class="side-detail">일자별매출</a>
            </li>
        </ul>
        
        <div class="side-main">
            <table>
                <tr>
                    <td class="side-title" colspan="2"><div>이미지등록</div></td>
                </tr>
            </table>    
        </div>
    </div>

    <script>
        $(function(){
            $('.side-main').next().slideUp(0);
            $('.side-main').click(function(){
                // console.log($(this));
                var $ul = $(this).next();

                if($ul.css('display') == 'none'){
                    $ul.slideDown(400);
                }
                else{
                    $ul.slideUp(400);
                }
            });
        });
    </script>

</body>
</html>