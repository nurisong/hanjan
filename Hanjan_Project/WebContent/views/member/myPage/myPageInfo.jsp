<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .info-area {
        margin-top: 30px;
    }
    #info-form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        height: 750px;
        margin-bottom: 30px;
        margin-top: 80px;
    }
    #info-form input {
        height: 40px;
        width: 350px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        font-size: 15px;
    }
    #info-form>div{
        height: 300px;
    }
    .info-area button {
        font-family: 'Pretendard-Regular';
        font-size: 15px;
        background-color: RGB(63,72,107);
        color: white;
        /* width: 200px; */
        height: 40px;
        width: 77px;
        border-radius: 5px;
        border: none;
     }
    #info-text{
        margin-bottom: 60px;
        font-size: 30px;
    }
    #info-btn {
        margin-top: 50px;
        margin-bottom: 20px;
        font-size: 20px;
        width: 200px;
        height: 50px;
    }
    .info-area button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }
    #delete-btn > a{
        float: right;
        margin-right: 20px;
        color: rgb(113, 113, 113);
        margin-top: 10px;
        margin-bottom: 30px;
    }
    .checkResult {
        height: 5px;
        font-size: 13px;
        margin-left: 10px;
        color: rgb(47, 54, 82);
    }
    #emailForm {
        font-family: 'Pretendard-Regular';
        width: 110px;
        height: 40px;
        padding: 5px;
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
            <div class="info-area">
                <form action="<%= contextPath %>/update.me" method="post" id="info-form">

                    <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">

                    <div>
                        <div>아이디</div>
                        <div><input type="text" id="userId" name="userId" value="<%= loginUser.getUserId() %>" maxlength="12" required readonly></div>
                        <!-- <td><button type="button" id="idCheck-btn">중복확인</button></td> -->
                        <label class="checkResult" id="idCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div>비밀번호</div>
                        <div><input type="password" name="userPwd" id="userPwd" maxlength="15" placeholder="비밀번호 수정시 입력해주세요"></div>
                        <label class="checkResult" id="pwdCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div>비밀번호 확인</div>
                        <div><input type="password" id="userPwd2" maxlength="15" disabled></div>
                        <label class="checkResult" id="pwdCheck2">&nbsp;</label>
                    </div>

                    <div>
                        <div>이름</div>
                        <div><input type="text" name="userName" id="userName2" value="<%= loginUser.getUserName() %>" maxlength="5" required placeholder="이름을 입력해주세요"></div>
                        <label class="checkResult" id="nameCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div>휴대전화</div>
                        <div style="display: inline-block;"><input type="text" name="phone" value="<%= loginUser.getPhone() %>" maxlength="13" required value="<%= loginUser.getPhone() %>" oninput="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="-를 포함해서 입력해주세요" style="width: 270px;"></div>
                        <!-- <div style="display: inline-block;"><input type="text" name="phone" maxlength="13" oninput="this.value=this.value.replace(/^01[016789]-\d{3,4}-\d{4}$/g,'');" placeholder="-를 포함해서 입력해주세요" style="width: 223px;"></div> -->
                        <div style="display: inline-block;"><button type="button" onclick="phoneCheck();">본인인증</button></div>
                        <div><label>&nbsp;</label></div>
                    </div>

                    <div>
                        <div>이메일</div>
                        <div>
                            <input type="text" name="email" value="<%= loginUser.getEmail() %>" required style="width: 110px;"> @ 
                            <input type="text" name="emailSite" id="emailSite" value="<%= loginUser.getEmailSite() %>" required style="width: 110px;" disabled>
                            <select id="emailForm" name="emailForm" onchange="emailCheck()">
                                <option value="선택하세요" >선택하세요</option>
                                <option value="직접입력" >직접입력</option>
                                <option value="naver.com" >naver.com</option>
                                <option value="hanmail.net" >hanmail.net</option>
                                <option value="daum.net" >daum.net</option>
                                <option value="nate.com" >nate.com</option>
                                <option value="gmail.com" >gmail.com</option>
                            </select>
                        </div>
                    </div>

                    <div align="center">
                        <div><button type="submit" id="info-btn" style="margin-top: 0px;">수정하기</button></div>
                    </div>
                </form>

                <div><hr></div>
                <div id="delete-btn"><a href="<%= contextPath %>/checkPwdForm.me">탈퇴하기</a></div>
            </div>
        </div>

    </div>

    <script>
        // 비밀번호 유효성 검사
        $('#userPwd').focusout(function(){
            var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
            var $checkPwd = $('#userPwd').val();

            if($checkPwd=="") {
                // 비밀번호 입력된거 지우면 -> input태그 1,2랑 라벨 입력값 날리고, disabled로
                $('#pwdCheck').html('&nbsp;');
                $('#pwdCheck2').html('&nbsp;');
                $('#userPwd2').val('')
                $('#userPwd2').attr('disabled', true);
                $('#userPwd2').attr('placeholder', '');
            } else if(!regExp.test($checkPwd)) {
                $('#userPwd2').attr('disabled', false);
                $('#userPwd2').attr('placeholder', '비밀번호를 한번 더 입력해주세요');
                $('#pwdCheck').html('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
                $togglePwd = 0;
            } else {
                $('#userPwd2').attr('disabled', false);
                $('#userPwd2').attr('placeholder', '비밀번호를 한번 더 입력해주세요');
            }
        });

        // 비밀번호 일치 검사
        $('#userPwd2').focusout(function(){
            var $checkPwd = $('#userPwd').val();
            var $checkPwd2 = $('#userPwd2').val();

            // 비밀번호 수정시에만 체크
            if($checkPwd != '') {
                $('#userPwd2').attr('disabled', false);

                if($checkPwd2=="") {
                    $('#pwdCheck2').html('필수 입력사항입니다.');
                    $('#pwdCheck2').css('color','rgb(47, 54, 82)');
                    
                } else if(!($checkPwd2==$checkPwd)) {
                    $('#pwdCheck2').html('비밀번호가 일치하지 않습니다.');
                    $('#pwdCheck2').css('color','red');
                }
            }
        });

        // 이름 유효성 검사
        $('#userName2').focusout(function(){
            var regExp = /^[가-힣]{2,}$/;
            var $userName = $('#userName2').val();

            if($userName=="") {
                $('#nameCheck').html('필수 입력사항입니다.');
            } else if (!regExp.test($userName)) {
                $('#nameCheck').html('이름을 다시 입력해주세요.');
            } else {
                $('#nameCheck').html('');
            }
            // judgeBtn()
        });

        // 이메일
        function emailCheck() {
            // console.log($('#emailForm option:selected').val());
            if($('#emailForm option:selected').val() == "선택하세요") {
                $('#emailSite').attr('disabled', true);
                $('#emailSite').val('');
            }

            if($('#emailForm option:selected').val() == "직접입력") {
                $('#emailSite').attr('disabled', false);
                $('#emailSite').val('');
                $('#email').focus();
            } else {
                $('#emailSite').attr('disabled', true);
                $('#emailSite').val($('#emailForm').val());
                console.log($('#emailSite').val());
            }
        }
    </script>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>