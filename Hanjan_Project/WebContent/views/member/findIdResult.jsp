<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String findId = (String)request.getAttribute("findId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<style>
    *>a {
        text-decoration: none;
        color: rgb(47, 54, 82);
    }
    .outer {
        background-color: rgb(244, 244, 244);
        /* height: 800px; */
        padding: 100px 0px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .find-id-area{
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        height: 570px;
        width: 450px;
        border-radius: 10px;
        padding: 80px 50px;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .find-id-area div{
        /* height: 70px; */
        /* border: 1px solid palevioletred; */
        margin: 20px;
    }
    #main-text {
        /* margin: 50px; */
        font-size: 27px;
    }
    #find-id {
        font-size: 25px;
        font-weight: bold;
        color: RGB(63,72,107);
        /* margin-bottom: 20px; */
    }
    .find-id-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 200px;
        height: 40px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .find-id-area button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }

    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        
        <div class="find-id-area">

            <h1 id="main-text">아이디 찾기</h1>
            <% if (findId == null ) { %>
                <div>조회된 아이디가 없습니다.</div>
            <% } else { %>
                <div>고객님의 정보와 일치하는 아이디입니다. </div>
                <div id="find-id"><%= findId %></div>
            <% } %>

            <div><button onclick="loginPage();">로그인하기</button></div>
            <div><a href="<%= contextPath %>/findPwdPage.me" id="find-pwd">비밀번호 찾기</a></div>

            <script>
                function loginPage() {
                    location.href = "<%= contextPath %>/loginPage.me";
                }
            </script>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>