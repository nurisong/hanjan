<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.community.qa.model.vo.QA" %>
<%
    QA qa = (QA)request.getAttribute("qa");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .question-area {
        font-size: 18px;
        background-color: rgb(244, 244, 244);
        margin: 50px auto;
        padding: 50px 50px;
        width: 950px;
        border-radius: 10px;
    }
    .question-title {
        font-size: 23px;
    }
    #q, #a {
        font-size: 40px;
        font-weight: bold;
        color: rgb(63, 72, 107);
        margin-right: 10px;
    }
    #question-button {
        margin-left: 700px;
    }
    #question-button button {
        margin: 0px 5px;
        width: 60px;
        height: 30px;
        background-color: rgb(228, 228, 228);
        border: none;
        border-radius: 5px;
    }
    #question-button button:hover {
        cursor: pointer;
        background-color: rgb(227, 227, 227);
    }
    #question-content, #answer-content {
        padding: 30px;
    }
    #click-qa {
        color: rgb(255, 175, 188);
    }
    #answer-date {
        font-size: 12px;
        margin-top: 20px;
    }
    .question-area button{
        float: right;
    }

</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <%@ include file="myPageTopbar.jsp" %>
        
        <div class="main-area">
            <div id="title">문의내역 조회</div>
                <div id="title-line"><hr></div>
                <div class="question-area">
                    <div id="question-date"><%= qa.getQaDate() %></div>
                    <div id="question-button"><button>삭제</button></div>
                <div class="question-title">
                    <span id="q">Q.</span> 
                    <span>[<%= qa.getQaCategory() %>]</span>
                    <span><%= qa.getQaTitle() %></span> 
                </div>
                <div id="question-content"><%= qa.getQaContent() %></div>
                <div><hr></div>

                <div id="answer-area">
                    <span id="a">A.</span> 
                </div>
                <% if(qa.getQaReply() == null) { %>
                    <div id="answer-content">최대한 빠르게 답변 도와드리겠습니다. 잠시만 기다려주세요 :)</div>
                <% } else { %>
                    <div id="answer-content">
                        <%= qa.getQaReply() %>
                        <div id="answer-date"><%= qa.getQaReplyDate() %></div>
                    </div>
                <% } %>
                <div></div>
                <div><hr></div>

                
                <!-- <table align="center" class="qa-table">
                    <thead>
                        <th>문의유형</th>
                        <th>내용</th>
                        <th>문의날짜</th>
                        <th>답변 상태</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>상품문의</td>
                            <td>어르신에게 선물하기 괜찮을까요?</td>
                            <td>2022-11-02</td>
                            <td>답변대기</td>
                        </tr>
                        <tr>
                            <td>취소문의</td>
                            <td>주문 취소 가능한가요?</td>
                            <td>2022-09-03</td>
                            <td>답변완료</td>
                        </tr>
                    </tbody>
                </table> -->
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>