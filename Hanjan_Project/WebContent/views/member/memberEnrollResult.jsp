<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<style>
    .outer {
        background-color: rgb(244, 244, 244);
        height: 650px;
        /* padding: 100px 0px; */

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .result-area{
        margin: auto;
        width: 770px;
        height: 500px;

        padding: 80px;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        border-radius: 10px;

        font-size: 20px;
    }
    .result-area div{
        height: 70px;
        /* border: 1px solid palevioletred; */
        align-items: center;
    }
    .result-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 150px;
        margin: 10px;
        height: 40px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .result-area button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }
    #result-text {
        font-size: 55px;
        color: rgb(47, 54, 82);
    }
    #result-content {
        margin-bottom: 50px;
        margin-top: 60px;
    }
    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        
        <div class="result-area">
            <h1 id="result-text" style="height: 80px;">환영합니다 :D</h1>
            <div id="result-content">"이제 술 고민은 하지 말아요"</div>
            <button onclick="loginPage();">로그인</button><button onclick="mainPage();">메인으로</button>
        </div>
    </div>

    <script>
        function loginPage() {
            location.href="<%= contextPath %>/loginPage.me";
        };

        function mainPage() {
            location.href="<%= contextPath %>";
        }
    </script>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>