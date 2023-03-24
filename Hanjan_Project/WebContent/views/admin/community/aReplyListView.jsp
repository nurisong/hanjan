<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 관리</title>
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
    .main-outer {
		float: right;
		width: 1630px;
		height: 1200px;
	}
	
	.outer {
		font-family: 'Pretendard-Regular';
		width: 1000px;
		margin: 250px;
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
	#del-btn{
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
	<%@ include file="../aSidebar.jsp" %>

    <div class="main-outer">
         <div class="outer">
        
		<br>
		<h2 align="center">댓글</h2>

        <table align="center">
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
                    
                    <div align="right" style="width:880px">
                        <a href="#" class="btn btn-info btn-sm">삭제</a>
                        <br><br>			
                    </div>
                </td>

            </tr>

        </table>
        
		<table class="list-area type02" align="center" border="1" style="width:880px"> 
			<thead>
				<tr>
					<th width="30"><input type="checkbox"></th>
					<th width="60">글번호</th>
					<th width="200">게시글제목</th>
					<th>댓글내용</th>
					<th width="100">작성자</th>
					<th width="150">작성일</th>
				</tr>

			</thead>
			<tbody>
                <tr>
                        <td><input type="checkbox"></td>
						<td>1</td>
						<td>ㅎㅎ</td>
						<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
						<td>user01</td>
						<td>2022-10-10</td>
					</tr>
			</tbody>
		</table>
		
		<br><br>
	
		</div>
	</div>

   
</body>
</html>