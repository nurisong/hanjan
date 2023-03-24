<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    .outer {
        background-color: rgb(244, 244, 244);
        height: 1200px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .enroll-area {
        background-color: white;

        width: 770px;
        height: 1100px;
        padding: 90px 50px;
        border-radius: 10px;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        display: flex;
        flex-direction: column;
        -webkit-box-pack: center;
        -webkit-box-align: center;
        align-items: center;
    }
    .enroll-form>div {
        margin: 20px;
    }
    .enroll-form input {
        height: 40px;
        width: 400px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        margin-top: 8px;
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        font-size: 15px;
    }
    .enroll-form button {
        font-family: 'Pretendard-Regular';
        font-size: 15px;
        /* background-color: #9b9b9b; */
        background-color: rgb(47, 54, 82);
        color: white;
        /* width: 200px; */
        height: 40px;
        width: 77px;
        border-radius: 5px;
        border: none;
        margin-top: 20px;
     }
    .enroll-form button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }
    #enroll-text{
        /* margin-top: 70px; */
        margin-bottom: 30px;
        font-size: 30px;
    }
    #enroll-btn {
        margin-top: 20px;
        margin-bottom: 50px;
        font-size: 20px;
        width: 300px;
        height: 50px;
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
    #phoneCheck-btn {
        background-color: rgb(47, 54, 82);
        width: 100px;
    }
    #birth-select-area > select {
        font-family: 'Pretendard-Regular';
        height: 40px;
        padding: 5px;
    }
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
  
    <div class="outer">
        
        <div class="enroll-area">

            <h1 align="center" id="enroll-text">회원가입</h1>
    
            <form action="<%= contextPath %>/insert.me" method="post" class="enroll-form">
                    <div>
                        <div>아이디</div>
                        <div><input type="text" id="userId" name="userId" maxlength="12" required placeholder="아이디를 입력해주세요"></div>
                        <label class="checkResult" id="idCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div>비밀번호</div>
                        <div><input type="password" name="userPwd" id="userPwd" maxlength="15" required placeholder="8~15자 (영문/숫자/특수문자)"></div>
                        <label class="checkResult" id="pwdCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div style>비밀번호 확인</div>
                        <div style><input type="password" id="userPwd2" maxlength="15" required placeholder="비밀번호를 한번 더 입력해주세요"></div>
                        <label class="checkResult" id="pwdCheck2">&nbsp;</label>
                    </div>

                    <div>
                        <div>이름</div>
                        <div><input type="text" name="userName" id="userName" maxlength="5" required placeholder="이름을 입력해주세요"></div>
                        <label class="checkResult" id="nameCheck">&nbsp;</label>
                    </div>

                    <div>
                        <div>생년월일</div>
                        <div id="birth-select-area" style="margin-top: 8px;">
                            <select name="yy" id="year" style="width: 150px;"></select>
                            <select name="mm" id="month" style="width: 125px;"></select>
                            <select name="dd" id="day" style="width: 125px;"></select>
                        </div>
                        <div><label class="checkResult" id="birthCheck">&nbsp;</label></div>
                    </div>

                    <div>
                        <div>휴대전화</div>
                        <div style="display: inline-block;"><input type="text"  id="phone" name="phone" maxlength="13" required oninput="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="-를 포함해서 입력해주세요" style="width: 300px;"></div>
                        <!-- <div style="display: inline-block;"><input type="text" name="phone" maxlength="13" oninput="this.value=this.value.replace(/^01[016789]-\d{3,4}-\d{4}$/g,'');" placeholder="-를 포함해서 입력해주세요" style="width: 223px;"></div> -->
                        <div style="display: inline-block;"><button type="button" id="phoneCheck-btn" onclick="alert('인증번호가 발송되었습니다.');">인증번호 발송</button></div>
                        <div><label class="checkResult" id="phoneCheck">&nbsp;</label></div>
                    </div>

                    <div>
                        <div>이메일</div>
                        <div>
                            <input type="text" id="email" name="email" required style="width: 140px;"> @ 
                            <input type="text" name="emailSite" id="emailSite" required style="width: 130px;" disabled>
                            <select id="emailForm" name="emailForm" onchange="emailCheck()">
                                <option value="선택하세요" hidden="" disabled="disabled" selected="selected" >선택하세요</option>
                                <option value="직접입력" >직접입력</option>
                                <option value="naver.com" >naver.com</option>
                                <option value="hanmail.net" >hanmail.net</option>
                                <option value="daum.net" >daum.net</option>
                                <option value="nate.com" >nate.com</option>
                                <option value="gmail.com" >gmail.com</option>
                            </select>
                            <div><label class="checkResult" id="emailCheck">&nbsp;</label></div>
                        </div>
                    </div>

                    <!-- <div>
                        <div>닉네임<span style="color: gray;">&nbsp;(선택)</span></div>
                        <div style="display: inline-block;"><input type="text" name="nickname" style="width: 223px;" placeholder="2~10자 ( 한글 / 영문 / 숫자 )"></div>
                        <div style="display: inline-block;"><button type="button" onclick="nicknameCheck();">중복확인</button></div>
                        <label>&nbsp;</label>
                    </div> -->

                    <div align="center" style="margin-top: 30px;">
                        <div><button type="submit" id="enroll-btn" onclick="return checkForm();">가입하기</button></div>
                    </div>

                    <script>
                        // 아이디 중복체크, 유효성 검사
                        $('#userId').focusout(function() {
                            console.log('---------------');
                            var regExp = /^[a-zA-Z0-9]{4,11}$/;
                            var $checkId = $('#userId').val();
                                        
                            if($checkId=="") {
                                $('#idCheck').html('필수 입력사항입니다.');
                                $('#idCheck').css('color','rgb(47, 54, 82)');

                            } else if(!regExp.test($checkId)) {
                                $('#idCheck').html('5~12자의 영문 대 소문자와 숫자로 입력해주세요.');
                                $('#idCheck').css('color','rgb(47, 54, 82)');

                            } else {
                                $.ajax({
                                    url: '<%= contextPath %>/idCheck.me',
                                    data: {'checkId': $checkId},
                                    type: 'get',
                                    success: function(result) {
                                        if(result == 'NNNNN'){
                                            $('#idCheck').html('이미 존재하거나 탈퇴한 아이디입니다.');
                                            $('#idCheck').css('color','red');
                                        } else {
                                            $('#idCheck').html('사용가능한 아이디입니다.');
                                            $('#idCheck').css('color','rgb(47, 54, 82)');
                                        }
                                    }
                                })
                            }
                        });

                        // 비밀번호 유효성 검사
                        $('#userPwd').focusout(function(){
                            var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
                            var $checkPwd = $('#userPwd').val();

                            if($checkPwd=="") {
                                $('#pwdCheck').html('필수 입력사항입니다.');

                            } else if(!regExp.test($checkPwd)) {
                                $('#pwdCheck').html('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
                            } else {
                                $('#pwdCheck').html('');
                            }
                        });

                        // 비밀번호 일치 검사
                        $('#userPwd2').focusout(function(){
                            var $checkPwd = $('#userPwd').val();
                            var $checkPwd2 = $('#userPwd2').val();

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

                        // 이름 유효성 검사
                        $('#userName').focusout(function(){
                            var regExp = /^[가-힣]{2,}$/;
                            var $userName = $('#userName').val();

                            if($userName=="") {
                                $('#nameCheck').html('필수 입력사항입니다.');
                            } else if (!regExp.test($userName)) {
                                $('#nameCheck').html('이름을 다시 입력해주세요. (한글 2~5글자)');
                            } else {
                                $('#nameCheck').html('');
                            }
                        });

                        // 휴대전화 유효성 검사
                        $('#phone').focusout(function(){
                            var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
                            var $phone = $('#phone').val();

                            if($phone=="") {
                                $('#phoneCheck').html('필수 입력사항입니다.');
                            } else if (!regExp.test($phone)) {
                                $('#phoneCheck').html('연락처를 다시 입력해주세요. (-를 포함해서 입력)');
                            } else {
                                $('#phoneCheck').html('');
                            }
                        });

                        function emailCheck() {
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
                            }
                        }; 

                        // 생년월일
                        $(document).ready(function(){            
                            var now = new Date();
                            var year = now.getFullYear();
                            var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
                            var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
                            for(var i = 1900 ; i <= year ; i++) {
                                $('#year').append('<option value="' + i + '">' + i + '년</option>');    
                            }
                            for(var i=1; i <= 12; i++) {
                                var mm = i > 9 ? i : "0"+i ;            
                                $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
                            }
                            for(var i=1; i <= 31; i++) {
                                var dd = i > 9 ? i : "0"+i ;            
                                $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
                            }
                            $("#year > option[value="+year+"]").attr("selected", "true");        
                            $("#month > option[value="+mon+"]").attr("selected", "true");    
                            $("#day > option[value="+day+"]").attr("selected", "true");       

                        });
                        
                        $('#year').focusout(function(){
                            var $year = $('#year').val();

                            if($year > 2003) {
                                $('#birthCheck').html('성인만 가입 가능합니다.');
                                $('#birthCheck').css('color','red');
                            } else {
                                $('#birthCheck').html('');
                            }
                        });

                        $('#email').focusout(function(){
                            var $email = $('#email').val();
                            var $emailSite = $('#emailSite').val();
                            
                            if($email=="") {
                                $('#emailCheck').html('필수 입력사항입니다.');
                                $toggleName = 0;
                            } else {
                                $('#emailCheck').html('');
                                $toggleName = 1;
                            }
                        });

                        $('#emailSite').focusout(function(){
                            var $emailSite = $('#emailSite').val();
                            
                            if($emailSite=="") {
                                $('#emailCheck').html('필수 입력사항입니다.');
                                $toggleName = 0;
                            } else {
                                $('#emailCheck').html('');
                                $toggleName = 1;
                            }
                        });

                        function checkForm() {
                            $idCheck = $('#idCheck').text();
                            $pwdCheck = $('#pwdCheck').text();
                            $pwdCheck2 = $('#pwdCheck2').text();
                            $nameCheck = $('#nameCheck').text();
                            $phoneCheck = $('#phoneCheck').text();
                            $emailCheck = $('#emailCehck').text();
                            $emailSite = $('#emailSite').val();
                            $birthCheck = $('#birthCheck').text();

                            if($idCheck!='' && $idCheck != '사용가능한 아이디입니다.'){
                                alert('아이디를 확인해주세요.');
                                $('#userId').focus();
                                return false;
                            };

                            if($pwdCheck!=''){
                                alert('비밀번호를 확인해주세요.');
                                $('#userPwd').focus();
                                return false;
                            };

                            if($pwdCheck2!=''){
                                alert('비밀번호가 일치하지 않습니다.');
                                $('#userPwd2').focus();
                                return false;
                            };

                            if($nameCheck!=''){
                                alert('이름을 확인해주세요.');
                                $('#userName').focus();
                                return false;
                            };

                            if($phoneCheck!=''){
                                alert('휴대번호를 확인해주세요.');
                                $('#phone').focus();
                                return false;
                            };

                            if($emailCheck!=''){
                                alert('이메일 확인해주세요.');
                                $('#email').focus();
                                return false;
                            };

                            if($emailSite==''){
                                alert('이메일 도메인을 입력해주세요.');
                                $('#emailSite').focus();
                                return false;
                            };

                            if($birthCheck!=''){
                                alert('성인만 가입 가능합니다.');
                                return false;
                            };

                            return true;
                        }
                    </script>
            </form>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html> 