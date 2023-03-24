<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.hj.community.board.model.vo.Board, com.hj.common.model.vo.Attachment" %>
<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    .outer{
        font-family: 'Pretendard-Regular';
    }
    #update-form tbody>tr>td:first-child{
        text-align : right;
    }
    #update-form table {
    width: 100%;
    border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid #d1d1d1;
        padding: 10px;
    }
    #update-form button{
        background-color: rgb(233, 233, 233);
		border-radius: 5px;
		width:40px;
		height:22px;
		border:none;
        margin:3px;
    }
</style>    

</head>
<body> 

    <div class="outer">
        <div class="main-area">
            <br>
            
            <form action="<%=contextPath %>/update.bo?bno=<%=b.getBoardNo() %>" id="update-form" method="post" enctype="multipart/form-data">
            
            <input type="hidden" value="<%= b.getBoardNo() %>" name="bno">

                <table align="center" style="width:790px;">
                    <thead>
                        <tr>
                            <td style="border-bottom:none;" colspan="3"><h2 align="left" colspan="2">게시글 수정</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td colspan="2"><input name="title" value="<%=b.getBoardTitle()%>" required type="text" style="width:680px; height: 25px;"></td>
                        </tr>
                        <tr>
                            <td width="110">첨부파일</td>
                            <% if(at != null){ %>
                            <td>
                                <%= at.getOriginName() %>
                                <input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
                                <input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">
                            </td>
                        <% } %>
                        <td><input type="file" name="reUpfile"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td colspan="2"><textarea name="content" required name="" id="" cols="95" rows="20" style="resize:none;"><%= b.getBoardContent() %></textarea></td>
                        </tr>
                        
                        <tr align="right">
                            <td style="border-bottom:none;" colspan="3">
                                <button type="reset" onclick='location.href="<%=contextPath %>/detail.bo?bno=<%=b.getBoardNo()%>"' style="margin-right:10px;">취소</button> 
                                <button type="submit" style="margin-right: 0px;">수정</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>    
        
    </div>

</body>
</html>