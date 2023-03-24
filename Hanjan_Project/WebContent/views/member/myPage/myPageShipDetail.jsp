<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
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
        margin-bottom: 50px;
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
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <div class="top-bar">
            <div class="inline-block">
                <div id="name-area" style="cursor: default;"><span id="userName">000</span> 님</div>
                <div>
                    <div id="point-text">적립금</div>
                    <div id="point">2000</div>
                </div>
            </div>
            <div>
                <ul id="top-ul">
                    <li><a href="<%= contextPath %>/myPageSub.me">구독관리</a></li>
                    <li><a href="<%= contextPath %>/myPageOrder.me">주문내역</a></li>
                    <li><a id="click" href="<%= contextPath %>/myPageShip.me">배송지</a></li>
                    <li><a href="<%= contextPath %>/myPageInfo.me">회원정보</a></li>
                    <li><a href="<%= contextPath %>/myPageQa.me">문의내역</a></li>
                    <li><a href="<%= contextPath %>/myPageBoard.me">게시글</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area">
            <div id="title">배송지 수정</div>
                <div id="title-line"><hr></div>
                <div class="info-area">
                    <form action="<%= contextPath %>/update.me" method="post" id="info-form">
            
                        <table class="info-form" align="center">
                
                            <tr>
                                <td style="width: 100px;">배송지명</td>
                                <td><input type="text" name="shipName" value="기존배송지명" readonly></td>
                            </tr>
                
                            <tr>
                                <td>성명</td>
                                <td><input type="text" name="recipient"  required value="기존성명"></td>
                            </tr>
                
                            <tr>
                                <td>주소</td>
                                <td>
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
                                <td><input type="text" name="add2" required></td>
                            </tr>

                
                            <tr>
                                <td>연락처</td>
                                <td><input type="text" name="phone" placeholder="- 포함해서 입력해주세요"></td>
                            </tr>
                            <tr>
                                <td colspan="2" id="">
                                    <div><input type="checkbox" name="basicShip" id="basic-check" style="width: 15px;">기본 배송지로 저장</div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="button-area">
                                    <span><button type="submit" >수정하기</button></span>
                                    <span><button type="submit" id="gray-btn">취소하기</button></span>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>