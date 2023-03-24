<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style>
	.main-outer {
    float: right;
    width: 1630px;
    height: 1200px;
}
body{
	margin: 0px;
}
.title-height{
    height: 20px;
}

.outer{
    width: 1000px;
    height: 1000px;
}
.productEnrollTable{
    margin-left: 200px;
}
.enrollouter{
    margin-left: 250px;
}
.textForm{
    margin-left: 100px;
    width: 300px;
}
.trScope{
    height: 34px;
}
.row{
    width: 170px;
    font-size: 22px;
}
.textForm2{
    width: 300px;
    height: 95%;
    border-radius: 5%;
    border-top-width: 1px;
    border-left-width: 1px;
    border-right-width: 1px;
    border-bottom-width: 1px;
    border-style: solid;
}
/* ----------------------------- */
.filebox1 label {
    display: inline-block;
    padding: .3em .50em;
    color: white;
    font-size: 15px;
    line-height: normal;
    vertical-align: middle;
    background-color: rgb(52, 73, 94);
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}
.filebox1 input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
/* -------------------------------- */
#enrolltable{
border-spacing: 0px 30px;
height: 600px;
}
#enrolltable>tr{
    height: 100%;
}
.enrollButton{
    width: 100px;
    height: 35px;
    background-color: rgb(52, 73, 94);
    color: white;
    border-radius: 8%;
    border-style: solid;
    border-color: rgb(52, 73, 94);
    font-size: 17px;
}
.enrollScope{
    margin-top: 40px;
    margin-right: 80px;
    
}
</style>
</head>
<body>
	
	 <%@ include file="../admin/aSidebar.jsp" %>

    <div class="main-outer">
       
        <div>
	
	
	
	
	
			<div class="outer">	

				<div class="title-height">

				</div>

		        <h1 align="center">상품등록</h1>
		        <br>
		        
		        <form action="<%= contextPath%>/enroll.pro" method="post" enctype="multipart/form-data">
		
		            <div class="enrollouter">
		                
		                <table id="enrolltable">
		                    <tr class="trScope">
		                        <th class="row">상품명</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proName" ></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">판매가</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proPrice"></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">용량(ml)</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proVolume"></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">도수(%)</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proAlcohol"></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">재고량</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proStock"></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">주종</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proType"></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">이미지1</th>    
		                        <td class="textForm"><input id="idText1" input type="text" class="textForm2"  name="proImage1" readonly></td>
		                        <td><div class="filebox1"><label for="ex_file1">파일첨부</label><input type=file name=upfile1 id="ex_file1" onchange="loadImg(this,1)" ></div></input></td>
		                    </tr>
		                    <tr class="trScope">
		                        <th class="row">이미지2</th>    
		                        <td class="textForm"><input id="idText2" input type="text" class="textForm2"  name="proImage2" readonly></td>
		                        <td><div class="filebox1"><label for="ex_file2">파일첨부</label><input type=file name=upfile2 id="ex_file2" onchange="loadImg(this,2)"></div></input></td>
		                    </tr>                    
		                    <tr>
		                        <th class="row">설명</th>
		                        <td class="textForm"><textarea id="prodetail" cols="41" rows="6" name="proDetail"></textarea></td>
		                    </tr>
		                </table>
		                
						
		                
		                <div align="center" class="enrollScope">
		                    <input type="submit" value="등록" class="enrollButton" >
		                </div>
		            </div>
					
		
		
		        </form>
				<script>	        	
			        	function loadImg(image,num){
			        		var str='';
			        		var str2='';
			        		if(image.files.length==1){		        			
			        			switch(num){
			        				case 1:var str=image.value;str2=str.replace('C:\\fakepath\\','');console.log(str2); $('#idText1').attr('value',str2); break;
			        				case 2:var str=image.value;str2=str.replace('C:\\fakepath\\','');console.log(str2); $('#idText2').attr('value',str2); break;
			        			}		        			
			        		}		        		
			        	}		        			        			        	
			    </script>
				
		
		
		        
		        </div>
		 </div>
    </div>
</body>
</html>


