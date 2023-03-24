<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.product.model.vo.Product, com.hj.common.model.vo.PageInfo " %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
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
<title>재고 현황</title>
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
    .list-area th{
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



</style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>

	<%@ include file="aSidebar.jsp" %>

    <div class="main-outer">
        <div>
            <div class="outer">
                    <br>
                    <h2 align="center">재고현황관리</h2>
            
                    <table class="list-area" align="center">
                        <tr>
                            <td>
                                <div align="left" style="width:840px,">

            
                                    <br><br><br>
                              <a class="btn btn-sm btn-info" href="<%=contextPath %>/plist.pro">등록/수정</a> 

                                    <br>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                                <div align="right" style="width:840px">
                         <a class="btn btn-sm btn-info" href="<%= contextPath %>/SoldOut.do?cpage=1">품절 상품 조회</a>
                                
                            <br>
                                </div>
                                    <br>
                            </td>
            
                        </tr>
            
                    </table>
                    
                    <table class="list-area" align="center" border="1"  style="width:880px;height:180px" > 
                        <thead >
                            <tr>
                                <th width="80">상품번호</th>
                                <th>제품명</th>
                                <th width="160">판매가</th>
                                <th width="80">판매수량</th>
                                <th width="110">재고수량</th>
                            </tr>
            
                        </thead>
                        <tbody>
                        
                        <% if(list.isEmpty()) {%> <!-- 조회글 없음 -->
					<tr>
						<td colspan="6">조회된 상품이 없습니다.</td>
					</tr>
				<% }  else { %>
					<!-- 반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기 -->
					<% for(Product p : list) {%>
		       			   <tr>
         						<td><%= p.getProductNo() %></td>
         						<td><%= p.getProductName() %></td>
         						<td><%= p.getProductPrice() %></td>
         						<td><%= p.getSale() %> </td>
         						<td><%= p.getproductStock() %> </td>
						</tr>
					<% } %>
				<% } %>
                        
                        
 
                        </tbody>
                    </table>
                    
                    <br><br>
              <div align="center" class="paging-area">
			<% if(currentPage != 1){ %>
				<button onclick="location.href='<%=contextPath %>/StockList.do?cpage=<%= currentPage - 1 %>'">&lt;</button>
			<% } %>	
			<% for(int i = startPage; i <= endPage; i++){ %>
				<% if(currentPage != i ){ %>
					<button onclick="location.href='<%= contextPath %>/StockList.do?cpage=<%=i %>'"><%=i %></button>
				<% } else{ %>
					<button disabled><%= i %></button>
				<% } %>
			<% } %>
			<% if(currentPage != maxPage){ %>
				<button onclick="location.href='<%=contextPath %>/StockList.do?cpage=<%=currentPage + 1%>'">&gt;</button>
			<% } %>
		</div>
                    
                    
        </div>
    </div>

</body>
</html>