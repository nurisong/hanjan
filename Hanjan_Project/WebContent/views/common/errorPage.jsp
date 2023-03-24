<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
    .outer {
        background-color: rgb(244, 244, 244);
        height: 500px;
        /* padding: 100px 0px; */

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .error-area{
        margin: auto;
        height: 400px;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        width: 900px;
        border-radius: 10px;
        padding: 40px 50px 30px;

        display: flex;
        flex-direction: column;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
    }
    .error-area div{
        height: 70px;
        /* border: 1px solid palevioletred; */
        align-items: center;
    }
    .error-area input {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        font-family: 'Pretendard-Regular';
        font-size: 16px;
        padding: 10px;
        box-sizing: border-box;
    }
    .error-area button {
        background-color: RGB(63,72,107);
        color: white;
        width: 250px;
        height: 50px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .error-area button:hover {
        background-color: rgb(47, 54, 82);
        cursor: pointer;
    }
    #link-area {
        margin-top: 20px;
    }

    #error-text {
        margin: 50px;
        font-size: 27px;
    }
    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        
        <div class="error-area">
            <h1 id="error-text">오류 페이지</h1>
            <div align="center" style="color:red;"><%= errorMsg %></div>
            
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>