<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    /* .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: auto;
        margin-top: 5px;
    }  */
    #reply-area td{
        padding-left:7px;
    }

</style>
</head>
<body>
    
    <div class="outer">
        <div class="main-area">
        
            <table align="center" id="detail-area">
                <tr>
                    <td colspan="2">
                        <br>
                        <h2 align="left">문의사항</h2>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="font-size : 25px;" width="800">&nbsp;(제목)</td>
                </tr>
                <tr>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td width="120">&nbsp;&nbsp;(아이디)</td>
                    <td width="150">(작성일자)</td>
                    <td>조회 : 1,350</td>
                </tr>
                <tr>
                    <td align="right" colspan="3">
                        <button>삭제</button>
                        <button>수정</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <hr style="border:1px color= silver;" width="100%">
                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;&nbsp;문의구분 >> (문의구분)</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <hr style="border:1px color= silver;" width="100%">
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div>
                            <p style="height:300px; padding-left:15px;">문의내용</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <hr style="border:1px color= silver;" width="800">
                    </td>
                </tr>
            </table>
            
            
            <div align="center">
                <table align="center" id="reply-area" style="background:lightgrey;">
                    <tr style="padding-top:7px;">
                        <td width="100" align="left" style="padding-top:7px;">관리자</td>
                        <td style="padding-top:7px;">날짜</td>
                    </tr>
                    <tr>
                        <td colspan="2" width="780" height="150" style="vertical-align:top;"><p>답변</p></td>
                    </tr>
                </table>

                <table style="background:lightgrey; width:792px;">
                    <tbody>
                        <tr>
                            
                            <td style="padding-left : 5px; padding-right : 5px;" align="center">
                                <textarea id="replyContent" cols="105" rows="5" style="resize:none;"></textarea>
                            </td>
                        </tr>
                        <tr align="right">
                            <td  style="padding-right : 17px;"><button style="height:30px;">등록</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>