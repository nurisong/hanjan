<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userNo = String.valueOf(request.getAttribute("userNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
    *>a{
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
        margin: 10px;
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
        /* margin: 50px; */
        font-size: 27px;
        margin-bottom: 30px;
    }
    #find-id {
        font-size: 25px;
        font-weight: bold;
        color: RGB(63,72,107);
        /* margin-bottom: 20px; */
    }
    .find-pwd-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 250px;
        height: 40px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
        margin-bottom: 20px;
    }
    .find-pwd-area button:hover {
        cursor: pointer;
    }
    .checkResult {
        height: 5px;
        font-size: 13px;
        margin-left: 10px;
        color: rgb(47, 54, 82);
     }

    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        
        <div class="find-pwd-area">

            <form action="<%= contextPath %>/updatePwd.me" method="post" class="find-pwd-form">
                
                <input type="hidden" name="userNo" value="<%= userNo %>">
                
                <h1 id="main-text">비밀번호 재설정</h1>
                <div>
                    <div>새로운 비밀번호</div>
                    <div><input type="password" name="newPwd" id="newPwd" placeholder="8~15자 (영문/숫자/특수문자)"></div>
                    <label class="checkResult" id="pwdCheck">&nbsp;</label>
                </div>
                <div>
                    <div>비밀번호 확인</div>
                    <div><input type="password" id="newPwd2" placeholder="비밀번호를 한번 더 입력해주세요"></div>
                    <label class="checkResult"  id="pwdCheck2">&nbsp;</label>
                </div>
                <div><button type="submit">비밀번호 재설정</button></div>

                <script>
                    $('#newPwd').focusout(function(){
                            var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
                            var $checkPwd = $('#newPwd').val();

                            if($checkPwd=="") {
                                $('#pwdCheck').html('필수 입력사항입니다.');
                                $togglePwd = 0;

                            } else if(!regExp.test($checkPwd)) {
                                $('#pwdCheck').html('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
                                $togglePwd = 0;
                            } else {
                                $('#pwdCheck').html('');
                                $togglePwd = 1;
                            }
                            judgeBtn()
                        });

                    $('#newPwd2').focusout(function(){
                            var $checkPwd = $('#newPwd').val();
                            var $checkPwd2 = $('#newPwd2').val();

                            if($checkPwd2=="") {
                                $('#pwdCheck2').html('필수 입력사항입니다.');
                                $('#pwdCheck2').css('color','rgb(47, 54, 82)');

                            } else if(!($checkPwd2==$checkPwd)) {
                                $('#pwdCheck2').html('비밀번호가 일치하지 않습니다.');
                                $('#pwdCheck2').css('color','red');
                            } else {
                                $('#pwdCheck2').html('');
                            }
                        });
                </script>

                <div>
                    <div><a href="<%= contextPath %>/loginPage.me">로그인</a></div>
                    <!-- <div><a href="<%= contextPath %>/findIdPage.me" id="find-pwd">아이디 찾기</a></div> -->
                </div>
            </form>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>