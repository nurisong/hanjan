<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<%@ include file="../../common/menubar.jsp" %>
<link rel="stylesheet" type="text/css" href = "<%=contextPath %>/resources/css/cMenubar.css">

<style>
    /* .outer{
        font-family: 'Pretendard-Regular';
        width: 1000px;
        margin: auto;
        margin-top: 5px;
    }  */
    #update-form table {
    width: 100%;
    border-collapse: collapse;
    }
    th, td {
        border-bottom: 1px solid #d1d1d1;
        padding: 10px;
    }
    #pro-table td{
        padding: 0px;
        border-bottom: none;
    }
</style>

</head>
<body>

    <div class="outer">
        <div class="main-area">

            <br>
            
            <form action="#" id="update-form">
                
            
                <table align="center" style="width:800px;">
                    <thead>
                        <tr>
                            <td colspan="2"><h2 align="left" colspan="2">리뷰 수정</h2></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" style="width:640px; height: 25px;"></td>
                        </tr>
                        <tr>
                            <td>구매상품</td>
                            <td>
                                <table id="pro-table">
                                    <tr>
                                        <td rowspan="3" width="40"><img width="150px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPsAAADJCAMAAADSHrQyAAAAY1BMVEX///+VlZWPj4/j4+O0tLT7+/ucnJyfn5/b29uSkpKkpKSrq6uurq7m5uZmZmaWlpbz8/OIiIjs7Ox5eXlkZGRsbGzNzc2BgYF0dHTU1NRvb2+7u7ve3t7w8PDCwsKKiopcXFxuhZvhAAAELklEQVR4nO3b25KiOhQG4HBIICgHUQgg6rz/U85Kgt3OlNDs6mrdrPm/Kwtzwc9KApIoBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAU3LBu8/tR8k23i2IW77xcxXqRaGq332OPyRSOviCVjwrX5dfRg+CsH33af6Eqerhc/fLouN3n+cPqF10rdvombzVfLNHrsNrlT//ulZ8s+e+6uVM9Ivi2+f9NDcbfaq65pjdT3PzHX4aD2fNL/uUTc91+MR3+HEM2WX301yQzDyyTVcmyEXKLns+DeY2f353m2bBUYieW/aPpzk981TjZzmKzq7u9dfP8KSMbFtu2Xdrogepa8ssexU+Sfr35QhH35hZ9shnV3N89sg35ph94Xep+wkT+i7PMnu50KBknj1ZaJDpz+zM7u/IvtCAeXb9D2dfXfd/ea5D9pec1ysg+0IDZPefMc+/5LxeAdkXGjxmb3m9o/4vz3W5vU7Msq+su1/AYLQGvT77/TU9n70Hq7N/sU67RWuz31fnGUVfmX2sta86q51Gq7Lra+KjRy87r1dYlT3wVQ9YVX1t9oDbNOeszs5rmnP8usxCg/JedWYdXny9LtP7suuS1zTn+LprtX9OhVN0flX/XIed2Tt87/AMqy4e5vF5DKc5776JaiE6u5vbh3r30b21fYjRbgB8bEDQesdxrN9d8iWckwMAAAAAAAAA/A/FqqyEONtliTExJptez1S7sxBXpXr6nCfKbTDJy+lvg73yDa/u7ySbfYsng6GhfOpE0bpuv+tM5Y5XByVF3DQZfW6bQdtj16Zxixd9YeJsuFX0vUo2nF2Ux+NOiISyx4P9y+Pg12Z89uFg6HPSGbdaVQadvRSyPF7oQpxSERfVG8/8+8qbogra7MqWPD/6/VNT9uxIXdvog627NLE2969ESn0gLi5vPffvKsNrEz1m37vDU5+/dqkQp7PLHnXpeaCwl8N9vXbz2W91Ec9mT81VpMVobPb2mPd2bnjMHlWXarsbrsqbMLe57EUdKnE1tcu+M1XenX32KI7jiMbEsevMdl/clzdJPTmbyV7tjcxK6bLfSn/UZu/DQ0HjvWn7vt9y3eU49LPZWyp9LGx2WVDNE2rj+rzsCwZz3U1Wh11STNnrP7NfquLc9S572jSnU9Pk03hPeWQXmQkKW1MauWP3eI8rLtIc6CZus8cDdXCa+UV1CyWX7BU9uJnCPrZdhcjsTC4+s4tk6IQb7+pAiauCap4N1KZ12Wmev2x2vMuQerpsml+USzfD0CQ+SmVKKfa/anp+S4Q8hjQY3J2tM1LUxjakobAvGhoI291QHdn/84+p3SFd9efzOFVRjhEN/lSKKrUjIRIydfeyiA6JCzXsc7oIqbXt51oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+K7fw2lApeR5FTgAAAAASUVORK5CYII=" alt=""></a></td>
                                        <td>상품명</td>
                                    </tr>
                                    <tr><td>금액</td></tr>
                                    <tr><td>별점</td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="70">첨부파일</td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="" id="" cols="90" rows="20" style="resize:none;"></textarea></td>
                        </tr>
                        <tr>
                            <td>별점</td>
                            <td><input name="rate" value="1" type="radio" id="rate1"><label for="rate1">★☆☆☆☆</label>
                                <input name="rate" value="2" type="radio" id="rate2"><label for="rate2">★★☆☆☆</label>
                                <input name="rate" value="3" type="radio" id="rate3"><label for="rate3">★★★☆☆</label>
                                <input name="rate" value="4" type="radio" id="rate4"><label for="rate4">★★★★☆</label>
                                <input name="rate" value="5" type="radio" id="rate5"><label for="rate5">★★★★★</label>
                            </td>
                        </tr>
                        <tr align="right">
                            <td colspan="2">
                                <button type="reset">취소</button> &nbsp;&nbsp;
                                <button type="submit">수정</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </div>

</body>
</html>