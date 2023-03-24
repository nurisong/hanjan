<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .del-area {
        padding: 0px 0px 80px 0px;
    }
    .del-title {
        margin-top: 70px;
        margin-left: 80px;
        margin-bottom: 40px;
        font-size: 22px;
        font-weight: bold;
        color: rgb(47, 54, 82);
    }
    .del-content {
        /* margin-left: 120px; */
        font-size: 18px;
        font-family: 'Pretendard-Regular';
    }
    .del-area select {
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        width: 750px;
        height: 50px;
        text-align: center;
        box-sizing: border-box;
    }
    #del-textarea {
        box-sizing: border-box;
        margin-top: 30px;
        padding: 30px;
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        width: 750px;
        resize: none;
    }
    #del-check {
        margin-top: 20px;
        margin-bottom: 80px;
        margin-left: 250px;
        font-size: 18px;
    }
    #del-checkbox {
        width: 18px;
        height: 18px;
    }
    .del-area button {
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        background-color: RGB(63,72,107);
        color: white;
        height: 40px;
        width: 150px;
        border-radius: 5px;
        border: none;
        margin: 5px;
    }
    #delete-btn {
        background-color: rgb(223, 223, 223);
        color: rgb(161, 161, 161);
     }
    #cancle-btn {
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
            <div id="title">회원 탈퇴</div>
                <div id="title-line"><hr></div>
                <div class="del-area">

                    <div class="del-title">[회원 탈퇴 유의사항]</div>
                    <pre class="del-content">
                            [1] 회원 탈퇴 시 삭제된 데이터에 대해 복구가 불가능하며, 개인정보가 필요한 술렁술렁의 모든 웹서비스 이용이 불가합니다. <br>
                            [2] 구독을 이용하고 계신 경우, 회원 탈퇴 진행 시 구독도 함께 취소됩니다. <br>
                            [3] 잔여 포인트, 잔여 쿠폰, 회원 등급 등의 정보는 모두 삭제되며 환불되지 않습니다. <br>
                            [4] 회원 탈퇴 후 모든 술렁술렁 웹서비스 내에서의 계약 또는 청약 철회 등에 관한 기록은
                                  전자상거래 등에서의 소비자 보호에 관한 법률에 따라 5년간 보관되며, 
                                  이를 위한 개인정보는 법률에 따른 보유 목적 외에 다른 목적으로는 이용되지 않습니다. <br>
                            [5] 회원 탈퇴 후 술렁술렁 서비스에 입력하신 상품문의 및 후기(사진 포함)는 삭제되지 않으며,
                                  회원 정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능합니다. 
                                  상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
                    </pre>

                    <div class="del-title" style="margin-top: 70px;">[회원 탈퇴 사유]</div>
                    <form action="<%= contextPath %>/delete.me" method="post">
                        <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <div class="del-select" align="center">
                            <select name="reason">
                                <option selected disabled hidden>사유를 선택해주세요.</option>
                                <option value="product">쇼핑물 상품이 다양하지 않아서</option>
                                <option value="customerService">고객 응대가 불만족스러워서</option>
                                <option value="etc">기타</option>
                            </select><br>
                            <textarea name="opinion" id="del-textarea" rows="5" maxlength="200" placeholder="더욱 나은 서비스를 위하여 소중한 의견 부탁드립니다. (200자)"></textarea>
                            <div id="del-check">
                                <span>회원 탈퇴 유의사항을 숙지하였으며 회원 탈퇴를 진행하겠습니다.</span>
                                <span><input type="checkbox" id="del-checkbox" onchange="abledBtn();"></span>
                            </div>
                            <div><button type="button" id="cancle-btn">취소하기</button><button type="submit" id="delete-btn" disabled>탈퇴하기</button></div>

                            <script>
                                $('#cancle-btn').click(function(){
                                    location.href = "<%= contextPath %>/myPageInfo.me";
                                })

                                function abledBtn() {
                                    if($('#del-checkbox').is(':checked') == true) {
                                        $('#delete-btn').attr('disabled', false);
                                        $('#delete-btn').css('cursor', 'pointer');
                                        $('#delete-btn').css('color', 'black');
                                    } else {
                                        $('#delete-btn').attr('disabled', true);
                                        $('#delete-btn').css('cursor', 'default');
                                        $('#delete-btn').css('color', 'rgb(161, 161, 161)');
                                    }
                                }
                            </script>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>