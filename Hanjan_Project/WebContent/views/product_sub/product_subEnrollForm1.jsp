<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독상품등록</title>
</head>
<body>


<style>
.main-outer {
	float: right;
	width: 1630px;
	height: 1200px;
}
body{
	margin: 0px;
}


.outer {
	width: 1000px;
	height: 1000px;
}

.title-height{
			height: 20px;
		}


.productEnrollTable {
	margin-left: 200px;
}

.enrollouter {
	margin-left: 220px;
}

.textForm {
	margin-left: 100px;
	width: 300px;
}

.row {
	width: 200px;
	font-size: 22px;
}

.textForm2 {
	width: 300px;
	height: 80%;
    border-radius: 5%;
	border-top-width: 1px;
	border-left-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-style: solid;
}

#enrolltable {
	border-spacing: 0px 20px;
	height: 500px;
}

#enrolltable>tr {
	height: 100%;
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

#nextButton {
	width: 100px;
			height: 35px;
			background-color: rgb(52, 73, 94);
			color: white;
			border-radius: 8%;
			border-style: solid;
			border-color: rgb(52, 73, 94);;
			font-size: 17px;
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



            <h1 align="center">구독등록</h1>
            <br>
            
            <form action="<%=contextPath%>/enrollNext.sub" method="post" enctype="multipart/form-data">

                <div class="enrollouter">
                    
                    <table id="enrolltable">
                        <tr>
                            <th class="row">구독명</th>    
                            <td class="textForm"><input type="text" class="textForm2" required maxlength='30' name="subName" required></td>
                        </tr>
                        <tr>
                            <th class="row">판매가</th>    
                            <td class="textForm"><input type="text" class="textForm2" required name="subPrice" required></td>
                        </tr>
                        <tr>
                            <th class="row">구독연월</th>    
                            <td class="textForm"><input type="text" class="textForm2" required name="subMonth" placeholder="ex)22년 11월 구독=>  22-11" required></td>
                        </tr>                   
                        <tr>
                            <th class="row">이미지1</th>    
                            <td class="textForm"><input type="text" id="idText1" class="textForm2"  name="subImage1" readonly></td>
                            <td><div class="filebox1"><label for="ex_file1">파일첨부</label><input type=file name=upfile1 id="ex_file1" onchange="loadImg(this,1)"></td>
                        </tr>
                        <tr>
                            <th class="row">이미지2</th>    
                            <td class="textForm"><input type="text" id="idText2" class="textForm2"  name="subImage2" readonly></td>
                            <td><div class="filebox1"><label for="ex_file2">파일첨부</label><input type=file name=upfile2 id="ex_file2" onchange="loadImg(this,2)"></td>
                        </tr>                    
                        <tr>
                            <th class="row">설명</th>
                            <td class="textForm"><textarea id="subsubdetail" cols="41" rows="6" maxlength='300' name="subDetail" required></textarea></td>
                        </tr>
                    </table>
                    
                    <br>
                    
                    <div align="center">
                        <input type="submit" value="다음" id="nextButton" onclick="return validate();">
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
			     
			     function validate(){
			    	 
			    	 var date=$('input[name=subMonth]').val();
			    	 regExp=/^[0-9][0-9]-[0][1-9]$/;
			    	 regExp2=/^[0-9][0-9]-[1][0-2]$/;
			    	 if(!(regExp.test(date)) && !(regExp2.test(date))){
			    		 alert('구독연월을 형식에 맞게 써주세요');
			    		 return false;
			    	 }
			     }
			</script>
            
            </div>
        </div>
    </div>

</body>
</html>