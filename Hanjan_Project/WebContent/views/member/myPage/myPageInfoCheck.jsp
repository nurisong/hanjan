<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .checkPwd-area{
        margin: auto;
        margin-bottom: 50px;

        width: 450px;
        border-radius: 10px;
        padding: 40px 50px 30px;

        display: flex;
        flex-direction: column;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
    }
    .checkPwd-area div{
        height: 70px;
        /* border: 1px solid palevioletred; */
        align-items: center;
    }
    .checkPwd-area input {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        font-family: 'Pretendard-Regular';
        font-size: 16px;
        padding: 10px;
        box-sizing: border-box;
    }
    .checkPwd-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 250px;
        height: 50px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    #main-text {
        margin: 50px;
        font-size: 27px;
    }
    button {
        cursor: pointer;
    }
    #click-info{
        color: rgb(255, 175, 188);
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <%@ include file="myPageTopbar.jsp" %>
        
        <div class="main-area">
            <div id="title">회원 정보 관리</div>
            <div id="title-line"><hr></div>

            <div class="checkPwd-area">
                <h1 id="main-text">본인 확인</h1>
                <div align="center">
                    개인정보 수정을 위해서는 본인 확인이 필요합니다. <br>
                    비밀번호를 다시 한번 입력해주세요.
                </div>

                <form action="<%= contextPath %>/checkPwd.me" method="post">
                    <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                    <div><input type="password" name="checkPwd" placeholder="비밀번호를 입력해주세요."></div>
                    <div><button type="submit">확인</button></div>
                </form>
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>