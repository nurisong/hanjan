<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: auto;
        margin-top: 5px;
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
</style> 

</head>
<body>

    <div class="outer">
        <div class="main-area">

            <br>

            <form action="#" id="enroll-form">
            
                <table align="center" style="width:800px;">
                    <thead>
                        <tr>
                            <td colspan="2"><h2 align="left" colspan="2">문의사항 수정</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" style="width:640px; height: 25px;"></td>
                        </tr>
                        <tr>
                            <td width="70">첨부파일</td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td>문의구분</td>
                            <td>
                                <select name="category" style="height: 25px;">
                                    <option>상품</option>
                                    <option>배송</option>
                                    <option>기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="" id="" cols="90" rows="20" style="resize:none;"></textarea></td>
                        </tr>
                        
                        <tr align="right">
                            <td colspan="2">
                                <button type="reset">취소</button> &nbsp;&nbsp;
                                <button type="submit">수정</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>>

            </form>
        </div>
    </div>


</body>
</html>