<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.member.model.vo.Shipment"%>
<%
    Shipment s = (Shipment)(request.getAttribute("s"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .main-area {
        height: 800px;
    }
    .ship-area {
        width: 950px;
        margin: 30px auto;
        font-size: 17px;
    }
    .ship-area > div {
        border: 1px solid rgb(144, 144, 144);
        padding: 30px;
    }
    .ship-area > div:hover {
        background-color: rgb(249, 249, 249);
    }
    .ship-area  div > button {
        background-color: rgb(63, 72, 107);
        margin: 0 10px;
        height: 25px;
        border: none;
        border-radius: 5px;
        color: white;
    }
    .ship-area div {
        margin: 10px;
    }
    #new-ship {
        margin-left: 835px;
        margin-top: 20px;
        background-color: rgb(63, 72, 107);
        height: 40px;
        width: 150px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        color: white;
    }
    #main-text {
        /* margin: 50px; */
        /* height: 100px; */
        font-size: 25px;
    }
    .info-area {
        margin-top: 30px;
    }
    #info-form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        height: 550px;
    }
    #info-form tr {
        height: 60px;
    }
    .info-form input {
        height: 40px;
        width: 500px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        font-size: 15px;
    }
    .info-area button, input[type=button] {
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
    .button-area button {
        margin: 10px;
        font-size: 20px;
        width: 200px;
        height: 50px;
    }
    #gray-btn {
        background-color: rgb(223, 223, 223);
        color: black;
    }
    #basic-check {
        margin-left: 470px;
        height: 14px;
    }
    button:hover {
        cursor: pointer;
    }
    #click-ship{
        color: rgb(255, 175, 188);
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <%@ include file="myPageTopbar.jsp" %>
        
        <div class="main-area">
            <div id="title">배송지 수정</div>
                <div id="title-line"><hr></div>
                <div class="info-area">
                    <form action="<%= contextPath %>/updateShip.me" method="post" id="info-form">
            
                        <table class="info-form" align="center">

                            <input type="hidden" name="userNo" value="<%= s.getUserNo() %>">
                            <input type="hidden" name="shipNo" value="<%= s.getShipNo() %>">

                            <tr>
                                <td style="width: 100px;">배송지명</td>
                                <% if(s.getShipName() != null) { %>
                                    <td><input type="text" name="shipName" placeholder="배송지명 (선택)" value="<%= s.getShipName() %>"></td>
                                <% } else { %>
                                    <td><input type="text" name="shipName" placeholder="배송지명 (선택)"></td>
                                <% } %>
                            </tr>
                
                            <tr>
                                <td>성명</td>
                                <td><input type="text" name="recipient" required placeholder="수령인" value="<%= s.getRecipient() %>" ></td>
                            </tr>
                
                            <tr>
                                <td>주소</td>
                                <td>
                                    <span><input type="text" name="postcode" id="sample6_postcode" value="<%= s.getPostcode() %>" placeholder="우편번호" required readonly style="width: 100px; text-align: center; margin-right: 10px;"></span>
                                    <span><input type="button" id="gray-btn" onclick="sample6_execDaumPostcode()" style="width: 100px;" value="우편번호 찾기"></span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="text" name="address" id="sample6_address" value="<%= s.getAddress() %>" readonly placeholder="주소"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="text" name="detailAddress" id="sample6_detailAddress" value="<%= s.getDetailAddress() %>" required placeholder="상세주소"></td>
                            </tr>
                            <!-- <tr>
                                <td></td>
                                <td><input type="text" id="sample6_extraAddress" readonly placeholder="참고항목"></td>
                            </tr> -->
                                

                                
                                <!-- <td>
                                    <span><input type="text" name="postcode" required readonly style="width: 100px; text-align: center; margin-right: 10px;"></span>
                                    <span><button id="gray-btn">우편번호</button></span>
                                </td>
                            </tr>
                            <tr>
                                <td> </td>
                                <td><input type="text" name="add1" required readonly></td>
                            </tr>
                            <tr>
                                <td> </td>
                                <td><input type="text" name="add2" required placeholder="상세주소"></td>
                            </tr> -->

                
                            <tr>
                                <td>연락처</td>
                                <td><input type="text" name="phone" value="<%= s.getPhone() %>" maxlength="13" oninput="this.value=this.value.replace(/[^-0-9]/g,'');" required placeholder="- 포함해서 입력해주세요"></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <% if(s.getBasicShip().equals("Y")) { %>
                                        <div><input type="checkbox" name="basicShip" id="basic-check" checked="true" style="width: 15px;" value="Y">기본 배송지로 저장</div>
                                    <% } else {%>
                                        <div><input type="checkbox" name="basicShip" id="basic-check" style="width: 15px;" value="Y">기본 배송지로 저장</div>
                                    <% } %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="button-area">
                                    <span><button type="submit" >수정하기</button></span>
                                    <span><button type="reset" id="gray-btn">취소하기</button></span>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                <script>
                                    function sample6_execDaumPostcode() {
                                        new daum.Postcode({
                                            oncomplete: function(data) {
                                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                var addr = ''; // 주소 변수
                                                var extraAddr = ''; // 참고항목 변수

                                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                                    addr = data.roadAddress;
                                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                                    addr = data.jibunAddress;
                                                }                                                

                                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                document.getElementById('sample6_postcode').value = data.zonecode;
                                                document.getElementById("sample6_address").value = addr;
                                                // 커서를 상세주소 필드로 이동한다.
                                                document.getElementById("sample6_detailAddress").value = null;
                                                document.getElementById("sample6_detailAddress").focus();
                                            }
                                        }).open();
                                    }
                                </script>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>