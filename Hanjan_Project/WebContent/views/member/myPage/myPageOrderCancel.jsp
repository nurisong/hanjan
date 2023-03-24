<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderCancel</title>

<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">

<style>
    .cancel-header{
        height: 4px;
        padding: 10px 50px 0px;
    }
    .title {
        
        justify-content: center;
        align-items: center;
        
    }
    .cancel-history{
        margin-top: 20px;
        text-align: center;
    }
    .cancel-historyWrap{
        display: flex;
        flex-direction: column;
        justify-content: center;
        font-size: 13;
        font-weight: 700;
        border-radius: 10px;
        height: 313px;
    }
</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>


    <div class="outer">
        <div class="top-bar">
            <div class="inline-block">
                <div id="name-area" style="cursor: default;"><span id="userName">000</span> 님</div>
                <div>
                    <div id="point-text">적립금</div>
                    <div id="point"><%= loginUser.getPoint() %></div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a href="http://localhost:8888/hanjan/views/member/myPage/myPageSub.jsp">구독관리</a></li>
                    <li><a id="click" href="http://localhost:8888/hanjan/views/member/myPage/myPageOrder.jsp">주문내역</a></li>
                    <li><a href="http://localhost:8888/hanjan/views/member/myPage/myPageShip.jsp">배송지</a></li>
                    <li><a href="http://localhost:8888/hanjan/views/member/myPage/myPageInfo.jsp">회원정보</a></li>
                    <li><a href="http://localhost:8888/hanjan/views/member/myPage/myPageQa.jsp">문의내역</a></li>
                    <li><a href="http://localhost:8888/hanjan/views/member/myPage/myPageBoard.jsp">게시글</a></li>
                </ul>
            </div>
        </div>

        <div class="main-area">
            <div class="cancel-header">
                <div class="title" style="font-weight: bold; margin-right: auto;">
                    <div>취소 / 환불 내역</div>
                    <!-- <hr width="1100"> -->
                </div>
            </div>
            
            <div class="cancel-history">
                <div class="cancel-historyWrap">
                    <div>취소 / 환불한 상품이 없어요 :(</div>
                </div>
            </div>







        </div>











    </div>

</body>
</html>