<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription, java.util.ArrayList" %>   
<%
	ArrayList<Subscription> slistFirst=(ArrayList<Subscription>)request.getAttribute("slistFirst");

	int slistCount= (int)(request.getAttribute("slistCount"));	

	int sPagesNum= ((int)((slistCount-1)/10))+1; // ########## list.size() =0일때 처리 해줘야함
	
	
	
	
	
	//int allCount=listFirst.size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독등록관리</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.main-outer {
    float: right;
    width: 1630px;
    height: 1200px;
}



.table-body{
	margin-left: 100px;
	margin-top: 100px;
	width: 820px;
}

.titleScope{
	margin-left: 130px;
}
.headBlank{
	height: 50px;
}
.searchBlank{
	height: 20px;
}




#searchScope{
	height: 30px;
	border: 1px solid rgb(52, 73, 94);
	width: 255px;
	margin-left: 543px;
	
}
#searchText{
	width: 200px;
	outline: none;
	border: 0px;
	padding: 5px;
	height: 28px;
	padding: 0;
}
#searchButton{
	width: 20%;
	height: 28px;
	border: 0px;
	outline: none;
	float: right;
	background-image: url(https://www.pngmart.com/files/8/Search-Button-PNG-HD-Quality.png); 
	background-repeat: no-repeat;
	background-size: 45px 30px;
	padding: 0;
}
#searchForm{
	height: 100%;
}
/* ------------------------------------ */

#listForm{
	height:301px;
}
#listHead{
		background-color: rgb(220, 216, 216);
}

#listTable{
	width: 800px;
}
th[class^=tableColumn]{
	text-align: center;
}
.tableColumn1{
	width: 25px;
}
.tableColumn2{
	width: 170px;
}
.checkPro{
	width: 100%;
	height: 100%;
}
.tableColumn3{
	width: 130px;
}



/* ----------------------------- */
#enrollButton{
	margin-left: 610px;
}
.enrollButton{
	background-color: rgb(52, 73, 94);
	color: white;
	width: 50px;
	margin-left: 10px;
}
.height10px{
	
	height: 10px;
		
}
/* ----------------------- */
.listBottom-bar{
	margin-left: 200px;
}
input[class^=pagess]{
	font-weight: 700;
	background-color: white;
	border-width: 0px;
	margin-left: 2px;
	margin-right: 2px;
	color: black;
}

input[class^=pagess]:hover{
        cursor:pointer;
        color: brown;
    }
    
input[disabled]{
  opacity: 0.4;
  cursor: default;
  pointer-events: none;
}

    
    
button[id$=Move]{
	background-color: white;
	font-weight: 700;
	border-width: 0px;

}
</style>
</head>
<body>
	
	<%@ include file="../admin/aSidebar.jsp" %>
	
	<div class="main-outer">
        <div class="table-body">	

			<div class="titleScope">
				<h2>구독등록관리-수정관리</h2>		
			</div>

			<div class="headBlank"></div>

			<div id="searchScope">
				<form action="" id="searchForm">
					<input  type="text" id="searchText" placeholder="상품명 검색"> 
					<input type="button" id="searchButton">
				</form>
			</div>
			
			<div class="searchBlank">

			</div>
			
			
			 <div class="controlProduct">
		        
		        <form action="<%=contextPath%>/enrollMove.sub" method="post" >
			        <div id="listForm">
			        	
			            <table border="1" id="listTable" >
			                <thead id="listHead" >
			
			                    <th class="tableColumn1"></th>
			                    <th class="tableColumn2">구독상품명</th>
			                    <th class="tableColumn3" >판매가격</th>
			                    <th class="tableColumn4">구독연월</th>
			                    <th class="tableColumn5">구독상세정보</th>
			                    <th class="tableColumn6">구독상태</th>
			                    
			                
			                </thead>
			                  
							<tbody id="listBody">
								<% if(slistFirst !=null) { %>
									<% for(Subscription s:slistFirst) {%>
										<tr>
											<td><input type="checkbox" class="checkPro" name="checkProducts" value=<%=s.getSubscriptNo() %> ></td>
											<td><%=s.getSubscriptName() %></td>
											<td><%=s.getSubscriptPrice() %></td>
											<td><%=s.getSubscriptMonth() %></td>
											<td><%=s.getSubscriptDetail() %></td>
											<td><%=s.getSubscriptStatus() %></td>
											
											
										</tr>
										
									<%} %>
								<%} else{%>
										<p>구독상품이 없습니다</p>
								<%  } %>
							</tbody>
							
			            </table>
			            
			            
			            
			            <!-- 정보를 나눠주기 위한 hidden -->
			            <input type="hidden" value="1" id="pageInt">
			            
			            
			            
			        </div>
			        
			        <div class="height10px">
			
					</div>
			
					<br>
	
					<div id="enrollButton">
						<input id="reviseBtn" type="button" value="수정" class="enrollButton">
						
						<input id=enrollBtn type="submit" value="등록" class="enrollButton">
						<input id=showStatusBtn type="button" value="삭제" class="enrollButton">
					</div>
				</form>
				
				
		
		
				<div class="height10px">
		
				</div>
				
					<br>
		        
		            <div class="listBottom-bar" >
		            	
		            	<button onclick=leftMove(); disabled id="leftMove">&lt;</button>
		            
		            		
			            
			            <% if(sPagesNum<=10) { %>
				            <% for(int i=1;i <= sPagesNum; i++) { %>  
				            		
				            		<span id="span<%=i%>">
				            		
				            		
									<input type="button" class="pagess<%=i %>"  onclick='pageMoving(<%=i %>);' id="pages<%=i %>" value="<%=i %>" >						
									</span>        	
									
				            <% } %>
				        <% } else{%>
				        	<% for(int i=1;i <= 10; i++) { %>
				        			<span id="span<%=i%>">
				            		
				            		
									<input type="button" class="pagess<%=i %>" onclick='pageMoving(<%=i %>);' id="pages<%=i %>" value="<%=i %>" >						
									</span> 
							<% } %>
				        <% } %>    
		            	<button onclick=rightMove(); id="rightMove">&gt;</button>
		            
		            </div>
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        
		        <script>
				    $(function(){
				        $('#showStatusBtn').click(function(){
				            
				            if( $('input:checked')[0]==undefined ){
				            	alert("삭제할 구독상품을 선택해주세요")
				            	
				            } else{
	            	 
				            	 var ff= $('<form action="showStatus.sub" method="post"></form>')
					
	    						var arr=[];
	    							
	    							
	    						for(var i=0;i<$('input:checked').length;i++){
	    							arr.push($('<input type="hidden" name="checkProducts" value="'+ $('input:checked').eq(i).val()  +'"  >'));
	    						}
										    							
	    						for(var i=0;i<$('input:checked').length;i++){
	    							ff.append(arr[i])
	    						}    								    								    						
				            	 $(document.body).append(ff);				            	 				            	 
				            	 ff.submit();
			            	
				            }
				            
				            
				        })
				    })
				    
				    
				</script>
		        
				<script>
					$(function(){
						
						$('#reviseBtn').click(function(){
							
							if($('input:checked').length > 1){
								alert("수정할 구독상품을 1개만  선택해주세요")						
								$('input:checked').prop('checked',false);
							} else if($('input:checked').length == 1){
								
								
								var ff= $('<form action="sUpdate.sub" method="post"></form>')
								var bb=$('<input type="hidden" name="checkProducts" value="'+ $('input:checked').val()  +'">')
								ff.append(bb);
								$(document.body).append(ff);
								ff.submit();
								
								
							} else{
								alert("수정할 품목을  선택해주세요")
							}
						
							
						})
						
					})
				
				
				
				</script>
		            
				<script>
		
					function pageMoving(pageChoice){
						
						
						
						var sPagesNum=<%=sPagesNum%>;
						
						
							
						
						
						
						    var calX1=(pageChoice%10); //클릭 하단바를 10으로 
						    var calX2=Math.floor(((pageChoice-1)/10)); 
						    var calY1=(sPagesNum%10);//최대페이지수를 10으로 나눈 나머지 최대 페이지에서 끝값을 표시할때 사용
						    
						    
						    
						    if(calX1==0){
						        calX1=10;
						    }
						   
						    for(var z=1;z<=10;z++){// 34일때 마지막일때
						        $('#pages'+z).attr('onclick','pageMoving('+ (calX2*10+z) +')');
						        $('#pages'+z).attr('value',calX2*10+z);
						        $('#pages'+z).attr('class','pagess'+(calX2*10+z));
						    }
						    
						    
						    
						    if(sPagesNum>(calX2*10) && sPagesNum<(calX2*10)+10){//최대페이지수 로 표시
						        
						        if((calY1==0)){
						            calY1=10
						        }
								
						        for(var z=(calY1+1);z<=10;z++){// 34일때 마지막일때
						            $('#span'+z).children().attr('hidden',true);
						            
						        }
						    } else{
						        for(var z=1;z<=10;z++){// 34일때 마지막일때
						            
						            $('pages'+z).attr('onclick','pageMoving(calX2*10+z)');
						            $('#span'+z).children().attr('hidden',false);
						        }
						    }
						    
						
						
						
						
						
						
						
						
						
						
						$.ajax({
							url:'sListbar.sub',
							type:'post',
							data:{
								'pagesChoice':pageChoice,
								'sPagesNum':sPagesNum,
								'allCount':<%=slistCount%>
							},
							success:function(listLast){
								
								$('#pageInt').val(pageChoice);
								
								
								
								
								var resultStr='';
								
								for(var j in listLast){
									resultStr+='<tr>'
												+'<td><input type="checkbox" class="checkPro" name="checkProducts" value='+listLast[j].subscriptNo+'></td>'
												+'<td>'+listLast[j].subscriptName+'</td>'
												+'<td>'+listLast[j].subscriptPrice+'</td>'
												+'<td>'+listLast[j].subscriptMonth+'</td>'
												+'<td>'+listLast[j].subscriptDetail+'</td>'
												+'<td>'+listLast[j].subscriptStatus+'</td>'												
												+'</tr>'
												
								}
								
								$('#listBody').html(resultStr);
								
								
								// 1이 지났을때 '<' 버튼 활성화 
								if(pageChoice>1){
									$('#leftMove').attr("disabled",false);
								} else{
									$('#leftMove').attr("disabled",true);
								};
								
								
								
								
								//maxpage시 버튼 비활성화
								if($('#pageInt').val()>=(Math.floor((<%=slistCount%>-1)/10))+1  ){
									$('#rightMove').attr("disabled",true);
								} else{
									$('#rightMove').attr("disabled",false);
								};
								
								
								//숫자 버튼 비활성화 활성화
								var t=parseInt($('#pageInt').val());
								
								
								$('input[class^=pagess]').attr("disabled",false);
								$('.pagess'+t).attr("disabled",true);
								
								
								
								
								
							},
							error:function(){
								console.log("페이지 실패");
							}
							
					
						})
					}	
					
					function leftMove(){	
						pageMoving(parseInt($('#pageInt').val())-1);								
					}
					
					function rightMove(){
						pageMoving(parseInt($('#pageInt').val())+1);
					}
					
					
				</script>            
		            
		        
		    </div>
		</div>
    </div>
</body>
</html>