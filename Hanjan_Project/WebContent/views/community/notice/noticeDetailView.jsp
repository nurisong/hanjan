<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.hj.community.board.model.vo.Board' %>
<%
	Board n = (Board)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    .outer{
        font-family: 'Pretendard-Regular';
       
    } 
	pre{
        font-family: 'Pretendard-Regular';
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
    #list-btn:hover{
		cursor:pointer;
		opacity:0.8;
	}
	#detail-area h2{
		cursor:pointer;
	}

</style>

</head>
<body>
    
    <div class="outer">
        <div class="main-area">

            <table align="center" id="detail-area" style="border-bottom:0.3px solid rgb(233, 233, 233);"">
                <tr>
                    <td colspan="3">
                        <br>
                        <h2 onclick='location.href="<%=contextPath%>/list.rs?cpage=1"' align="left">공지사항</h2>
                        <br>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="3">
                        <table style="padding : 5px; border-bottom:0.3px solid rgb(233, 233, 233);" width="800" >
                            <tr>
                                <td  colspan="2" style="font-size : 22px; padding:5px;">
                                    <%=n.getBoardTitle() %>
                                </td>
                                <td style="text-align: right; padding-bottom:0px; color:rgb(77, 77, 77);">
                                    <%=n.getBoardWriter() %>
                                </td>
                            </tr>
                            <tr>  
                                <td style="padding-left:5px; color:rgb(122, 122, 122);">
                                    <%=n.getBoardDate() %> 
                                </td>  
                                <td  style="font-size : 15px; text-align: right; ">
                                    
                                </td>
                                <td colspan="2" style="text-align: right; color:rgb(77, 77, 77);">
                                    	조회수 : <%=n.getBoardCount()%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div>
                            <br>
                            <pre style="height:300px; padding-left:15px;"><%=n.getBoardContent() %></pre>
                        </div>
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
	            <div align="center">
        			<a href="<%=contextPath %>/list.no?cpage=1" id="list-btn">목록으로</a>
        		</div>
        </div>
        
    </div>

</body>
</html>