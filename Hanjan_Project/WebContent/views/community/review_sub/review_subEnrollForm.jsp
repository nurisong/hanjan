<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription, java.text.DecimalFormat" %>
<%
	Subscription s = (Subscription)request.getAttribute("s");
	DecimalFormat decFormat = new DecimalFormat("###,###");
	int price = Integer.parseInt(s.getSubscriptPrice());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독후기 작성</title>
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
    th, td:not(.upfile-table td, .pro-table td) {
        border-bottom: 1px solid #e4e4e4;
        padding: 10px;
    }
    
    .pro-table td{
        border-bottom: none;
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
            
            <form action="<%=contextPath%>/insert.rs" id="enroll-form" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">
                
            
                <table align="center" style="width:800px;">
                    <thead>
                        <tr>
                            <td colspan="2" style="border-bottom:none;"><h2 align="left" colspan="2">구독후기 작성</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td>구매상품</td>
                            <td>
                            	<table class=pro-table style="padding : 5px; width:300px;">
		                            <tr>
		                                <td rowspan="2" width="20" style="padding-left:0px"><img style="width:60px; height:60px;" src="" alt=""></td>
		                                <td width="80" style="padding-left:0px; padding-bottom:3px; font-size :16px; color:rgb(109, 109, 109);">
		                                	&nbsp;<%=s.getSubscriptMonth().substring(0, 2) + "년 " 
			                            	 + s.getSubscriptMonth().substring(3, 5) + "월"%>
		                                <td style="font-size : 16px; padding-left : 0px; padding-bottom:3px;"><%=s.getSubscriptName() %></td>
		                            	</td>
		                            </tr>
		                           	<tr>
		                           		<td colspan="2" style="padding-top : 0px; padding-left:5px;"><%=decFormat.format(price) %>원</td>
		                            </tr>
		                        </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="70">첨부파일</td>
                            <td>
                            	<table class="upfile-table">
                            		<tr><td><input type="file" name="file1"></td></tr>
                            		<tr><td><input type="file" name="file2"></td></tr>
                            		<tr><td><input type="file" name="file3"></td></tr>
                            	</table>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="content" id="" cols="95" rows="20" style="resize:none;" required></textarea></td>
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
                                <button type="reset">취소</button>
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