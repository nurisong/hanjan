<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.hj.member.model.vo.Member, com.hj.common.model.vo.PageInfo " %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
<title>회원 관리</title>
<style>
    .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: auto;
        margin-top: 5px;
    } 

    table{
        table-layout: fixed;
    }
    td{
        overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
    }
	.main-outer {
        float: right;
        width: 1630px;
        height: 1200px;
    }
    .table table-striped {
        text-align: center;
    }


</style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>

<body>

	<%@ include file="aSidebar.jsp" %>

    <div class="main-outer">
        <div>

            <table class="list-area" align="center">
                <tr>
                    <td>
                        
                        <div align="right" style="width:840px">
                    <a class="btn btn-sm btn-info" href="#">선택 회원 복구</a>          
                    <br>
                        </div>
                            <br>
                    </td>
    
                </tr>
    
            <div class="container" align="center">
                <h2>탈퇴한 회원 조회</h2>
          <table class="table table-striped" align="center" style="width: 950px;">
            <thead>
                <tr>
                    <th width="80">회원번호</th>
                    <th width="90">아이디</th>
                    <th width="120">이름</th>
                    <th width="150">연락처</th>
                    <th width="80">구매횟수</th>
                    <th width="100">구매총액</th>
                    <th width="160">적립금</th>
                    <th><input type="checkbox"></th>
                </tr>

            </thead>
          <tbody>
                        
                        <% if(list.isEmpty()) {%> <!-- 조회글 없음 -->
					<tr>
						<td colspan="8">조회된 회원이 없습니다.</td>
					</tr>
				<% }  else { %>
					<!-- 반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기 -->
					<% for(Member m : list) {%>
		       			   <tr>
         						<td><%= m.getUserNo() %></td>
         						<td><%= m.getUserId() %></td>
         						<td><%= m.getUserName()  %></td>
         						<td><%= m.getPhone() %> </td>
         						<td><%= m.getBuyCount() %> </td>
         						<td><%= m.getSaleSum() %> </td>
         						<td><%= m.getPoint() %> </td>
								<td><input type="checkbox"></td>
						</tr>
					<% } %>
				<% } %>

 
                        </tbody>
                    </table>
                    
                    <br><br>
              <div align="center" class="paging-area">
			<% if(currentPage != 1){ %>
				<button onclick="location.href='<%=contextPath %>/deleteMemberList.do?cpage=<%= currentPage - 1 %>'">&lt;</button>
			<% } %>	
			<% for(int i = startPage; i <= endPage; i++){ %>
				<% if(currentPage != i ){ %>
					<button onclick="location.href='<%= contextPath %>/deleteMemberList.do?cpage=<%=i %>'"><%=i %></button>
				<% } else{ %>
					<button disabled><%= i %></button>
				<% } %>
			<% } %>
			<% if(currentPage != maxPage){ %>
				<button onclick="location.href='<%=contextPath %>/deleteMemberList.do?cpage=<%=currentPage + 1%>'">&gt;</button>
			<% } %>
		</div>
            
            
            </body>
            
            </body>
            </html>
            

        </div>
    </div>

</body>
</html>