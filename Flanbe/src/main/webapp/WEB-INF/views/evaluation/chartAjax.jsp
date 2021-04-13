 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


                    
                    
                    <!-- barChart 그래프 만들기 -->
                     <!-- <div class="col-12 col-md-6 mt-3"> -->
                        <div class="card">  
                            <div class="card-header d-flex justify-content-between align-items-center">                               
                                 <h6>${ barChartTitle}</h6> 
                                
                                
                                <h6 class="card-title barChartTitle">
                               	선택 : 
                                <c:if test="${graphCheck != 1 }">
                                	<span  class="charKindSelect btn btn-outline-success btn-block rounded-pill shadow" onclick="searchGraphAjax(1)">평균</span> 
                                </c:if>
                                <c:if test="${graphCheck != 2 }">
                                	<span class="charKindSelect btn btn-outline-info btn-block rounded-pill shadow" onclick="searchGraphAjax(2)">전문성</span> 
                                </c:if>
                                <c:if test="${graphCheck != 3 }">
                                	<span class="charKindSelect btn btn-outline-danger btn-block rounded-pill shadow" onclick="searchGraphAjax(3)">만족성</span> 
                                </c:if>
                                <c:if test="${graphCheck != 4 }">
                                	<span class="charKindSelect btn btn-outline-warning btn-block rounded-pill shadow" onclick="searchGraphAjax(4)">의사소통</span> 
                                </c:if>
                                <c:if test="${graphCheck != 5 }">
                                	<span class="charKindSelect btn btn-outline-secondary btn-block rounded-pill shadow" onclick="searchGraphAjax(5)">일정준수</span> 
                                </c:if>
                                <c:if test="${graphCheck != 6 }">
                                	<span class="charKindSelect btn btn-outline-primary btn-block rounded-pill shadow" onclick="searchGraphAjax(6)">적극성</span>
                                </c:if>
                                
                                </h6>                                    
                            </div>
                            <div class="card-body text-center">
                                <div id="apex_bar_chart" class="height-500"></div>
                            </div>
                        </div>
                        <div>
                        
                        </div>
   
    
    
    <!-- 첫번째 modal 창 -->
    
    
			

       
       
       

       

	<script>

	
	//barGraph 에서 전문성, 평균 등등 클릭하면 열리는 모달창( 여기에 그래프에 값이 있는 use_id 값을 넘겨줘서 check 박스 해주기로 함. )
	function barGraphModal(kindCheck){
		var checkUserList = JSON.parse('${checkUserList}');
		//원래 선택되어 있는 userId의 배열 리스트 
		$.ajax({
			url : "${cp}/evaluation/viewUserList" , 
			type : "POST" , 
			cache : false , 
			data : {} , 
			success : function(data){
				//저장된 List<user_id> 값을 가져오기 
				  cont = "<ul>                                                                                                                  	";
				 for(var i = 0 ; i < data.userList.length ; i++){
            		cont += "<li class='userCheckLi'>                                                  														"; 
              		cont += "<h6>																													";        
              		cont += "&nbsp; <input type='checkbox'                                                                                        	";
       	     	 for(var j= 0 ; j < checkUserList.length ; j++){
       	  			if(data.userList[i].user_id == checkUserList[j] ){     
       	  				cont += "checked" 
       	       		}
       	  		 }     
       	     	 
              	  cont += " value='" + data.userList[i].user_id + "' class='barChk' name='selectedUser'>                           						";
              	  cont +=  data.userList[i].user_id  			                                 												 
              	  cont += "</h6>																													"; 
                  cont += "</li>                                                                                                                	"; 					
				} //for 문의 마지막
				
           	  	  cont += "</ul><br><br>                                                                                                        	";     
           	  	$('.modal-body').html(cont);
				
			},
			error : function(){
			}
			
		}) //ajax 끝
		
		
		
		$('.kindCheck').val(kindCheck)
		$('.checkUserList').val(checkUserList)
		
		$('#barGraphModal').modal('show');
		
		}
	
	
	
	
	//modal 저장할때 
	//modal 창에서 비교하기 버튼 클릭하기 두번째 그래프인 bar Chart 에서 위에 각각의 것( 평균 ,전문성 , 만족도 , 의사소통 , 일정준수 , 적극성)들 클릭한 뒤 modal 창에서 비교 버튼 클릭 
	
	function searchGraphAjax(kindCheck){
			var CheckedUser = []; 
		    //2021.04.01
			var CheckedUser = JSON.parse('${checkUserList}');
			/* var graphCheck = $('.kindCheck').val(); */
			var graphCheck = kindCheck
			/* $('.barChk:checked').each(function(){
				//alert($(this).val());
				CheckedUser.push($(this).val());
			});  */
			barChartGraph(CheckedUser , graphCheck);
			$('#barGraphModal').modal('hide');
			//$('.close').onclick
		}
	
	//barChart 만들어주는 function script
	function barChart2(){
	      	//user_id
			var array = [];
	      	//평균값
	 	    var valueArray = [];
	 	    var proArray = [];
	 	    var satArray = [];
	 	    var commArray = [] ; 
	 	    var ontimeArray = []; 
	 	    var activityArray = []; 
	 	    var chartColor = '#0B614B';
	    	<c:forEach items="${partnerEvalMap}" var="item">
	    		  array.push("${item.key}");
	    		  <c:if test="${graphCheck == 1 }">
	    		  	valueArray.push("${item.value.average}");
	    		  	chartColor = '#0B614B'; 
	    		  </c:if>
	    		  <c:if test="${graphCheck == 2 }">
	    		  	valueArray.push("${item.value.pro}");
	    			chartColor = '#2ECCFA'; 
	    		  </c:if>
	    		  <c:if test="${graphCheck == 3 }">
	    		  	valueArray.push("${item.value.sat}");
	    			chartColor = '#FE642E'; 
	    		  </c:if>
	    		  <c:if test="${graphCheck == 4 }">
	    		  	valueArray.push("${item.value.comm}");
	    			chartColor = '#D7DF01'; 
	    		  </c:if>
	    		  <c:if test="${graphCheck == 5 }">
	    		  	valueArray.push("${item.value.ontime}");
	    			chartColor = '#0B2F3A'; 
	    		  </c:if>
	    		  <c:if test="${graphCheck == 6 }">
	    		  	valueArray.push("${item.value.activity}");
	    			chartColor = '#0431B4'; 
	    		  </c:if>
	     	</c:forEach> 
	     	 
	
	     $(function () { 
	    
	 	    var primarycolor = getComputedStyle(document.body).getPropertyValue('--primarycolor');
	 	    var bodycolor = getComputedStyle(document.body).getPropertyValue('--bodycolor');
	 	    var bordercolor = getComputedStyle(document.body).getPropertyValue('--bordercolor');
	 	    var theme = 'light';
	 	    if ($('body').hasClass('dark')) {
	 	        theme = 'dark';
	 	    }
	 	    if ($('body').hasClass('dark-alt')) {
	 	        theme = 'dark';
	 	    }
	
			
	     options = {
	        theme: {
	            mode: theme
	        },
	        chart: {
	            height: 350,
	            type: 'bar',
	            dropShadow: {
	            enabled: true,
	            color: '',
	            top: 18,
	            left: 7,
	            blur: 10,
	            opacity: 0.1
	          }
	        },
	        colors:[chartColor],
	        plotOptions: {
	            bar: {
	                horizontal: false,
	            }
	        },
	        dataLabels: {
	            enabled: true
	        },
	        series: [{
	                data: valueArray
	            }],
	        xaxis: {
	            categories: array,
	        }
	    }
	
	    var chart = new ApexCharts(
	            document.querySelector("#apex_bar_chart"),
	            options
	            );
	
	    chart.render();
	
	     }); 
   
    
	}
    
	

	</script>
       
       
       		
       