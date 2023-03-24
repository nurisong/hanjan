<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.member.model.vo.Shipment" %>
<% 
    ArrayList<Shipment> list = (ArrayList<Shipment>)(request.getAttribute("sList"));
%>
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
        padding-top: 40px;
    }
    /* .ship-area span:hover {
        cursor: pointer;
    } */
    .ship-area div > button {
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
    .button-area {
        padding-left: 680px;
    }
    .button-area button {
        margin: 0px 5px;
        width: 60px;
        height: 30px;
        background-color: rgb(238, 238, 238);
        border: none;
        border-radius: 5px;
    }
    .button-area button:hover {
        cursor: pointer;
        background-color: rgb(227, 227, 227);
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
    #new-ship:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }
    #noShip {
        text-align: center;
        padding: 95px;
        height: 250px;

        font-size: 18px;
        color: rgb(68, 68, 68);
        /* border: 1px solid #ccc; */
        border-radius: 5px;
        border: none;
        background-color: rgb(238, 238, 238);
        
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
            <div id="title">배송지 관리</div>
                <div id="title-line"><hr></div>
                <div><button id="new-ship" onclick="newShip();">+ 신규 배송지 추가</button></div>
                <div class="ship-area">
                    <% if(list==null) { %>
                        <!-- 조회된 배송지 X -->
                        <div id="noShip">
                            등록되어 있는 배송지가 없습니다. <br><br>
                            신규 배송지를 추가해주세요.
                        </div>

                    <% } else { %>
                        <!-- 조회된 배송지 O -->
                        <% for(Shipment s : list) { %>
                            <div>
                                <div><span><%= s.getRecipient() %></span>
                                    <% if(s.getShipName() != null) { %>
                                        <span>(<%= s.getShipName() %>)</span>
                                    <% } %>
                                    <% if(s.getBasicShip().equals("Y")) { %>
                                        <button>기본배송지</button>
                                    <% } %>
                                </div>
                                <div><%= s.getPhone() %></div>
                                <div><%= s.getAddress() %> <%= s.getDetailAddress() %></div>
                                <div>
                                    <div class="button-area">
                                        <span class="updateShip-btn">
                                            <input type="hidden" value="<%= s.getShipNo() %>">
                                            <button>수정</button>
                                        </span>
                                        <span class="deleteShip-btn">
                                            <input type="hidden" value="<%= s.getShipNo() %>">
                                            <button>삭제</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    <% } %>
                </div>

                <script>
                    $(function(){
                        $('.updateShip-btn').click(function(){
                            // console.log($(this));
                            // console.log($(this).children().eq(0).val());
                            location.href="<%= contextPath %>/updateShipForm.me?sno=" + $(this).children().eq(0).val();
                        });

                        $('.deleteShip-btn').click(function(){
                            if(window.confirm("배송지를 삭제하시겠습니까?")) {
                                console.log($(this).children().eq(0).val())
                                location.href="<%= contextPath %>/deleteShip.me?sno=" + $(this).children().eq(0).val();
                            }
                        })

                    })
                </script>


            </div>
        </div>

    </div>

    <script>
        function newShip() {
            location.href = "<%= contextPath %>/insertShipForm.me"
        }
    </script>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>