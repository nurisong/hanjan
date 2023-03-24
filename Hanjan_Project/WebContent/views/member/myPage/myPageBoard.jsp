<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술렁술렁 마이페이지</title>
<link rel="stylesheet" type="text/css" href = "${pageContext.request.contextPath}/resources/css/myPage.css">
<style>
    .board-area {
        padding: 0px 0px 80px 0px;
    }
    .board-table {
        width: 950px;
        font-size: 18px;
        text-align: center;
        border-collapse: separate;
        border-bottom: 1px solid #ccc;
        border-spacing: 1px;  
    }
    .board-table tbody > tr:hover {
        cursor: pointer;
        background-color: rgb(249, 249, 249);
    }
    .board-table > thead {
        background-color: rgb(238, 238, 238);
        border-bottom: 1px solid #ccc;
    }
    .board-table th, td {
        height: 50px;
    }
    .board-title {
        margin-left: 50px;
        margin-bottom: 20px;
        font-size: 22px;
    }
    .board-area select {
        margin-left: 845px;
        margin-bottom: 20px;
        width: 150px;
        height: 30px;
        font-size: 18px;
        text-align: center;
        font-family: 'Pretendard-Regular';
    }
    #click-board{
        color: rgb(255, 175, 188);
    }
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>

    <div class="outer">
        <%@ include file="myPageTopbar.jsp" %>
        
        <div class="main-area">
            <div id="title">내가 작성한 게시글</div>
                <div id="title-line"><hr></div>
                
                <div class="board-area">

                    <select name="" id="">
                        <option value="일반게시판">일반 게시판</option>
                        <option value="일반게시판">상품 후기</option>
                        <option value="일반게시판">구독 후기</option>
                    </select>
                    <div class="board-title">일반 게시판</div>
                    <table align="center" class="board-table">
                        <thead>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>어르신에게 선물하기 괜찮을까요?</td>
                                <td>2022-11-02</td>
                                <td>1,350</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>집에 가고 싶어요</td>
                                <td>2022-11-02</td>
                                <td>1,350</td>
                            </tr>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>