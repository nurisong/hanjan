<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시글 작성하기</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    .outer{
        font-family: 'Pretendard-Regular';
    }    
    
    #enroll-form tbody>tr>td:first-child{
        text-align : right;
    }
    #enroll-form table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid #d1d1d1;
        padding: 10px;
    }
    #enroll-form button{
        background-color: rgb(216, 216, 216);
		border-radius: 5px;
		width:40px;
		height:22px;
		border:none;
        margin:3px;
    }
    #enroll-form button:hover{
		cursor:pointer;
		opacity:0.8;
	}
</style>

</head>
<body>

    <div class="outer">
        <div class="main-area">
            <br>

            <form action="<%=contextPath %>/insert.bo" id="enroll-form" method="post" enctype="multipart/form-data">
                
                <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">
                
                <table align="center" style="width:780px;">
                    <thead>
                        <tr>
                            <td colspan="2" style="border-bottom:none;"><h2 align="left" colspan="2">게시글 작성</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td><input name="title" type="text" style="width:670px; height: 25px;" required></td>
                        </tr>
                        <tr>
                            <td width="100">첨부파일</td>
                            <td><input type="file" name="upfile"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="content" id="" cols="94" rows="20" style="resize:none;" required></textarea></td>
                        </tr>
                        
                        <tr align="right">
                            <td colspan="2" style="border-bottom:none;">
                                <button type="reset" onclick='location.href="<%=contextPath %>/list.bo?cpage=1"'>취소</button>
                                <button type="submit" style="margin-right:0px;">등록</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            

            </form>
        </div>
    </div>
</body>
</html>