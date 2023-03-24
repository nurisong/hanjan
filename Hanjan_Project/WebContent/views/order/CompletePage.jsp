<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료화면</title>
<style>
    h2{
        text-align: center;
    }


    a{
        text-decoration: none;
        text-align: center;
    }
</style>


</head>
<body>
	<%@include file="../common/menubar.jsp" %>
    <h2>주문 / 결제 완료되었습니다.</h2>
    <br><br><br>
    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAP8AAADGCAMAAAAqo6adAAAAbFBMVEX///8dHR0AAAASEhLt7e0ZGRn8/PwxMTGZmZl6enre3t5XV1cwMDArKyvw8PAnJyeEhISNjY2Tk5NRUVEICAh0dHTn5+fT09NsbGycnJzX19f29vaFhYWLi4tkZGRpaWlKSkpDQ0NeXl49PT1RwTlkAAADO0lEQVR4nO3c61IaQRCG4dnloBLBU0I0ahLj/d9jFksJQWB7dqd7+vB9N7D9vFTxAyhSwjAMwzAMc7vHH7UvqLr5XRs5QMefBQ7Q8ZsmboA3ftwA8y9v/KgBtvyYAXb4EQM87vLjBdjjbwJ8r32T4D7xYwU4wI8U4CA/ToAj/CgBjvJjBDjBjxDgJN9/gB6+9wC9fN8BCHzPAUj8pmnvax/KMyr/T+1DeQY++P38n7UP5Vlw/gp88MHv4c9rX8oy8MHv5/9yyr8Lzv8KPvjgg3+Uf++TPwUffPDBBx988MEHH/wt/xv4Dgc++OCDH5H/G3zwwQcffPDBBx988L3zX8An8C+C82sfyjPwI/NXsfl49UPzX8EHH/yY/An44IMPfjj+Gfjggx+Sfwl+YP5SB3/6MmV+wsGtrnTwV8v2qkIAPfxJM5EPoInfyAfQwp++vwcJB9DGFw6gjy8aQCO/C7AUCqCTLxZAK18ogF6+SICpYr5AAN38TYA162OV85kD6OezBrDAZwxgg98FuGQJYIXPFMAOnyUAlX9d+sF7WzWUO4oH0MJP6YL032mFA+jhp3QtH0ATv0IAyluOHF88gDa+cIC1Oj45wFmBABr5ggF08sUCaOULBdDLFwmgmZ/SEzHAYugD1sTv9+vw2QNo5zMH0M9nDWCBzxjABj+lZ54AVvhMAdbE3/U9cakydlM+gCU+QwAq/5lTlbHCARbG+IUD2OMXDWCRXzCATX6xAFb5hQLY5ad0S/xQ9EQAy/wCAWzzRweg8m9kVRkbFcA+f1QAD/wRAXzwBwfwwh8YwA9/UABPfHKA5TaAL352ACr/tq4qY1kB/PGzAnjkZwRYED/otsUnB3h1+epvRgswmznlp3ROCuCWXy6AUX6pAGb5ZQIY5pcIYJo/PoBx/tgA5vnjAjjgjwnggj88QHte+/JCGxbADX9YAEf8IQFc8fMDOOPnBnDHzwvgkJ8TwCWfHsApnxrALZ8WwDGfEsA1vz+Ac35fAPf80wEC8E8FCME/HiAI/1iA9qH2XWI7FCAQ/1CAUPzPAYLx9wOE4/8fICB/N0BI/r8AQfkfAcLyU3poQ/M3AULzuwB2+H8BJTdTBZLsq5MAAAAASUVORK5CYII=" style="display: block;
        margin: 0px auto;
        width: 100px;
        height: 100px;">
    <br><br><br>
    <p style="text-align: center;">
        신용카드 결제 취소 시 바로 환불 가능하며<br>
        계좌이체 / 무통장입금의 경우 3일 이내에 환불이 처리됩니다.<br>
        자세한 사항은 문의주시기 바랍니다.
    </p>
    <br><br>
    <div>
        <div style="text-align: center;">
            <a onclick="mainPage();">홈으로</a>
        </div>
	<%@include file="../common/footer.jsp" %>
    </div>