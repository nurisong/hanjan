<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.community.board.model.vo.Board, com.hj.common.model.vo.PageInfo " %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<title>Insert title here</title>

<style>
	.main-outer {
		float: right;
		width: 1630px;
		height: 1200px;
	}
	.outer {
		font-family: 'Pretendard-Regular';
		width: 1000px;
		margin: 250px;
		margin-left: 117px;
		margin-top: 5px;
	}
	
	.list-area td {
		text-align: center;
	}
	
	table {
		table-layout: fixed;
	}
	
	td {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	.list-area td {
		text-align: center;
	}
	
	table {
		table-layout: fixed;
	}
	
	td {
		overflow: hidden;
		white-space: nowrap;
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
	.list-area>tbody>tr:hover{
        cursor:pointer;
        background:rgb(236, 236, 236);
    }
	#del-btn, #insert-btn{
        background-color: rgb(233, 233, 233);
        display:inline-block;
        width:40px;
        height:25px;
        text-align: center;
        border-radius: 5px;
		border:none;
    }

</style>

</head>
<body>
	<%@ include file="../aSidebar.jsp"%>

	<div class="main-outer" align="center">
		
		<div class="outer">

			<br>
			<h2 align="center">공지사항</h2>
			<br>

			<table align="center" style="width: 840px; margin-bottom:0px;">
            <tr>
                
                <td style="text-align:right;">
                	<button id="insert-btn" type="button" onclick="boardInsert();" style="color:black;">작성</button>
				   	<button id="del-btn" type="button" onclick="return delConfirm();" style="color:black;">삭제</button>
                </td>

            </tr>

        	</table>

			<table class="list-area type02" align="center" border="1" style="margin-top:0px; width: 840px">
				<thead>
					<tr>
						<th width="30"><input type="checkbox" name="cboxAll" id="cboxAll" onclick="checkAll();"></th>
						<th width="80">글번호</th>
						<th>제목</th>
						<th width="120">작성자</th>
						<th width="150">작성일</th>
					</tr>

				</thead>
				<tbody>
					<% if(list.isEmpty()){ %>
					<tr>
						<td colspan="5">조회된 게시글이 없습니다.</td>
					</tr>
					<% } else{%>
						<% for(int i = 0; i < list.size(); i++){ %>
							<tr>
								<td onclick="event.stopPropagation()" style="width:20px;"><input name="cbox" type="checkbox" value="<%=list.get(i).getBoardNo() %>"></td>
								<td><%= list.get(i).getBoardNo() %></td>
								<td><%= list.get(i).getBoardTitle() %></td>
								<td><%= list.get(i).getBoardWriter() %></td>
								<td><%= list.get(i).getBoardDate() %></td>
							</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
			
			<script>
				function delConfirm(){
					if(confirm("삭제하시겠습니까?")){
						 deleteBoard();			
					}
					else{
						return false;
					}
				}
				$(function(){
					$('.list-area>tbody>tr').click(function(){
						
						location.href='<%=contextPath%>/detail.no?nno='+ $(this).children().eq(1).text();
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
				
				function deleteBoard(){
					
					var bArr = new Array();
					var list = $("input[name='cbox']");
					for(var i = 0; i < list.length; i++){
						if(list[i].checked){
							bArr.push(list[i].value);
						}
					};
					
					$.ajax({
						url : "<%=contextPath%>/aDelete.no",
						type : "post",
						data : {
							cbox : bArr
						},
						success : function(result){
							if(result > 0){
								location.href = "<%=contextPath%>/aList.no?cpage=1";
							} else{
								alert("삭제 실패");
							}
						}
					})
					
				};
				
				function boardInsert(){
					location.href = '<%=contextPath%>/enrollForm.no';
				};
				
				$(function(){
					
					$('#comm-side').next().slideDown(0);
					
					$('#comm5').css('font-weight', '600');
					$('#comm5').css('font-size', '21px');
					$('#comm5').css('color', 'grey');
					
				})
				
			</script>
		
			<br><br>
			<%if(!list.isEmpty()){%>
				<div align="center" class="paging-area">
					<% if(currentPage != 1){ %>
						<button onclick="location.href='<%=contextPath %>aList.no?cpage=<%= currentPage - 1 %>'">&lt;</button>
					<% } %>	
					<% for(int i = startPage; i <= endPage; i++){ %>
						<% if(currentPage != i ){ %>
							<button onclick="location.href='<%= contextPath %>/aList.no?cpage=<%=i %>'"><%=i %></button>
						<% } else{ %>
							<button disabled><%= i %></button>
						<% } %>
					<% } %>
					<% if(currentPage != maxPage){ %>
						<button onclick="location.href='<%=contextPath %>/aList.no?cpage=<%=currentPage + 1%>'">&gt;</button>
					<% } %>
				</div>
			<% } %>
			</div>

			<br>
			<br>

		</div>
		
	</div>


</body>
</html>