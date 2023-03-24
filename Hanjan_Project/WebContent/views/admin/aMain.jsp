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
    .main-outer > div {
        background-color: aqua;
    }
</style>
</head>
<body>

	<%@ include file="aSidebar.jsp" %>

    <div class="main-outer">
        <div>
            메인영역
        </div>
    </div>

</body>
</html>