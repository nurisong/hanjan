<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.common.model.vo.Attachment, java.util.ArrayList, java.text.DecimalFormat, com.hj.community.review.model.vo.Review, com.hj.product_sub.model.vo.Subscription" %>

<%
	Review r = (Review)request.getAttribute("r");
	Subscription s = (Subscription)request.getAttribute("s");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	DecimalFormat decFormat = new DecimalFormat("###,###");
	int price = Integer.parseInt(s.getSubscriptPrice());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독후기 수정</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">
<style>
    .outer{
        font-family: 'Pretendard-Regular';
    }
    #update-form table {
    width: 100%;
    border-collapse: collapse;
    }
    th, td:not(.upfile-table td, .pro-table td) {
        border-bottom: 1px solid #e4e4e4;
        padding: 10px;
    }
    .pro-table td{
		 border-bottom:none;    
    }
    #update-form button{
        background-color: rgb(233, 233, 233);
		border-radius: 5px;
		width:40px;
		height:22px;
		border:none;
        margin:3px;
    }
    #update-form button:hover{
		cursor:pointer;
		opacity:0.8;
	}
    
</style>

</head>
<body>

    <div class="outer">
        <div class="main-area">

            <br>
            
            <form action="<%=contextPath %>/update.rs" method="post" id="update-form" enctype="multipart/form-data">
                <input type="hidden" name="rno" value="<%=r.getRevNo() %>">
            
                <table align="center" style="width:800px;">
                    <thead>
                        <tr>
                            <td colspan="2" style="border-bottom:none;"><h2 align="left" colspan="2">구독후기 수정</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>구매상품</td>
                            <td>
                                <table class=pro-table style="width:300px;">
		                            <tr>
		                                <td rowspan="2" width="20" style="padding-left:0px;"><img style="width:60px; height:60px;" src="" alt=""></td>
		                                <td width="80" style="padding-left:0px; padding-bottom:3px; font-size :16px; color:rgb(109, 109, 109);">
		                                	&nbsp;<%=s.getSubscriptMonth().substring(0, 2) + "년 " 
			                            	 + s.getSubscriptMonth().substring(3, 5) + "월"%>
		                                <td style="font-size : 16px; padding-left : 0px; padding-bottom:3px;"><%=s.getSubscriptName() %></td>
		                            	</td>
		                            </tr>
		                           	<tr>
		                           		<td colspan="2" style="padding-top : 0px;"><%=decFormat.format(price) %>원</td>
		                            </tr>
		                        </table>
                            </td>
                        </tr>
                        <%if(list != null){ %>
                        <tr>
                        	<td>첨부파일</td>
                        	<td>
	                            <table class="upfile-table">
	                            	<% for(int i = 0; i < 3; i++){%>
	                           		<tr>
	                           			<td>
	                           				<%if(i <= list.size() - 1){ %>
			                           			<%= list.get(i).getOriginName() %>
				                                <input type="hidden" name="originFileNo<%=i + 1 %>" value="<%= list.get(i).getFileNo() %>">
				                                <input type="hidden" name="originFileName<%=i + 1 %>" value="<%= list.get(i).getChangeName() %>">
				                            <% } %>
		                                </td>
		                                <td>
		                                	<input type="file" name="reUpfile<%=i + 1 %>">
		                                </td>
		                             <tr>
	                        		<% } %>
	                        		
	                        	</table>
                        	</td>
                        </tr>
                        <% } %>
                        <tr>
                            <td>내용</td>
                            <td><textarea cols="90" rows="20" style="resize:none;" name="content"><%=r.getRevContent() %></textarea></td>
                        </tr>
                        <tr>
                            <td>별점</td>
                            <td><input name="rate" value="1" type="radio" id="rate1"><label for="rate1">★☆☆☆☆</label>
                                <input name="rate" value="2" type="radio" id="rate2"><label for="rate2">★★☆☆☆</label>
                                <input name="rate" value="3" type="radio" id="rate3"><label for="rate3">★★★☆☆</label>
                                <input name="rate" value="4" type="radio" id="rate4"><label for="rate4">★★★★☆</label>
                                <input name="rate" value="5" type="radio" id="rate5"><label for="rate5">★★★★★</label>
                            </td>
                        </tr>
                        <tr align="right">
                            <td colspan="2" style="border-bottom:none;">
                                <button type="button" onclick="location.href='<%=contextPath%>/detail.rs?rno=<%=r.getRevNo()%>'">취소</button>
                                <button type="submit" style="margin-right:0px;">수정</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <script>
                	$(function(){
		                var rate = '<%=r.getRevRate() %>';
		                
		                $('input[name=rate]').each(function(){
		                	if($(this).val() == rate){
		                		$(this).prop('checked', true);
		                	}
		                });
                		
                	})
                </script>

            </form>
        </div>
    </div>
</body>
</html>