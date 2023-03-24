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
        height: 200px;
        font-size: 18px;
        text-align: center;
        color: rgb(68, 68, 68);
        /* border: 1px solid #ccc; */
        border-radius: 5px;
        background-color: rgb(238, 238, 238);
    }
    .board-title {
        margin-left: 50px;
        margin-bottom: 20px;
        font-size: 22px;
    }
    .board-area select {
        font-family: 'Pretendard-Regular';
        margin-left: 845px;
        margin-bottom: 20px;
        width: 150px;
        height: 30px;
        font-size: 18px;
        text-align: center;
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
                        <tr>
                            <td>작성된 게시글이 없습니다.</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="../../common/footer.jsp" %>
</body>
</html>