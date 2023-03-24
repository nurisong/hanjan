<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    td{
        overflow:hidden;
		white-space : nowrap;
		text-overflow: ellipsis;
    }
</style>
</head>
<body>

	<%@ include file="aSidebar.jsp" %>

    <div class="main-outer">
    
    	<div class="outer">
        
		<br>
		<h2 align="center">문의사항 게시판</h2>

        <table class="list-area" align="center">
            <tr>
                <td>
                    <div align="left" style="width:840px">
                        <input type="text">
                        <button>검색</button>
                    </div>
                    
                </td>
            </tr>
            <tr>
                <td>
                    
                    <div align="right" style="width:840px">
                        <a href="#" class="btn btn-info btn-sm">삭제</a>
                        <a href="#" class="btn btn-info btn-sm">답변</a>
                        <br><br>			
                    </div>
                </td>

            </tr>

        </table>
        
		<table class="list-area" align="center" border="1" style="width:840px"> 
			<thead>
				<tr>
					<th width="30"><input type="checkbox"></th>
					<th width="80">글번호</th>
					<th width="90">문의구분</th>
					<th>제목</th>
					<th width="120">작성자</th>
					<th width="150">작성일</th>
					<th width="90">상태</th>
				</tr>

			</thead>
			<tbody>
                <tr>
                        <td><input type="checkbox"></td>
						<td>1</td>
						<td>배송</td>
						<td>ㅎㅎ</td>
						<td>user01</td>
						<td>2022-10-10</td>
						<td>미완료</td>
					</tr>
			</tbody>
		</table>
		
		<br><br>
	
	</div>
    </div>
    
</body>
</html>