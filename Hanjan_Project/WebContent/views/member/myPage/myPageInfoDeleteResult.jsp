<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 완료</title>
<style>
    .outer {
        background-color: rgb(244, 244, 244);
        height: 700px;
        /* padding: 100px 0px; */

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .result-area{
        margin: auto;
        padding: 140px;
        width: 850px;
        height: 600px;

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
        width: 250px;
        height: 50px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .result-area button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }
    #link-area {
        margin-top: 20px;
    }
    #result-text {
        margin: 50px 0px;
        font-size: 30px;
        color: rgb(47, 54, 82);
    }
    #result-content {
        margin-bottom: 50px;
    }
    #click-info{
        color: rgb(255, 175, 188);
    }
</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

    <div class="outer" align="center">
        
        <div class="result-area">
            <h1 id="result-text">회원 탈퇴가 완료되었습니다.</h1>
            <div id="result-content">그동안 저희 술렁술렁을 사랑해주셔서 감사합니다.</div>
            <button onclick="mainPage();">메인으로</button>
        </div>
    </div>

    <script>
        function mainPage() {
            location.href="<%= contextPath %>";
        }
    </script>

    <%@ include file="../../common/footer.jsp" %>

</body>
</html>