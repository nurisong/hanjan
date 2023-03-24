<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.ArrayList, com.hj.order.model.vo.Order, com.hj.common.model.vo.PageInfo " %>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 현황</title>
<style>

	.main-outer {
        float: right;
        width: 1630px;
        height: 1200px;
    }


</style>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.0.1/chart.js" integrity="sha512-zulXrCFpnkALZBNUHe4E6rTUt7IhNLDUuLTLqTyKb93z7CrEVzFdL8KfPV6VPplL8+b4MZGOdh00+d2nzGiveg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
</head>

<body>
	<%@ include file="aSidebar.jsp" %>

    <div class="main-outer">
        <div>
        	<h1>매출 현황</h1>
            <div>
                <canvas id="myChart" width="700" height="250" ></canvas>
              </div>
              
              <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
              
              <script>
                const ctx = document.getElementById('myChart');
          
                 new Chart(ctx, {
                    url: 'sales.do',
                    type: 'line',
                    data: {
                      labels: ['2022/07', '2022/08', '2022/09', '2022/10', '2022/11', '2022/12'],
                      datasets: [{
                        label: '월별 매출액',
                        data: [<%for ( Order o : list) { %> <%= o.getOrderPrice()%>,<% } %>],
                        borderWidth: 1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });;
              </script>
              <br><br><br>
          
              <div class="container">
                <h2>월별 매출 테이블</h2>          
                <table class="table table-dark table-striped" align="center" border="1" style="width: 800px">
                    <thead>
                        <tr>
                            <th width="80">년도/월</th>
                            <th width="120">매출액(합계)</th>
                        </tr>
        
                    </thead>
                        <tbody>
                        
                        <% if(list.isEmpty()) {%> 
					<tr>
						<td colspan="2">조회된 매출내역이 없습니다.</td>
					</tr>
				<% }  else { %>
					<% for(Order o : list) {%>
		       			<tr>
         						<td><%= o.getOrderYM() %></td>
         						<td><%= o.getOrderPrice() %></td>
						</tr>
					<% } %>
				<% } %>
                        
                        
 
                        </tbody>
                </table>
                
                <br><br>
      

              </div>

          




        </div>
    </div>

</body>
</html>