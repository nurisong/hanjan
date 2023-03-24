<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product.model.vo.Product, java.util.ArrayList" %>   
<%
	ArrayList<Product> listFirst=(ArrayList<Product>)request.getAttribute("listFirst");//첫화면에서 보여줄 최대 10개의 데이터

	int listCount= (int)(request.getAttribute("listCount"));	

	int pagesNum= ((int)((listCount-1)/10))+1; // ########## list.size() =0일때 처리 해줘야함
	
	
	
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록관리</title>

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
button[id$=MoveP]{
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
				<h2>상품등록관리-수정관리</h2>		
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
		        
		        <form action="<%=contextPath%>/enrollMove.pro" method="post" >
			        <div id="listForm">
			        	
			            <table border="1" id="listTable" >
			                <thead id="listHead" >
			
			                    <th class="tableColumn1"></th>
			                    <th class="tableColumn2">상품명</th>
			                    <th class="tableColumn3" >상품판매가격</th>
			                    <th class="tableColumn4">용량(ml)</th>
			                    <th class="tableColumn5">도수</th>
			                    <th class="tableColumn6">주종</th>
			                    <th class="tableColumn7">재고량</th>
			                    <th class="tableColumn8">설명</th>
			                    <th class="tableColumn9">노출상태</th>
			                
			                </thead>
			                  
							<tbody id="listBody">
								<% if(listFirst !=null) { %>
									<% for(int i=0;i<listFirst.size();i++){%>
										<tr>
											<td><input type="checkbox" class="checkPro" name="checkProducts" value=<%=listFirst.get(i).getProductNo() %> ></td>
											<td><%=listFirst.get(i).getProductName() %></td>
											<td><%=listFirst.get(i).getProductPrice() %></td>
											<td><%=listFirst.get(i).getProductVolume() %></td>
											<td><%=listFirst.get(i).getProductAlcohol() %></td>
											<td><%=listFirst.get(i).getProductType() %></td>
											<td><%=listFirst.get(i).getproductStock() %></td>
											<td class="textAreaTd<%=i %>"><%=listFirst.get(i).getProductDetail() %></td>
											<td><%=listFirst.get(i).getProductShow() %></td>
											
										</tr>
										
									<%} %>
								<%} else{%>
										<p>상품이 없습니다</p>
								<%  } %>
							</tbody>
							
			            </table>
			            
			            
			            
			            <!-- 정보를 나눠주기 위한 hidden pageChoice 가 들어감-->
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
		            
		            			
			            
			            <% if(pagesNum<=10) { %>
				            <% for(int i=1;i <= pagesNum; i++) { %>  
				            		
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
		        
		        <!-- ajax 추가 힘들면 안함 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		        <!-- hidden text들 -->
		        <input type="hidden" id="hiddenA"><!-- 페이지 하단바 개수 -->
		        <input type="hidden" id="hiddenB"><!--검색한 페이지 총개수  -->
		        <input type="hidden" value="1" id="pageIntP">
		        <input type="hidden" id="hiddenWord">
		        
       			
       			
       			<script>
       				$(function(){
       					
       					
       					
       					$('#searchButton').on('click',function(){       						
       						var searchWords=$('#searchText').val()
       						$('#pageIntP').val(1);
       						
       						$.ajax({
								url:'searchAjax.pro',
								type:'post',
								data:{
									'searchWords':searchWords
								},
								success:function(pList){
									
									var pLength=pList.length;
									var pTenA=Math.floor((pLength-1)/10)+1;
									var resultStr='';
									var resultStr2='';
									$('#hiddenA').val(pTenA);
									$('#hiddenB').val(pLength);
									$('#hiddenWord').val(searchWords);
									
									if(pLength==0){
										$('#listBody').html('검색 상품이 없습니다')
									}
									
									if(pLength>10){
										for(var i=0;i<10;i++){
											resultStr+='<tr>'
				  								   +'<td>'+'<input type="checkbox" class="checkPro" name="checkProducts" value="'+pList[i].productNo +'" > ' + '</td>'
				  								   +'<td>'+pList[i].productName+'</td>'
				  								   +'<td>'+pList[i].productPrice+'</td>'
				  								   +'<td>'+pList[i].productVolume+'</td>'
				  								   +'<td>'+pList[i].productAlcohol+'</td>'
				  								   +'<td>'+pList[i].productType+'</td>'
				  								   +'<td>'+pList[i].productStock+'</td>'
				  								   +'<td>'+pList[i].productDetail+'</td>'
				  								   +'<td>'+pList[i].productShow+'</td>'
				  								   +'</tr>'											
										}
										$('#listBody').html(resultStr)
										
										console.log($('.listBottom-bar'))
										
										resultStr2+='<button onclick=LeftMoveP(); disabled id="leftMoveP">&lt;</button>'																			
											if(pTenA<=10){
												for(var i=1;i<=pTenA;i++){
													resultStr2+='<span id="SpanP'+i+'">'
															    +'<input type="button" class="pagessP'+i+ '"  onclick="pageMovingP(' +i+  ');" id="pagesP'+ i  +'" value="'+ i  +'" >'
															    +'</span>'														    	
												}										
											}else{
												for(var i=1;i<=10;i++){
												resultStr2+='<span id="SpanP'+i+'">'
														    +'<input type="button" class="pagessP'+i+ '"  onclick="pageMovingP(' +i+  ');" id="pagesP'+ i  +'" value="'+ i  +'" >'
														    +'</span>'	
												}										
											}																				       								        	
										resultStr2+='<button onclick=rightMoveP(); id="rightMoveP">&gt;</button>'
											
											
										$('.listBottom-bar').html(resultStr2);
									}
									

									if(pLength > 0 && pLength < 10){
										for(var i=0;i<pLength;i++){
											resultStr+='<tr>'
					  								   +'<td><input type="checkbox" class="checkPro" name="checkProducts" value="'+pList[i].productNo +'" ></td>'
					  								   +'<td>'+pList[i].productName+'</td>'
					  								   +'<td>'+pList[i].productPrice+'</td>'
					  								   +'<td>'+pList[i].productVolume+'</td>'
					  								   +'<td>'+pList[i].productAlcohol+'</td>'
					  								   +'<td>'+pList[i].productType+'</td>'
					  								   +'<td>'+pList[i].productStock+'</td>'
					  								   +'<td>'+pList[i].productDetail+'</td>'
					  								   +'<td>'+pList[i].productShow+'</td>'
					  								   +'</tr>'
										}
										$('#listBody').html(resultStr);
										
										resultStr2+='<button onclick=LeftMoveP(); disabled id="LeftMoveP">&lt;</button>'																			
											if(pTenA<=10){
												for(var i=1;i<=pTenA;i++){
													resultStr2+='<span id="SpanP'+i+'">'
															    +'<input type="button" class="pagessP'+i+ '"  onclick="pageMovingP(' +i+  ');" id="pagesP'+ i  +'" value="'+ i  +'" >'
															    +'</span>'														    	
												}										
											}else{
												for(var i=1;i<=10;i++){
												resultStr2+='<span id="SpanP'+i+'">'
														    +'<input type="button" class="pagessP'+i+ '"  onclick="pageMovingP(' +i+  ');" id="pagesP'+ i  +'" value="'+ i  +'" >'
														    +'</span>'	
												}										
											}																				       								        	
										resultStr2+='<button onclick=rightMoveP(); id="rightMoveP">&gt;</button>'
											
											
										$('.listBottom-bar').html(resultStr2);
									}			   
									$('.pagessP1').attr('disabled',true);			
								},
								error:function(){
									console.log("페이지 실패");
								}
       					
       						})
    						
   						
       					})	
       				
       					
       				})
       			</script>
       			<script>
    				
       				//첫시작시 1번 비활성화
       				$(function(){
       					$('.pagess1').attr('disabled',true);
       					
       					for(var i=0;i<10;i++){
       						var ww=$('.textAreaTd'+i).html();
       						
       						
       						if( ww.substr(0,11)!=ww.substr(0,12)){
       							$('.textAreaTd'+i).html(ww.substr(0,11)+'...');
       						} else{
       							$('.textAreaTd'+i).html(ww.substr(0,11));
       						}
       						
       						//$('.textAreaTd'+i).html(ww.substr(0,15));
       					}
       					
       					
       					
       					
       				});
       			
       			
	       			function pageMovingP(pageChoiceP){
	
	       				var pagesNumP=$('#hiddenA').val();
	       				var allCountP=$('#hiddenB').val();
	       				var searchWord=$('#hiddenWord').val();
	
	       				var X1=(pageChoiceP);//클릭 하단바를 10으로 나눈 나머지
	       				var X2=Math.floor(((pageChoiceP-1)/10));//클릭 하단바를 10으로 나눈 몫 페이지 11~20 21~30 31~40표시
	       				var Y1=(pagesNumP);//최대페이지수를 10으로 나눈 나머지 최대 페이지에서 끝값을 표시할때 사용
	
	       				if(X1==0){
	       					X1=10;
	       				}
	
	       				for(var z=1;z<=10;z++){
	       					$('#pagesP'+z).attr('onclick','pageMovingP('+(X2*10+z)+')');
	       					$('#pagesP'+z).attr('value',X2*10+z);
	       					$('#pagesP'+z).attr('class','pagessP'+(X2*10+z));
	       				}
	
	       				if(pagesNumP>(X2*10) && pagesNumP<(X2*10)+10){//최대페이지수 로 표시
	
	       					if((Y1==0)){
	       						Y1=10;
	       					}
	
	       					for(var z=(Y1+1);z<=10;z++){
	       						$('#spanP'+z).children().attr('hidden',true);
	       					}
	
	       				}else{
	       					for(var z=1;z<=10;z++){
	
	       						$('#pagesP'+z).attr('onclick','pageMovingP('+((X2*10)+z)+')');
	       						$('#spanP'+z).children().attr('hidden',false);
	       					}
	       				}
	
	       				$.ajax({
	       					url:'searchListBar.pro',
	       					type:'post',
	       					data:{
	       						'pagesChoiceP':pageChoiceP,
	       						'pagesNumP':pagesNumP,
	       						'allCountP':allCountP,
	       						'searchWord':searchWord
	       					},
	       					success:function(listLastP){
	
	       						$('#pageIntP').val(pageChoiceP);
	
	       						var resultStr='';
	
	       						for(var j in listLastP){
	       							resultStr+='<tr>'
	       								+'<td><input type="checkbox" class="checkPro" name="checkProducts" value='+listLastP[j].productNo+'></td>'
	       								+'<td>'+listLastP[j].productName+'</td>'
	       								+'<td>'+listLastP[j].productPrice+'</td>'
	       								+'<td>'+listLastP[j].productVolume+'</td>'
	       								+'<td>'+listLastP[j].productAlcohol+'</td>'
	       								+'<td>'+listLastP[j].productType+'</td>'
	       								+'<td>'+listLastP[j].productStock+'</td>'
	       								+'<td>'+listLastP[j].productDetail+'</td>'
	       								+'<td>'+listLastP[j].productShow+'</td>'
	       								+'</tr>'
	       						}
	
	       						$('#listBody').html(resultStr);
	
	       						
	
								
	       						//1이 지났을때 '<'버튼 활성화
	       						if(pageChoiceP>1){
	       							$('#leftMoveP').attr("disabled",false);
	       						} else{
	       							$('#leftMoveP').attr("disabled",true);
	       						}
	       						
	       						
	       						//maxpage시 '>'버튼 비활성화
	       						if($('#pageIntP').val()>=(Math.floor((allCountP-1)/10))+1) {
	       							$('#rightMoveP').attr("disabled",true);
	       						}else{
	       							$('#rigthMoveP').attr("disabled",false);
	       						};
	       						
	       						//숫자 버튼 비활성화 활성화
	       						var t=parseInt($('#pageIntP').val());
	
	       						$('input[class^=pagessP').attr("disabled",false);
	       						$('.pagessP'+t).attr("disabled",true);
	
	
	       					},
	       					error:function(){
	       						console.log("페이지 실패");
	       					}
	
	
	
	       				})
	
	       			}
	       			
	       			function leftMoveP(){
	       				pageMovingP(parseInt($('#pageIntP').val())-1);
	       			}
	       			function rightMoveP(){
	       				pageMovingP(parseInt($('#pageIntP').val())+1);
	       			}
       			</script>
       			<!-- ajax 추가 힘들면 안함 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
       
		        
		        <script>
		        	
				    $(function(){
				        $('#showStatusBtn').click(function(){
				            
				            if( $('input:checked')[0]==undefined ){
				            	alert("삭제할 품목을 선택해주세요")
				            	
				            } else{				            	 
				            	var ff= $('<form action="showstatus.pro" method="post"></form>')				            	  							
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
								alert("수정할 품목을 1개만  선택해주세요")
								
								
								$('input:checked').prop('checked',false);
							} else if($('input:checked').length == 1){
								
								
								var ff= $('<form action="pupdate.pro" method="post"></form>')
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
						
						
						
						var pagesNum=<%=pagesNum%>;

						    var calX1=(pageChoice%10); //클릭 하단바를 10으로 
						    var calX2=Math.floor(((pageChoice-1)/10));//클릭 하단바를 10으로 나눈 몫 페이지 11~20 21~30 31~40표시
						    var calY1=(pagesNum%10);//최대페이지수를 10으로 나눈 나머지 최대 페이지에서 끝값을 표시할때 사용
						    
						    
						    
						    if(calX1==0){
						        calX1=10;
						    }
						   
						    for(var z=1;z<=10;z++){// 34일때 마지막일때
						        $('#pages'+z).attr('onclick','pageMoving('+ (calX2*10+z) +')');
						        $('#pages'+z).attr('value',calX2*10+z);
						        $('#pages'+z).attr('class','pagess'+(calX2*10+z));
						    }
						    
						    
						    
						    if(pagesNum>(calX2*10) && pagesNum<(calX2*10)+10){//최대페이지수 로 표시
						        
						        if((calY1==0)){
						            calY1=10
						        }
								
						        for(var z=(calY1+1);z<=10;z++){// 34일때 마지막일때
						            $('#span'+z).children().attr('hidden',true);
						            
						        }
						    } else{
						        for(var z=1;z<=10;z++){// 34일때 마지막일때
						            
						            $('#pages'+z).attr('onclick','pageMoving('+((calX2*10)+z)+')');
						            $('#span'+z).children().attr('hidden',false);
						        }
						    }
						    
						
						
					
						$.ajax({
							url:'listbar.pro',
							type:'post',
							data:{
								'pagesChoice':pageChoice,
								'pagesNum':pagesNum,
								'allCount':<%=listCount%>
							},
							success:function(listLast){
								
								$('#pageInt').val(pageChoice);
								
								
								
								
								var resultStr='';
								
								for(var j in listLast){
									resultStr+='<tr>'
												+'<td><input type="checkbox" class="checkPro" name="checkProducts" value='+listLast[j].productNo+'></td>'
												+'<td>'+listLast[j].productName+'</td>'
												+'<td>'+listLast[j].productPrice+'</td>'
												+'<td>'+listLast[j].productVolume+'</td>'
												+'<td>'+listLast[j].productAlcohol+'</td>'
												+'<td>'+listLast[j].productType+'</td>'
												+'<td>'+listLast[j].productStock+'</td>'
												+'<td>'+listLast[j].productDetail+'</td>'
												+'<td>'+listLast[j].productShow+'</td>'
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
								if($('#pageInt').val()>=(Math.floor((<%=listCount%>-1)/10))+1  ){
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