<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.common.model.vo.Attachment, java.util.ArrayList, com.hj.community.review.model.vo.Review, com.hj.product_sub.model.vo.Subscription, com.hj.common.model.vo.PageInfo" %>
<%
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
	ArrayList<Subscription> sList = (ArrayList<Subscription>)request.getAttribute("sList");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	
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
<title>구독후기 리스트</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">
<style>
    .outer{
        font-family: 'Pretendard-Regular';
    }
    .thumbnail{
        font-family: 'Pretendard-Regular';
		border : 1px solid rgb(216, 216, 216);
		width : 195px;
		display : inline-block;
		margin : 8px;
		
	} 
    .list-area{
        width : 860px;
        margin : auto;
        text-align : left;
    }
    .thumbnail>img{
		width: 193px;
		height: 215px;
	}
    /* .thumbnail>p{
        padding-left:10px;
    }
     */
    table{
        table-layout: fixed;
    }
    td{
        overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
    }
    .thumbnail>table{
        width : 200px;
    }
	.thumbnail:hover{
		cursor:pointer;
		opacity:0.9;
	}
	.top-bar a{
		font-size : 20px;
	}
</style>
</head>
<body>
   
	<div class="outer">
        <div class="top-bar">
            <div>
                <ul id="top-ul">
                    <li><a href="<%=contextPath%>/list.bo?cpage=1">게시판</a></li>
                    <li><a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                    <li><a href="<%=contextPath%>/list.qa?cpage=1">문의사항</a></li>
                    <li><a style="color:rgb(72, 72, 131); font-size:22px;" href="<%=contextPath%>/list.rs?cpage=1">구독후기</a></li>
                </ul>
            </div>
        </div>
        
        <div class="main-area">
            <br><br><br>
            <script>
                var ym = document.getElementById('yearmonth');
            
                window.onload = function(){
                	
                    var date = new Date();
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    
                    var arr = [];
                    
                    for(var i = 0; i <= 11; i++){
                    

                        month = month == 0 ? 11 : month;
                        year = month <= date.getMonth() + 1 ? year : year - 1;
                        month = month >= 10 ? month : '0' + month;
                        
                        var opdate =  year.toString().substr(2) + '-' + month;
                        arr.push(opdate);
                        
                        month -= 1;
                        
                    };
                    console.log(arr[0].substr(0, 2));
        
                    for(var i = 0; i <= 11; i++){
                        ym.innerHTML += '<option value="' + arr[i] + '">' + arr[i].substr(0, 2) + '년 ' + arr[i].substr(3, 2) + '월' + '</option>';
                    };

                
                };
                    
            
            </script>

            <div class="list-area" align="center">
				<% if(rList.isEmpty()){ %>
					
				<% } else{%>
	                <%for(int i = 0; i < rList.size(); i++){ %>
	                	<div class="thumbnail">
		                    <tr>
                           		<input type="hidden" value="<%=rList.get(i).getRevNo() %>">
		                        <img src="<%=contextPath %><%=rList.get(i).getRevImg()%>">
		                    </tr>
		                    <tr>
		                        <table align="center" style="padding : 5px; border-bottom: 0.3px solid rgb(235, 235, 235);  width:95%;">
		                            <tr>
		                            	<td colspan="2" style="padding-top:3px; padding-bottom:3px;">
		                            		<%=rList.get(i).getRevContent() %>
		                            	</td>
		                            </tr>
		                            <tr style="border-bottom: 1px solid grey;">
		                                <td style="font-size : 13px; color:rgb(110, 110, 110);">
		                                	<%=rList.get(i).getRevWriter() %>
		                                </td>
		                                <td style="font-size : 13px; color:rgb(110, 110, 110); text-align:right;">
		                                	<%=rList.get(i).getRevDate() %>
		                                </td>
		                            </tr>
		                        </table>
		                    </tr>
		                  
		                    <tr>
		                        <table align="center" style="padding : 5px;" >
		                            <tr>
		                                <td rowspan="2" style="width:48px;"><img style="width:43px; height:43px;" src="" alt=""></td>
		                                <td colspan="2" style="font-size : 14px; padding-bottom:1px;"><%=sList.get(i).getSubscriptName() %></td>
		                            </tr>
		                            <tr>
		                                <td style="font-size : 12px;">
		                                	<%=sList.get(i).getSubscriptMonth().substring(0, 2) + "년 " 
		                            		 + sList.get(i).getSubscriptMonth().substring(3, 5) + "월"%>
		                            	</td>
		                                <td style="font-size : 12px;"><span style="font-size : 12px; color:rgb(109, 109, 109);">평점</span>&nbsp;<%=rList.get(i).getRevRate() %></td>
		
		                            </tr>
		                        </table>
		                    </tr>
		                    
	               	 	</div>
	                <% } %>
	            <% } %>   
             
             <script>
             	$(function(){
             		
             		$('.thumbnail').click(function(){
             			
	             		location.href='<%=contextPath%>/detail.rs?rno='+ $(this).children('input').val();
	             		
             		})
             	})
             </script>  

            </div>
            <br><br>
	            <div align="center" class="paging-area">
				<% if(currentPage != 1){ %>
					<button onclick="location.href='<%=contextPath %>/list.rs?cpage=<%= currentPage - 1 %>'">&lt;</button>
				<% } %>	
				<% for(int i = startPage; i <= endPage; i++){ %>
					<% if(currentPage != i ){ %>
						<button onclick="location.href='<%= contextPath %>/list.rs?cpage=<%=i %>'"><%=i %></button>
					<% } else{ %>
						<button disabled><%= i %></button>
					<% } %>
				<% } %>
				<% if(currentPage != maxPage){ %>
					<button onclick="location.href='<%=contextPath %>/list.rs?cpage=<%=currentPage + 1%>'">&gt;</button>
				<% } %>
				</div>
				<br>
        </div>
    </div>

</body>
</html>