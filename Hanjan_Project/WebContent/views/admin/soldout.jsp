<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.hj.order.sales.model.vo.Stock, com.hj.common.model.vo.PageInfo " %>
    <%
	ArrayList<Stock> list = (ArrayList<Stock>)request.getAttribute("list");
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
<title>품절상품 조회</title>
<style>
    .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: auto;
        margin-top: 5px;
    } 
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
	.main-outer {
        float: right;
        width: 1630px;
        height: 1200px;
    }
    .container th{
        text-align: center;
    }


</style>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
</head>
<body>

	<%@ include file="aSidebar.jsp" %>

    <div class="main-outer">
        <div>
            <div class="outer">
                <br>
                <h2 align="center">품절상품 조회


</h2>
            
                    <table class="list-area" align="center">
                        <tr>
                            <td>
                                <div align="left" style="width:840px,">

            
                                    <br><br><br>
                                 <a class="btn btn-sm btn-info" href="<%= contextPath %>/StockList.do?cpage=1">재고 현황 관리</a>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                                <div align="right" style="width:840px">
                            <a class="btn btn-sm btn-info" href="<%=contextPath %>/plist.pro">등록/수정</a> 
                                
                            <br>
                                </div>
                                    <br>
                            </td>
            
                        </tr>
            


                    
                      <div class="container">         
                    <table class="table table-bordered" align="center" border="1" style="width:840px;height: 180px" > 
                        <thead>
                            <tr>
                                <th width="80">상품번호</th>
                                <th width="140">제품명</th>
                                <th width="160">총판매량</th>
                                <th width="110">품절일자</th>
                            </tr>
                        </thead>
                         <tbody>
                        
                        <% if(list.isEmpty()) {%> <!-- 조회글 없음 -->
					<tr>
						<td colspan="5"> 품절된 상품이 없습니다.</td>
					</tr>
				<% }  else { %>
					<!-- 반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기 -->
					<% for(Stock s : list) {%>
		       			   <tr>
         						<td><%= s.getProductNo() %></td>
         						<td><%= s.getProductName() %></td>
         						<td><%= s.getSale() %> </td>
         						<td><%= s.getSoldOutDate() %> </td>
    
						</tr>
					<% } %>
				<% } %>
                        
                        
 
                        </tbody>
                    </table>
                    
                    <br><br>
              <div align="center" class="paging-area">
			<% if(currentPage != 1){ %>
				<button onclick="location.href='<%=contextPath %>/SoldOut.do?cpage=<%= currentPage - 1 %>'">&lt;</button>
			<% } %>	
			<% for(int i = startPage; i <= endPage; i++){ %>
				<% if(currentPage != i ){ %>
					<button onclick="location.href='<%= contextPath %>/SoldOut.do?cpage=<%=i %>'"><%=i %></button>
				<% } else{ %>
					<button disabled><%= i %></button>
				<% } %>
			<% } %>
			<% if(currentPage != maxPage){ %>
				<button onclick="location.href='<%=contextPath %>/SoldOut.do?cpage=<%=currentPage + 1%>'">&gt;</button>
			<% } %>
		</div>
                    </table>
                    </div>

                    <br><br>
        </div>
    </div>

</body>
</html>