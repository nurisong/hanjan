<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hj.community.board.model.vo.Board, com.hj.common.model.vo.PageInfo " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 리스트</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
	/* .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: auto;
        margin-top: 5px;
    } */
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

    <div class="outer">
        <div class="top-bar">
            <div>
                <ul id="top-ul">
                    <li><a href="<%=contextPath%>/list.bo?cpage=1">게시판</a></li>
                    <li><a href="<%=contextPath%>/notice.bo?cpage=1">공지사항</a></li>
                    <li><a href="<%=contextPath%>/qa.bo?cpage=1">문의사항</a></li>
                    <li><a href="<%=contextPath%>/review_sub.bo?cpage=1">구독후기</a></li>
                </ul>
            </div>
        </div>
		
        <div class="main-area">
			
            <br>
            <h2 align="center">문의사항 게시판</h2>
            <br>

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
                            <a href="#" class="btn btn-info btn-sm">글작성</a>
                            <br><br>			
                        </div>
                    </td>

                </tr>

            </table>
            
            <table class="list-area" align="center" border="1" style="width:840px"> 
                <thead>
                    <tr>
                        <th width="80">글번호</th>
                        <th>문의구분</th>
                        <th width="250">제목</th>
                        <th width="120">작성자</th>
                        <th>상태</th>
                        <th width="120">작성일</th>
                        <th width="70">조회수</th>
                    </tr>

                </thead>
                <tbody>
                        <tr>
                            <td>1</td>
                            <td>상품</td>
                            <td>ㅎㅎ</td>
                            <td>user01</td>
                            <td>미완료</td>
                            <td>2022-10-10</td>
                            <td>10</td>
                        </tr>
                </tbody>
            </table>
            
            <br><br>
            
        </div>
        
    </div>

    <%@ include file="../../common/footer.jsp" %>

</body>
</html>