<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
             
    
		<!-- 첫번째 그래프 바디 -->
 		<!-- 	<div class="col-12 col-md-6 mt-3"> -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">                               
                        <h6 class="card-title">${user_id }님의 가장 최근 5번의 프로젝트에서 받은 </h6>
                        <h6> 💛 : 만족도 , 💙 : 전문성 , 💖: 평균</h6>                                   
                    </div>
                    <div class="card-body">                                      
                        <div class="ct-svg-animation"></div>
                    </div>
                    
                    <div class="pathChartInfo1">
	                    <div class="projectList">
	                    	<c:forEach items="${evalListVo}" var="evalVo">
	                    		<h6> &nbsp; <i class="fas  h5 mr-2 fa-clipboard"></i> ${evalVo.rnum}번째 프로젝트 : ${evalVo.p_title} </h6>
	                    	</c:forEach>
	                    </div>
	                    <%-- <div class="CheckedUserList" style="height : 200px;">
	                    <h5>아이디 검색</h5>
	                    	<c:forEach items="${checkedUser}" var="User">
	                    		&nbsp;&nbsp;<h6><span class="pathGraphFromOneUser" <c:if test="${User == user_id }">style="background-color : yellow"</c:if> onclick="pathGraph('${User}')" data-clickedUser="${User}">${User}</span></h6><br>
	                    	</c:forEach>
	                    </div> --%>
                    </div>
                </div>
    	<!--         </div>  -->
    
       <!-- 첫번째 그래프 스크립트 -->
       <script>
       
       
       
       //한사람 한사람씩만 볼 수 있고 아래에는 회원 아이디가 나오게 한다. 
       //최신 프로젝트의 vo 값 5개의 값의 전문성 , 만족도 , 평균 
        
       
       
       function pathGraph1(){
    	   //하나의 user_id 값에 따른 map 
    	   //map key = "user_id" , value 값 : "evaluationVo 여러개의 값"
    	   // List<evaluationVo>
    	   
    	   // averageArray 는 파란색 , 
  	        var averageArray = [];
            var proArray = []; 
            var satArray = []; 
  	       console.log("1111" + "${evalListVo}");
            <c:forEach items="${evalListVo}" var="item">
            	
            	averageArray.push("${item.average}");
              	proArray.push("${item.pro}");
              	satArray.push("${item.sat}");
           
            </c:forEach>
    	   
    	   
	       if ($('.ct-svg-animation').length > 0)
	       { 
	
	
	           var chart = new Chartist.Line('.ct-svg-animation', {
	               labels: ['1', '2', '3', '4', '5'],
	               series: [
	            	   averageArray,
	            	   proArray,
	            	   satArray
	                
	               ]
	           }, {
	               low: 0,
	               showArea: true,
	               showPoint: false,
	               fullWidth: true
	           });
	
	           chart.on('draw', function (data) {
	               if (data.type === 'line' || data.type === 'area') {
	                   data.element.animate({
	                       d: {
	                           begin: 2000 * data.index,
	                           dur: 2000,
	                           from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
	                           to: data.path.clone().stringify(),
	                           easing: Chartist.Svg.Easing.easeOutQuint
	                       }
	                   });
	               }
	           });
	       }
	       
       
       }
       </script>