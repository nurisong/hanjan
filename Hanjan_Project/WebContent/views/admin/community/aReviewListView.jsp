<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.community.review.model.vo.Review, com.hj.product.model.vo.Product, com.hj.common.model.vo.PageInfo" %>
<%
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	String category = (String)request.getAttribute("category");
	String search = (String)request.getAttribute("search");
	
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
<title>리뷰관리자</title>
<style>
	.main-outer {
		float: right;
		width: 1630px;
		height: 1200px;
	}
    .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: 250px;
        margin-top: 5px;
    } 
    .list-area td{
        text-align: center;
    }
    table{
        table-layout: fixed;
    }
    td:not(.revContent){
        overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
    }
	table.type02 {
		border-collapse: separate;
		border-spacing: 0;
		line-height: 1.5;
		border: 1px solid rgb(236, 236, 236);

		/* border-top: 1px solid #ccc;
		border-left: 1px solid #ccc; */
		margin : 20px 10px;
	}
	table.type02 th {
		
		font-weight: 400;
		color:white;
		padding: 5px;
		vertical-align: top;
		border: 1px solid rgb(236, 236, 236);
		/* border-bottom: 1px solid #fff;
		border-top: 1px solid #fff;
		border-left: 1px solid #fff; */
		background: rgb(47, 54, 82);
	}
	table.type02 td {
		
		padding: 7px;
		vertical-align: top;
		border: 1px solid rgb(236, 236, 236);

		/* border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc; */
	}
	#del-btn, #rSearch-btn, #point-btn{
        background-color: rgb(233, 233, 233);
        display:inline-block;
        width:40px;
        height:25px;
        text-align: center;
        border-radius: 5px;
		border:none;
    }
	#rSearch-input{
		border : 1px solid rgb(177, 177, 177);
		margin-right: 3px;
		border-radius: 3px;
		height:20px;
	}
	select[name=rSearch-cat]{
		border : 1px solid rgb(177, 177, 177);
		border-radius: 3px;
		height:23px;
	}
	.list-area>tbody>tr:hover:not(.revContentTr){
        cursor:pointer;
        background:rgb(236, 236, 236);
    }
    #del-btn:hover{
    	cursor:pointer;
        background:rgb(220, 220, 220);
    }
</style>
</head>
<body>

	<%@ include file="../aSidebar.jsp" %>

    <div class="main-outer">
        <div class="outer" align="center">
	        
			<br>
			<h2 align="center">리뷰</h2>
			<br>

			<table align="center" style="width: 840px; margin-bottom:0px;">
				<tr>
					<td>
						<form action="<%=contextPath%>/rSearch.rv">
							<input type="hidden" name="cpage" value="1">
							<select name="rSearchCat">
								<option value="proName">제품명</option>
								<option value="proNo">제품번호</option>
							</select>
							<input id="rSearch-input" name="revSearch" type="text"><button id="rSearch-btn" style="color:black;">검색</button>
						</form>
					</td>
					<td style="text-align:right;">
							<button id="point-btn" type="button" onclick="return upConfirm();" style="color:black;">확인</button> 
							<button id="del-btn" type="button" onclick="return delConfirm();" style="color:black;">삭제</button> 
					</td>
				</tr>
			</table>
	        
			<table class="list-area type02" align="center" border="1" style="margin-top:3px; width:840px"> 
				<thead>
					<tr>
						<th width="30"><input type="checkbox" name="cboxAll" id="cboxAll" onclick="checkAll();"></th>
						<th width="80">글번호</th>
						<th width="90">제품번호</th>
						<th >제품명</th>
						<th width="120">작성자</th>
						<th width="160">작성일</th>
						<th width="90">상태</th>
					</tr>
	
				</thead>
				<tbody>
	                <% if(rList.isEmpty()){ %>
						<tr>
							<td colspan="7" align="center" >
								<%if(category != null){ %>
									'<%=search %>'와 일치하는 검색결과가 없습니다.
								<% } else{ %>
								조회할 목록이 존재하지 않습니다.
								<% } %>
							</td>
						</tr>
					<% } else{%>
		                <%for(int i = 0; i < rList.size(); i++){ %>
							<tr class="tr-main">
								<td onclick="event.stopPropagation()" style="width:20px;"><input name="cbox" type="checkbox" value="<%=rList.get(i).getRevNo() %>"></td>
								<td><%=rList.get(i).getRevNo() %></td>
								<td><%=pList.get(i).getProductNo() %></td>
								<td><%=pList.get(i).getProductName() %></td>
								<td><%=rList.get(i).getRevWriter()%></td>
								<td><%=rList.get(i).getRevDate() %></td>
								<td>
									<%if(rList.get(i).getRevReply() != null){ %>
										완료
									<% } else{%>
										미완료
									<% } %>
								</td>
							</tr>
							<tr class='revContentTr'>
								<th colspan="2" align="center" style="vertical-align:middle">내용</th>
								<td colspan="5" class='revContent'>
									<div style="padding:10px;">
										<%=rList.get(i).getRevContent() %>
									</div>
								</td>
							</tr>
						<% } %>
		            <% } %>
				</tbody>
			</table>

			
			<script>
				function delConfirm(){
					if(confirm("삭제하시겠습니까?")){
						 deleteRev();			
					}
					else{
						return false;
					}
				};
				function upConfirm(){
					if(confirm("포인트를 지급하시겠습니까?")){
						 insertRevPoint();			
					}
					else{
						return false;
					}
				};
				$(function(){
					$('.list-area>tbody>tr').click(function(){
						
						// location.href='<%=contextPath%>/detail.rs?rno='+ $(this).children().eq(1).text(); 
					});
				});
				
				function checkAll(){
					if($('#cboxAll').is(':checked')){
						$("input[name=cbox]").prop("checked", true);
					} else{
						$("input[name=cbox]").prop("checked", false);
					}
				};
				
				 $("input[name=cbox]").click(function(){
					  $("#cboxAll").prop("checked", false);
				 });
				
				
				function deleteRev(){
					
					var rArr = new Array();
					var list = $("input[name='cbox']");
					for(var i = 0; i < list.length; i++){
						if(list[i].checked){
							rArr.push(list[i].value);
						}
					}
					
					$.ajax({
						url : "<%=contextPath%>/aDelete.rs",
						type : "post",
						data : {
							cbox : rArr
						},
						success : function(result){
							if(result > 0){
								location.href = "<%=contextPath%>/aList.rv?cpage=1"
							} else{
								alert("삭제 실패");
							}
						}
					})
				};
				
				$(function(){
					
					$('#comm-side').next().slideDown(0);
					
					$('#comm4').css('font-weight', '600');
					$('#comm4').css('font-size', '21px');
					$('#comm4').css('color', 'grey');
					
					
					$('.tr-main').next().attr('style', "display:none;");
					
					$('.tr-main').click(function(){
						
						var $tr = $(this).next();
						
						if($tr.css('display') == 'none'){
							
							$tr.attr('style', "display:'';");
							
						}
						else{
							$tr.attr('style', "display:none;");
						}
						
					});
					
					if('<%=category%>' != 'null'){
						if('<%=category%>' == "proName"){
							$('select option:eq(0)').prop('selected', true);
						}else{
							$('select option:eq(1)').prop('selected', true);
						}
					};
				})
				
				
				
			</script>

			<br>
			<br>
			
			<%if(!rList.isEmpty()){%>
				<div align="center" class="paging-area">
					<% if(currentPage != 1){ %>
						<button onclick="location.href='<%=contextPath %>/aList.rv?cpage=<%= currentPage - 1 %>'">&lt;</button>
					<% } %>	
					<% for(int i = startPage; i <= endPage; i++){ %>
						<% if(currentPage != i ){ %>
							<button onclick="location.href='<%= contextPath %>/aList.rv?cpage=<%=i %>'"><%=i %></button>
						<% } else{ %>
							<button disabled><%= i %></button>
						<% } %>
					<% } %>
					<% if(currentPage != maxPage){ %>
						<button onclick="location.href='<%=contextPath %>/aList.rv?cpage=<%=currentPage + 1%>'">&gt;</button>
					<% } %>
				</div>
			<% } %>
			
			<br><br>
	
		</div>
    </div>
    
</body>
</html>