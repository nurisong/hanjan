<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
    .find-pwd-area{
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        width: 450px;
        height: 570px;
        border-radius: 10px;
        padding: 80px 50px;
    }
    .find-pwd-form{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .find-pwd-form>div{
        margin: 20px;
    }
    .find-pwd-area input {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
		margin-top: 8px;
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        text-align: center;
    }
    #main-text {
        font-size: 27px;
    }
    .find-pwd-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 250px;
        height: 40px;
        border-radius: 5px;
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

            <form action="<%= contextPath %>/findId.me" method="post" class="find-pwd-form">
                <h1 id="main-text">아이디 찾기</h1>
                <div>
                    <div>이름</div>
                    <div><input type="text" name="findName" placeholder="이름을 입력해주세요"></div>
                </div>
                <div>
                    <div>휴대전화</div>
                    <div><input type="text" name="findPhone" placeholder="-를 포함해서 입력해주세요"></div>
                </div>
                <div><button type="submit">아이디 찾기</button></div>

                <div>
                    <div><a href="<%= contextPath %>/loginPage.me">로그인</a></div>
                    <div><a href="<%= contextPath%>/findPwdPage.me" id="find-pwd">비밀번호 찾기</a></div>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>