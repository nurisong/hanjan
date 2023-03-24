<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>

</style>
</head>
<body>
        <div class="top-bar">
            <div class="inline-block">
                <div id="name-area" style="cursor: default;"><span id="userName"><%= loginUser.getUserName() %></span> 님</div>
                <div>
                    <div id="point-text">적립금</div>
                    <div id="point"><%= loginUser.getPoint() %></div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a id="click-sub" href="<%= contextPath %>/subLookup.me">구독관리</a></li>
                    <li><a id="click-order" href="<%= contextPath %>/myPageOrder.me">주문내역</a></li>
                    <li><a id="click-ship" href="<%= contextPath %>/myPageShip.me">배송지</a></li>
                    <li><a id="click-info" href="<%= contextPath %>/myPageInfo.me">회원정보</a></li>
                    <li><a id="click-qa" href="<%= contextPath %>/list.qa?cpage=1">문의내역</a></li>
                    <li><a id="click-board" href="<%= contextPath %>/myPageBoard.me">게시글</a></li>
                </ul>
            </div>
        </div>
        
</body>
</html>