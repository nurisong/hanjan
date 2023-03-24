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
<title>공지사항 게시판</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">
<style>
	/*.outer{
		font-family: 'Pretendard-Regular';
		width: 1000px;
		margin: auto;
		margin-top: 5px;
    } */
	.list-area td{
        text-align: center;
    }
	table{
        table-layout: fixed;
    }
    td{
        overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
    }
	table.type02 {
		border-collapse: separate;
		border-spacing: 0;
		line-height: 1.5;
		border: 1px solid #fff;

		/* border-top: 1px solid #ccc;
		border-left: 1px solid #ccc; */
		margin : 20px 10px;
	}
	table.type02 th {
		padding: 5px;
		font-weight: bold;
		vertical-align: top;
		border: 1px solid #fff;
		/* border-bottom: 1px solid #fff;
		border-top: 1px solid #fff;
		border-left: 1px solid #fff; */
		background: rgb(238, 238, 238);
	}
	table.type02 td {
		padding: 7px;
		vertical-align: top;
		border: 1px solid #fff;

		/* border-right: 1px solid #ccc;
		border-bottom: 1px solid #ccc; */
	}
	.list-area>tbody>tr:hover{
        cursor:pointer;
        background:rgb(236, 236, 236);
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
                    <li><a style="color:rgb(72, 72, 131); font-size:22px;" href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                    <li><a href="<%=contextPath%>/list.qa?cpage=1">문의사항</a></li>
                    <li><a href="<%=contextPath%>/list.rs?cpage=1">구독후기</a></li>
                </ul>
            </div>
        </div>
        <div class="main-area" align="center">
			<br><br>
	        
			<table class="list-area type02" align="center" style="width:880px"> 
				<thead>
					<tr>
						<th width="80"></th>
						<th width="320">제목</th>
						<th width="120">작성자</th>
						<th width="120">작성일</th>
						<th width="70">조회수</th>
					</tr>
	
				</thead>
				<tbody>
					<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
					<% } else{%>
						<% for(Board b : list){ %>
							<tr>
								<td><%= b.getBoardNo() %></td>
								<td><%= b.getBoardTitle() %></td>
								<td><%= b.getBoardWriter() %></td>
								<td><%= b.getBoardDate() %></td>
								<td><%= b.getBoardCount() %></td>
							</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
			
			<script>
				$(function(){
					$('.list-area>tbody>tr').click(function(){
						location.href = '<%=contextPath%>/detail.no?nno='+$(this).children().eq(0).text();
					})
				});
			</script>
			
			<br><br>
			
			<%if(!list.isEmpty()){%>
				<div align="center" class="paging-area">
					<% if(currentPage != 1){ %>
						<button onclick="<%=contextPath %>/list.no?cpage=<%= currentPage - 1 %>">&lt;</button>
					<% } %>	
					<% for(int i = startPage; i <= endPage; i++){ %>
						<% if(currentPage != i ){ %>
							<button onclick="<%= contextPath %>/list.no?cpage=<%=i %>"><%=i %></button>
						<% } else{ %>
							<button disabled><%= i %></button>
						<% } %>
					<% } %>
					<% if(currentPage != maxPage){ %>
						<button onclick="<%=contextPath %>/list.no?cpage=<%=currentPage + 1%>">&gt;</button>
					<% } %>
				</div>
			<% } %>
		<br>
		</div>

   	</div>

    <%@ include file="../../common/footer.jsp" %>
        
</body>
</html>