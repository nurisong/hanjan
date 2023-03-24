<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hj.product_sub.model.vo.Subscription" %>    
<%
	Subscription subscription=(Subscription)request.getAttribute("Subscription");
	int subscriptNoo=(int)request.getAttribute("SubscriptNoo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독상품등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


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
			height: 40px;
		}

.outer {
	width: 1000px;
	height: 1000px;
}

.enrollTable {
	margin-left: 200px;
}

.enrollouter {
	margin-left: 250px;
}


.row {
	margin-left: 0px;
	width: 200px;
	font-size: 22px;
	margin-top: 30px;
}
.textForm {
	margin-left: 100px;
	width: 300px;
	
}

.textForm2 {
	width: 300px;
	height: 40%;
}



#enrolltable {
	
	height: 200px;
}

#enrolltable>tr {
	height: 100%;
}

.completeButton {
	width: 100px;
	height: 35px;
	background-color: rgb(52, 73, 94);
	color: white;
	border-radius: 8%;
	border-style: solid;
	border-color: rgb(52, 73, 94);
	font-size: 17px;
}
.modalButton{
	margin-left: 20px;
}
.deleteButton{
	width: 100px;
	margin-left: 20px;
	background-color: rgb(52, 73, 94);
	color: white;
	border-radius: 8%;
	border-style: solid;
	border-color: rgb(52, 73, 94);
	font-size: 17px;
}
.next-height{
	height: 50px;
}

.completeScope{
	margin-right: 100px;
}
/* --------------------- */
.modal-dialog{
	text-align: center;
	display: inline-block;
	vertical-align: middle;
	margin-left: 200px;
}
.modal-body{
	margin-left: 230px;
}

.modal-content{
	width: 1100px;
	min-height: 500px;

}
.popuptophead{
	height: 20px;
}
.searchBlank{
	height: 30px;
}
th[class^=tableRow]{
	text-align: center;
	background-color: rgb(220, 216, 216);
}

/* ----------------------------------- */

#popupSearchScope{
	width: 300px;
	height: 35px;
	border: 1px solid rgb(52, 73, 94);
	
}
.popupSearch{
	border: 1px solid red; 
	outline: none;
	border: 0px;
	width: 268px;
	
}
#searchButton{
	width: 10%;
	height: 30px;
	border: 0px;
	outline: none;
	float: right;
	background-image: url(https://www.pngmart.com/files/8/Search-Button-PNG-HD-Quality.png); 
	background-repeat: no-repeat;
	background-size: 30px 30px;
}

/*-----------------------------------------------*/
.addTable{
	margin-right: 50px;
}
.addrow {
	padding-top:30px;
	width: 188px;
	font-size: 22px;
	margin-top: 30px;
	height: 100px;
}
.addtextForm {
	
	margin-left: 100px;
	width: 300px;
	
}

.addtextForm2 {
	height: 36px;
	width: 300px;
	height: 39.2px;
}
#popupTable>tr{
	cursor: pointer;
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
		        
		        <form action="<%=contextPath%>/enrollLast.sub" method="post" >
		
		            <div class="enrollouter">
		                
		                <table id="enrolltable">
		                    <tr>
		                        <th class="row">선택한구독상품</th>    
		                        <td class="textForm"><input type="text" class="textForm2" required name="proName" value="<%=subscription.getSubscriptName()%>" readonly></td>
		                    </tr>
		                    <tr>
		                        <th class="row">넣을상품</th>    
		                        <td class="textForm"><input type="text" class="textForm2 addProductName" id="firstPro"  required name="proPrice"  readonly></td>
		                        <td>
		                        	<button  type="button" class="completeButton modalButton" data-toggle="modal" data-target="#searchPopup">
    									상품조회
  									</button>
		                        </td>                    
		                        <td><input class="deleteButton" type="button" value="줄삭제"></td>
		                    </tr>
		                   	
		                </table>
						
						<div class="addTable">
						
						</div>
						
						
						<div class="next-height">

						</div>
						
							<!-- 다음으로 넘겨줄 히든박스 -->
							<input type="hidden" name="subscriptNo" value="<%=subscriptNoo%>">
							<input type="hidden" name="addProductNo1" >
							<input type="hidden" name="addProductNo2">
							<input type="hidden" name="addProductNo3">
							<input type="hidden" name="addProductNo4">
							<input type="hidden" name="addProductNo4">
							<input type="hidden" name="addProductNo5">
							<input type="hidden" name="addProductNo6">
			
			                <div align="center" class="completeScope">
			                    <input type="submit" value="등록" class="completeButton" onclick="return validate()">
			                </div>
		                
		            </div>
		        
		
		
		        </form>
		
		        
		        </div>

		</div>
    </div>


	<script>
		function validate(){
			
			if($('#firstPro').val()==""){
				return false;
			}
			
		}
	</script>
	




	<!-- The Modal -->
  <div class="modal" id="searchPopup">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">
			
		  </h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
          
			<div class="popuptophead">

			</div>

			<div id="popupSearchScope">
				
				<input type="text" class="popupSearch" placeholder="상품 이름 검색">
				<input type="button" id="searchButton" value="">
				<input type="hidden" name="searchDeliver" id="searchDeliver">
				
			</div>
			<div class="searchBlank">
				
			</div>
			<div align="left">
				<p>상품을 입력해주세요</p>
			</div>
			<div>

			</div>

			<div>
				<table border="1" width="600px" id="popupTable">
									
				</table>
		    </div>
		  
		  
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="closeModal">Close</button>
        </div>
  
      </div>
    </div>
  </div>
	
  <script>
  	$(function(){
  		
  		
  		
  		
  		
  		$('#searchButton').on('click',function(){
  			$('#searchDeliver').val($('.popupSearch').val())
  			
  			$.ajax({
  				url:'enrollAjax.sub',
  				type:'post',
  				data:{searchWord:$('.popupSearch').val()},
  				success:function(list){
  					resultStr='';
  					
  					resultStr+='<tr>'
							  +'<th class="tableRow1">상품명</th>'
							  +'<th class="tableRow2">가격</th>'
							  +'<th class="tableRow3">도수(%)</th>'
							  +'<th class="tableRow4">재고</th>'
							  +'</tr>'
  					
  					for(var i=0;i<list.length;i++){
			  					 
  						 resultStr+='<tr class="selectProduct" >'
  								   +'<input type="hidden" name="selectProductOne" value="'+list[i].productNo +'">'
  								   +'<td>'+list[i].productName+'</td>'
  								   +'<td>'+list[i].productPrice+'</td>'
  								   +'<td>'+list[i].productAlcohol+'</td>'
  								   +'<td>'+list[i].productStock+'</td>'
  								   +'</tr>'
  					} 					
  					$('#popupTable').html(resultStr)  	
  					
  				}  				  				
  			}) 			  			
  		})
  		
  		$('.popupSearch').on('keyup',function(key){
  			  			
  			if(key.keyCode==13){
  				
  				$('#searchButton').click();
  				
  			}		
  		})	
  		
  		
  		
  	})
  	
  	
  </script>
  <script>
	  $(function(){
		  
	  		$(document).on('click','.selectProduct',function(){
	  			
	  			for(var i=0;i<$('input[class~="addProductName"]').length;i++){
	  				
	  				if($('input[class~="addProductName"]').length ==(i+1)){
		  				
		  				$('input[class~="addProductName"]')[i].setAttribute("value",$(this).children().eq(1).text())		  						  				
		  				$('input[name=addProductNo'+(i+1)+']').val($(this).children().eq(0).val());		
						
	  					
	  					
		  			}	  				
	  			}	  				  				  			
	  			if($('input[class~="addProductName"]').length <=5){
		  			$('.addTable').append('<tr><th class="addrow">넣을상품</th><td class="addtextForm"><input type="text" class="addtextForm2 addProductName" name="proPrice"  readonly></td></tr>')
	  			}
	  			$('#closeModal').click();
				$('#popupTable').html('');
	  			$('.popupSearch').val('');
	  			
	  		})
	  		
	  		$('.deleteButton').on('click',function(){
	  			
	  			$('.addTable').children().eq($('input[class~="addProductName"]').length-2).remove();
				$('input[name=addProductNo'+($('input[class~="addProductName"]').length+1)+']').val('');	
	  			
	  			
	  			
	  		})
	  })
	  
	  
  </script>
  

</body>
</html>