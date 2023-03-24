<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<style>
    .outer {
        background-color: rgb(244, 244, 244);
        /* height: 800px; */
        padding: 100px 0px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .find-pwd-area{
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        width: 450px;
        height: 570px;
        border-radius: 10px;
        padding: 80px 50px;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .find-pwd-area div{
        /* height: 70px; */
        /* border: 1px solid palevioletred; */
        margin: 40px;
    }
    #main-text {
        /* margin: 50px; */
        font-size: 27px;
    }
    #find-pwd {
        font-size: 25px;
        font-weight: bold;
        color: RGB(63,72,107);
        /* margin-bottom: 20px; */
    }
    .find-pwd-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 200px;
        height: 50px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .find-pwd-area button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }

    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        
        <div class="find-pwd-area">

            <h1 id="main-text">비밀번호 찾기</h1>
            <div>비밀번호 변경이 완료되었습니다. </div>

            <div><button onclick="loginPage();">로그인하기</button></div>

            <script>
                function loginPage() {
                    location.href = "<%= contextPath %>/loginPage.me"
                }
            </script>
            <!-- <div><a href="" id="find-pwd">비밀번호 찾기</a></div> -->
            <!-- <div></div> -->
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>