<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.hj.community.qa.model.vo.QA, com.hj.common.model.vo.PageInfo " %>
<%
    ArrayList<QA> list = (ArrayList<QA>)request.getAttribute("list");
    
    PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .qa-area {
        padding: 20px 0px;
    }
    .qa-table {
        width: 950px;
        font-size: 18px;
        text-align: center;
        border-collapse: separate;
        border-bottom: 1px solid #ccc;
        border-spacing: 1px;  
    }
    .qa-table tbody > tr:hover {
        cursor: pointer;
        background-color: rgb(249, 249, 249);
    }
    .qa-table > thead {
        background-color: rgb(238, 238, 238);
        border-bottom: 1px solid #ccc;
    }
    .qa-table th, td {
        height: 50px;
    }
    #click-qa{
        color: rgb(255, 175, 188);
    }
    #new-qa {
        margin-left: 880px;
        margin-top: 20px;
        background-color: rgb(232, 232, 232);
        height: 40px;
        width: 110px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
    }
    #new-qa:hover {
        cursor: pointer;
        background-color: rgb(222, 222, 222);
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
            <button id="new-qa">문의글 작성</button>
            <div class="qa-area">
                <table align="center" class="qa-table">
                    <thead>
                        <th>문의유형</th>
                        <th>내용</th>
                        <th>문의날짜</th>
                        <th>답변 상태</th>
                    </thead>
                    <tbody>
                        <% if(list.isEmpty()) { %>
                            <tr>
                                <td colspan="4">작성된 문의글이 없습니다.</td>
                            </tr>
                        <%} else { %>
                            <% for(QA qa : list) { %>
                                <tr>
                                    <input type="hidden" value="<%= qa.getQaNo() %>">
                                    <td><%= qa.getQaCategory() %></td>
                                    <td><%= qa.getQaTitle() %></td>
                                    <td><%= qa.getQaDate() %></td>

                                    <% if(qa.getQaReply() == null) { %>
                                        <td>답변대기</td>
                                    <% } else { %>
                                        <td>답변완료</td>
                                    <% } %>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>

                <script>
                    $(function() {
                        $('.qa-table>tbody>tr').click(function() {
                            location.href='<%= contextPath %>/detail.qa?qno=' + $(this).children().eq(0).val();
                        });

                        $('#new-qa').click(function(){
                            location.href='<%= contextPath %>/insertForm.qa';
                        })
                    })
                </script>
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>