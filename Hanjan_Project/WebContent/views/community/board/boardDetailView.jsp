<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.hj.community.board.model.vo.Board, com.hj.common.model.vo.Attachment" %>
<%
	
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">
<style>

    .outer{
        font-family: 'Pretendard-Regular';
    
    } 
    #reply-area td{
        padding-left:7px;
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
    #board-btn a{
		background-color: rgb(233, 233, 233);
		display:inline-block;
		width:40px;
		height:22px;
		text-align: center;
		padding-top:3px;
		border-radius: 5px;
		margin:3px;
	}
    #reply-btn, .del-btn, .upd-btn{
		background-color: rgb(228, 228, 228);
		border-radius: 5px;
		width:40px;
		height:22px;
		border:none;
	}
    #board-btn a:hover, #reply-btn:hover, #list-btn:hover, .del-btn:hover{
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
            
                <table align="center" id="detail-area" style="border-bottom:0.3px solid rgb(233, 233, 233);">
                    <tr>
                        <td colspan="3">
                            <br>
                            <h2 onclick='location.href="<%=contextPath%>/list.rs?cpage=1"' align="left">일반 게시판</h2>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td id="board-btn" style="text-align:right;">
                            <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())){%>
                                <a href="<%=contextPath %>/updateForm.bo?bno=<%=b.getBoardNo() %>" class="btn btn-info btn-sm">수정</a>
                                <a href="<%=contextPath %>/delete.bo?bno=<%=b.getBoardNo() %>" onclick="return del();" class="btn btn-info btn-sm">삭제</button>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table style="padding : 5px; border-bottom:0.3px solid rgb(233, 233, 233);" width="800" >
                                <tr>
                                    <td  colspan="2" style="font-size : 22px; padding:5px; padding-left:0px;">
                                        <%=b.getBoardTitle() %>
                                    </td>
                                    <td style="text-align: right; padding-bottom:0px; color:rgb(77, 77, 77);">
                                        <%=b.getBoardWriter() %>
                                    </td>
                                </tr>
                                <tr>  
                                    <td style="padding:5px; color:rgb(122, 122, 122);">
                                        <%=b.getBoardDate() %> 
                                    </td>  
                                    <td  style="font-size : 15px; text-align: right;">
                                        
                                    </td>
                                    <td colspan="2" style="text-align: right; color:rgb(77, 77, 77);">
                                       	 조회수 : <%=b.getBoardCount()%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left:10px">
                                <% if(at == null){ %>
                                <% } else { %>
                                &nbsp;<a download="<%= at.getOriginName() %>" href="<%=contextPath %><%=at.getFilePath() %><%=at.getChangeName() %>"><%=at.getOriginName() %></a>
                                <% } %>
                        </td>
                    </tr>
                
                    <tr>
                        <td colspan="3">
                            <div>
                                <p style="height:300px; padding-top: 22px; padding-left:15px;"><%=b.getBoardContent() %></p>
                            </div>
                        </td>
                    </tr>
                </table>
                
                <br>
                
                <script>
                    function del(){
                        
                        if(confirm("삭제하시겠습니까?")){
                            return true;
                        }else{
                            return false;
                        }
                    
                    }
                </script>
                

                
                <div align="center" style="border-radius: 20px; box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
                    
                        <table id="reply-area" align="center" style="width:800px; background:rgb(244, 244, 244);">
                            <tbody>
                                <tr>
                                    <td align="left" style="padding:15px;">유저이름&nbsp;&nbsp;|&nbsp;&nbsp;2022-02-02</td>
                                </tr>
                                <tr width="800">
                                    <td style="padding:15px; padding-top:7px; height:100px; vertical-align:top">
                                            	댓글내용
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    

                    
                    
                    <%if(loginUser != null && !loginUser.getUserStatus().equals("N")){ %>
                        <table style="background:rgb(244, 244, 244); width:800px;">
                            <tbody>
                                <tr>
                                    <td style="padding-left : 5px; padding-right : 5px;" align="center">
                                        <textarea id="reply-content" cols="105" rows="5" style="resize:none; margin-top:20px;"></textarea>
                                    </td>
                                </tr>
                                <tr align="right">
                                    <td  style="height: 30px; border-top:1px solid rgb(255, 255, 255); padding: 0; margin: 0; padding-right : 17px;">
                                    	<button onclick='insertReply();' type="button" style="height:25px;" id="reply-btn">등록</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    <% } else{%>
                        <table style="background:rgb(244, 244, 244); width:800px;">
                            <tbody>
                                <tr>
                                    <td style="padding-left : 5px; padding-right : 5px;" align="center">
                                        <textarea cols="105" rows="5" style="resize:none; margin-top:20px;" readonly placeholder="로그인 후 이용해주세요"></textarea>
                                    </td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                            </tbody>
                        </table>
                    <% } %>
                    
                </div>
                <br><br>
                    <a align="center" href="<%=contextPath %>/list.bo?cpage=1" id="list-btn" class="btn btn-sm btn-primary">목록으로</a>
            </div>
            
            <script>
            
	           	function selectReplyList(){
	
	    			$.ajax({
	    				url : 'rlist.bo',
	    				data : {bno : <%= b.getBoardNo() %>},
	    				success : function(list){
	    					var result = '';
	    					for(var i in list){
                                <% if(loginUser != null){%>
                                    if(list[i].replyWriter == '<%=loginUser.getUserId()%>'){
                                        result += '<tr>'
                                                + '<td align="left" style="padding:10px; padding-left:20px; font-size:17px;">' + list[i].replyWriter + '</td>'
                                                + '<td align="right" style="padding-top:10px;">'
                                                + '<button style="margin-right:15px;" type="button" class="del-btn"'
                                                + 'value="' + list[i].replyNo
                                                + '">삭제</button></td>'
                                                + '</tr>'
                                                + '<tr width="800">'
                                                + '<td colspan="2" style="padding:10px; padding-left:20px;padding-top:7px; vertical-align:top font-size:15px;">'
                                                +  list[i].replyContent
                                                + '</td>'
                                                + '</tr>'
                                                + '<tr>' + '<td colspan="2" align="left" style="border-bottom:0.3px solid lightgrey; padding:10px; padding-left:20px; font-size:14px;"><span style="color:rgb(77, 77, 77);">' + list[i].replyDate + '</span></td><tr>'
                                    }
                                    else{
                                        result += '<tr>'
                                                + '<td colspan="2" align="left" style="padding:10px; padding-left:20px; font-size:17px;">' + list[i].replyWriter + '</td>'
                                                + '</tr>'
                                                + '<tr width="800">'
                                                + '<td colspan="2" style="padding:10px; padding-left:20px;padding-top:7px; vertical-align:top font-size:15px;">'
                                                +  list[i].replyContent
                                                + '</td>'
                                                + '</tr>'
                                                + '<tr>' + '<td colspan="2" align="left" style="border-bottom:0.3px solid lightgrey; padding:10px; padding-left:20px; font-size:14px;"><span style="color:rgb(77, 77, 77);">' + list[i].replyDate + '</span></td><tr>'
                                    }
                                <% } else{%>
                                    result += '<tr>'
                                                + '<td colspan="2" align="left" style="padding:10px; padding-left:20px; font-size:17px;">' + list[i].replyWriter + '</td>'
                                                + '</tr>'
                                                + '<tr width="800">'
                                                + '<td colspan="2" style="padding:10px; padding-left:20px;padding-top:7px; vertical-align:top font-size:15px;">'
                                                +  list[i].replyContent
                                                + '</td>'
                                                + '</tr>'
                                                + '<tr>' + '<td colspan="2" align="left" style="border-bottom:0.3px solid lightgrey; padding:10px; padding-left:20px; font-size:14px;"><span style="color:rgb(77, 77, 77);">' + list[i].replyDate + '</span></td><tr>'

                                <% } %>
                              
	    					}
	    					
	    					$('#reply-area tbody').html(result);
	    				},
	    				error : function(){
	    					console.log('댓글읽어오기 실패');
	    				}
	    				
	    			});
	    		};
	    		
	    		
	    		$(function(){
	    			
	    			selectReplyList();
	    			
	    			setInterval(selectReplyList, 1000);
	    			
	    			
	    		});
	    		
	    		$(document).on("click",".del-btn",function(){
		    			if(confirm('삭제하시겠습니까?')){
		    				$.ajax({
		    					url : 'rDelete.bo',
		    					type : 'post',
		    					data : {
		    						replyNo : $(this).val(),
		    						boardNo : <%=b.getBoardNo()%>
		    					},
		    					success : function(result){
		    						if(result > 0){
		    							alert('댓글 삭제 완료');
		    						}
		    					},
		    					error : function(){
		    						console.log('댓글 삭제 실패');
		    					}
		    				})
		    			}
		    	})
	    			
	    		
	    		
            	function insertReply(){
            		$.ajax({
            			url : 'rinsert.bo',
            			data : {
            				bno : <%= b.getBoardNo() %>,
            				content : $('#reply-content').val()
            			},
            			type : 'post',
            			success : function(result){
            				if(result > 0){
            					
            					$('#reply-content').val('');
            					
            					selectReplyList();
            					
            				}
            			},
            			error : function(){
            				console.log('댓글작성실패');
            			}
            		})
            	}
            </script>
        </div>
    </div>
</body>
</html>