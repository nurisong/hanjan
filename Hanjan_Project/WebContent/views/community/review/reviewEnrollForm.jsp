<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product.model.vo.Product, java.text.DecimalFormat" %>
<%
	Product p = (Product)request.getAttribute("p");
	DecimalFormat decFormat = new DecimalFormat("###,###");
	int price = Integer.parseInt(p.getProductPrice());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 등록</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    .outer{
        font-family: 'Pretendard-Regular';
    }  
    #enroll-form table {
    width: 100%;
    border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid #e4e4e4;
        padding: 10px;
    }
    .pro-table td{
		 border-bottom:none;    
    }
    #enroll-form button{
        background-color: rgb(233, 233, 233);
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
            
            <form action="<%=contextPath %>/insert.rv" id="enroll-form">
                
                <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">
            
                <table align="center" style="width:800px;">
                    <thead>
                        <tr>
                            <td colspan="2" style="border-bottom:none;"><h2 align="left" colspan="2">리뷰 작성</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td><input name="title" type="text" style="width:690px; height: 25px;" required></td>
                        </tr>
                        <tr>
                            <td>구매상품</td>
                            <td>
                                <table class=pro-table style="padding : 5px; width:300px;">
		                            <tr>
		                                <td rowspan="2" width="20"><img style="width:60px; height:60px;" src="" alt=""></td>
		                                <td style="font-size : 16px; padding-left : 8px; padding-bottom:3px;"><%=p.getProductName() %></td>
		                            	</td>
		                            </tr>
		                           	<tr>
		                           		<td style="padding-top : 0px;"><%=decFormat.format(price) %>원</td>
		                            </tr>
		                        </table>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="content" id="" cols="96" rows="20" style="resize:none;" required></textarea></td>
                        </tr>
                        <tr>
                            <td>별점</td>
                            <td><input name="rate" value="1" type="radio" id="rate1"><label for="rate1">★☆☆☆☆</label>
                                <input name="rate" value="2" type="radio" id="rate2"><label for="rate2">★★☆☆☆</label>
                                <input name="rate" value="3" type="radio" id="rate3" checked><label for="rate3">★★★☆☆</label>
                                <input name="rate" value="4" type="radio" id="rate4"><label for="rate4">★★★★☆</label>
                                <input name="rate" value="5" type="radio" id="rate5"><label for="rate5">★★★★★</label>
                            </td>
                        </tr>
                        <tr align="right">
                            <td colspan="2" style="border-bottom:none;">
                                <button type="reset">취소</button> <!--마이페이지로 이동-->
                                <button type="submit">등록</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

</body>
</html>