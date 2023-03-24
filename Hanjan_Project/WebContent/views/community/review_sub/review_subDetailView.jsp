<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat, com.hj.common.model.vo.Attachment, java.util.ArrayList, com.hj.community.review.model.vo.Review, com.hj.product_sub.model.vo.Subscription" %>
<%
	Review r = (Review)request.getAttribute("r");
	Subscription s = (Subscription)request.getAttribute("s");
	DecimalFormat decFormat = new DecimalFormat("###,###");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");

	int price = Integer.parseInt(s.getSubscriptPrice());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독후기 상세</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">
<style>
    .outer{
        font-family: 'Pretendard-Regular';
       
    } 
    #detail-area a{
		background-color: rgb(233, 233, 233);
		display:inline-block;
		width:40px;
		height:22px;
		text-align: center;
		padding-top:3px;
		border-radius: 5px;
		margin:3px;
	}
	#reply-btn{
		background-color: rgb(216, 216, 216);
		border-radius: 5px;
		width:40px;
		height:22px;
		border:none;
	}
	#list-btn{
        background-color: rgb(233, 233, 233);
        display:inline-block;
        width:80px;
        height:25px;
        text-align: center;
        padding-top:6px;
        border-radius: 5px;
        margin:3px;
    }
	#detail-area a:hover, #reply-btn:hover, #list-btn:hover{
		cursor:pointer;
		opacity:0.8;
	}
	#detail-area h2{
		cursor:pointer;
	}
</style>
</head>
<body>
    
    <div class="outer" align="center">

        <div class="main-area">
            <div style="width : 800px;">
                <table align="center" id="detail-area">
                    <tbody id="body1">
                        <tr>
                            <td colspan="3">
                                <br>
                                <h2 align="left" onclick='location.href="<%=contextPath%>/list.rs?cpage=1"'>구독후기</h2>
                                <br>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr style="border-bottom:1px solid black;">
                            <td style="text-align:right;">
                                <% if(loginUser != null && loginUser.getUserId().equals(r.getRevWriter())){%>
			                        <a href="<%=contextPath %>/updateForm.rs?rno=<%=r.getRevNo() %>&userNo=<%=loginUser.getUserNo() %>">수정</a>
			                        <a href="<%=contextPath %>/delete.rs?rno=<%=r.getRevNo() %>" onclick="return del();" class="btn btn-info btn-sm">삭제</button>
		                   		<% } %>
                            </td>
                        </tr>
                        <tr>  <td><br></td> </tr>
                    </tbody>
                    <tr>
                        <td colspan="3" style="text-align:left">
                        	 <table style="padding : 5px; border-bottom:0.3px solid rgb(233, 233, 233);" width="800">
	                            <tr>
	                                <td rowspan="2" style="width:48px;"><img style="width:55px; height:55px;" src="" alt=""></td>
	                                <td width="90" style="font-size : 17px; color:rgb(109, 109, 109);">
	                                	&nbsp;<%=s.getSubscriptMonth().substring(0, 2) + "년 " 
		                            	 + s.getSubscriptMonth().substring(3, 5) + "월"%>
	                            	</td>
	                                <td colspan="2" style="font-size : 17px; padding-bottom:1px; text-align=left;"><%=s.getSubscriptName() %></td>
	                                <td width="200" style="text-align: right;">
	                                	<%=r.getRevDate() %>
	                                </td>
	                            </tr>
	                            <tr>    
	                                <td colspan="2" style="font-size : 15px;"><span style="font-size : 15px; color:rgb(109, 109, 109); padding-left:5px;">평점</span>&nbsp;
	                                	<span >
		                                	<%if(r.getRevRate() == 1){%>	
		                                		★☆☆☆☆
		                                	<%} else if(r.getRevRate() == 2) {%>
		                                		★★☆☆☆
		                                	<%} else if(r.getRevRate() == 3) {%>
		                                		★★★☆☆
		                                	<%} else if(r.getRevRate() == 4) {%>
		                                		★★★★☆
		                                	<%} else {%>
		                                		★★★★★
		                                	<% } %>
	                                	</span>
										<span style="font-size : 15px; color:rgb(109, 109, 109); padding-left:5px;">가격</span>
										<%=decFormat.format(price) %>원
	                                </td>
	                                <td colspan="2" style="text-align: right;">
	                                <%=r.getRevWriter() %>
	                                </td>
	                            </tr>
	                        </table>
                        </td>
                    </tr>
                    
					<tr>
						<td colspan="3">
                            <div>
                                <p style="height:150px; padding : 15px; padding-top:5px;"><%=r.getRevContent() %></p>
                            </div>
                        </td>
					</tr>
	                    <tr>
	                   		<td style="padding : 5px; padding-top: 0px;"colspan="3" align="left">
								<% for(int i = 0; i < list.size(); i++){ %>
									<img id="titleImg" style="height:300px" src="<%=contextPath %><%=list.get(i).getFilePath() + list.get(i).getChangeName()%>">
									<br>
								<% } %>
							</td>
						</tr>
                    
                </table>
                
                 <script>
	            	function del(){
	            		
	            		if(confirm("삭제하시겠습니까?")){
	                        return true;
	            		}else{
	                        return false;
	                    }
	            	
	            	}
	            </script>
                <br><br>

                <div align="center" style="border-radius: 20px; box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
                	<%if(r.getRevReply() != null){ %>
	                    <table id="reply" align="center" style="width:800px; background:rgb(244, 244, 244);">
	                    	<tbody>
		                        <tr>
		                            <td align="left" style="padding:15px;"><%=r.getRevReplyDate() %></td>
		                        </tr>
		                        <tr width="800">
		                            <td id="reply-content" style="padding:15px; padding-top:7px; height:100px; vertical-align:top">
		                               	 <%=r.getRevReply() %>
		                            </td>
		                        </tr>
	                    	</tbody>
	                    </table>
					<% } %>

					
					
					<%if(loginUser != null && loginUser.getUserStatus().equals("A")){ %>
					<form action="<%=contextPath %>/rinsert.rs" method="post">
                      	<input type="hidden" name="revNo" value="<%=r.getRevNo() %>">
                      	<input type="hidden" name="userId" value="<%=r.getRevWriter() %>">
                      	<input type="hidden" name="price" value="<%=s.getSubscriptPrice() %>">
                      	<input type="hidden" name="exContent" value="<%=r.getRevReply() %>">
	                    <table style="background:rgb(244, 244, 244); width:800px;">
	                        <tbody>
	                            <tr>
	                                <td style="padding-left : 5px; padding-right : 5px;" align="center">
	                                    <textarea name="content" cols="105" rows="5" style="resize:none; margin-top:20px;"></textarea>
	                                </td>
	                            </tr>
	                            <tr align="right">
	                                <td  style="height: 30px; border-top:1px solid rgb(255, 255, 255); padding: 0; margin: 0; padding-right : 17px;"><button type="submit" id="reply-btn" style="height:25px;">등록</button></td>
	                            </tr>
	                        </tbody>
	                    </table>
                    </form>
                   <% } %>
                </div>
				<br><br>
				<a align="center" id="list-btn" href="<%=contextPath %>/list.rs?cpage=1" id="list-btn" class="btn btn-sm btn-primary">목록으로</a>
            </div>
        </div>
    </div>

</body>
</html>