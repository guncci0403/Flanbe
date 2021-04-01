<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 검색시 최신등록순 : data-type=business-note class(????) 는 starred , 평점 높은 순 : personal-note 클래스에 important 평점 낮은순 : work-note 금액 높은순 : social-note  // 기타를 위해 private-note -->

<a href="#" class="d-inline-block d-lg-none flip-menu-toggle border-0"><i
	class="icon-menu"></i></a>
<div class="row notes">
	<div
		class="col-12  col-md-6 col-lg-4 my-3 note private-note all starred"
		data-type="social-note">
		<div class="card">
			<div class="card-content">
				<div class="card-body p-4">
					<h5 class="mb-3 font-w-500">등록된 포트폴리오 수</h5>
					<p class="font-w-500 tx-s-12">
						<i class="icon-calendar"></i> : ${countPortfolio} 개
					</p>
				</div>
			</div>
		</div>
	</div>
	<div
		class="col-12  col-md-6 col-lg-4 my-3 note social-note all starred"
		data-type="social-note">
		<div class="card">
			<div class="card-content">
				<div class="card-body p-4">
					<h5 class="mb-3 font-w-500">프로젝트 평균 평점 : ${avgAllListEval.average}</h5>
					<p class="font-w-500 tx-s-12"></p>
					<h4>
						<c:if test="${averageEvaluation != 0 }">
							<c:forEach begin="0" end="${averageEvaluation - 1}">⭐</c:forEach>
						</c:if>

						<c:if test="${emptyStar != 0}">
							<c:forEach begin="0" end="${emptyStar - 1}">✩</c:forEach>
						</c:if>
					</h4>

				</div>
			</div>
		</div>
	</div>




	<div class="col-12  col-md-6 col-lg-4 my-3 note work-note all starred"
		data-type="social-note">
		<div class="card">
			<div class="card-content">
				<div class="card-body p-4">
					<h5 class="mb-3 font-w-500">참여한 프로젝트 갯수</h5>
					<p class="font-w-500 tx-s-12">
						<i class="icon-calendar"></i> : ${finishProject} 개
					</p>
				</div>
			</div>
		</div>
	</div>


</div>
<div class="row">
	<div class="card col-12 col-md-12 mt-3">
		<div
			class="card-header d-flex justify-content-between align-items-center">
			<h6 class="card-title">${oneUserId}와 모든 파트너스의 점수 비교</h6>
		</div>
		<div class="card-body text-center">
			<div id="apex_bar_chart" class="height-500"></div>
		</div>
	</div>
</div>
<div class="row">
        <div class="col-12 col-md-6 mt-3">
            <div class="card">  
                <div class="card-header d-flex justify-content-between align-items-center">                               
                    <h6 class="card-title">파트너스가 받은 평가의 총 평균</h6>                                    
                </div>
                <div class="card-body text-center">                                                                
                    <canvas id="chartjs-other-polar"></canvas>
                </div>

            </div>
        </div>
	<div class="col-12 col-md-6 mt-3">
		<div class="card">
			<div
				class="card-header d-flex justify-content-between align-items-center">
				<h6 class="card-title">수행한 분야</h6>
			</div>
			<div class="card-body text-center">
				<div id="apex_donut_chart" class="height-500"></div>
			</div>
		</div>
	</div>
</div>


	<div class="card evalContTable">
	    
	    <!-- 나중에 ajax 로 따로 페이징처리 해준 테이블을 넣을 것이다. -->
	</div> 
	<br><br>

	


<script>

// 그래프에 넣을 배열 변수 만들기 

// 모든 클라이언트의 평가 테이블에 들어갈 평가 

// 받은 모든 평균 평점 구하기 

		var h_web = ${userHistoryVo.h_web}
		var h_app = ${userHistoryVo.h_app}
		var h_pub = ${userHistoryVo.h_pub}
		var	h_game =  ${userHistoryVo.h_game}
		var h_etc = ${userHistoryVo.h_etc}
	   
		
		var pro = ${avgAllListEval.pro}
		var sat = ${avgAllListEval.sat}
		var comm = ${avgAllListEval.comm}
		var ontime = ${avgAllListEval.ontime}
		var activity = ${avgAllListEval.activity}
		var average = ${avgAllListEval.average}

		
		
		
		//mainInfo 에 있는 맨처음 나오는 그래프에 들어갈 값들		
		
		//클릭한 파트너스의 평가평균값 
		//점이아니라 이사람의 평균값은 가로선으로 곧게 뻗어서 allUserEvalAverageList의 갯수만큼 찍을것이다. 
		
		
		var all_User_Id_Array = [] 
		var all_User_Average = []
			all_User_Id_Array.push('${oneUserId}'); 
			all_User_Average.push('${oneUserAverage}')
			<c:forEach items="${allUserEvalAverageList}" var="allUserEvalAverageList">
				all_User_Id_Array.push('${allUserEvalAverageList.user_id}') 
				all_User_Average.push('${allUserEvalAverageList.average}')
			</c:forEach>
		
		
		
		
	function mainInfoAverageGraph() {
		

	
		(function($) {
			var primarycolor = getComputedStyle(document.body)
					.getPropertyValue('--primarycolor');
			var bodycolor = getComputedStyle(document.body).getPropertyValue(
					'--bodycolor');
			var bordercolor = getComputedStyle(document.body).getPropertyValue(
					'--bordercolor');
			var theme = 'light';
			
			   

			
			//////////////////////////////////////Other Chart Polar /////////////////   
		    var randomScalingFactor = function () {
		        return Math.round(Math.random() * 100);
		    };

		    var chartColors = window.chartColors;
		    var color = Chart.helpers.color;
		    var config = {
		        data: {
		            datasets: [{
		                    data: [
		                    	pro,
		                    	sat,
		                    	comm,
		                    	ontime,
		                    	activity
		                    	
		                    	
		                    	
		                        /* randomScalingFactor(),
		                        randomScalingFactor(),
		                        randomScalingFactor(),
		                        randomScalingFactor(),
		                        randomScalingFactor(), */
		                    ],
		                    backgroundColor: [
		                        color(chartColors.red).alpha(0.5).rgbString(),
		                        color(chartColors.orange).alpha(0.5).rgbString(),
		                        color(chartColors.yellow).alpha(0.5).rgbString(),
		                        color(chartColors.green).alpha(0.5).rgbString(),
		                        color(chartColors.blue).alpha(0.5).rgbString(),
		                    ],
		                    label: 'My dataset' // for legend
		                }],
		            labels: [
		                '전문성',
		                '만족도',
		                '의사소통',
		                '일정준수',
		                '적극성'
		            ]
		        },
		        options: {
		            responsive: true,
		            legend: {
		                position: 'right',
		                labels: {
		                    fontColor: bodycolor
		                }
		            },

		            scale: {
		                ticks: {
		                    beginAtZero: true
		                },
		                reverse: false,

		                angleLines: {
		                    color: bordercolor
		                },

		                gridLines: {
		                    display: true,
		                    color: bordercolor,
		                    zeroLineColor: bordercolor
		                }

		            },
		            animation: {
		                animateRotate: false,
		                animateScale: true
		            }
		        }
		    };

		    var chartjs_other_polar = document.getElementById("chartjs-other-polar");
		    if (chartjs_other_polar) {
		        window.myPolarArea = Chart.PolarArea(chartjs_other_polar, config);
		    }

			/////////////////////////////////// Donut Chart ///////////////////// 
			options = {
				theme : {
					mode : theme
				},
				chart : {
					width : 490,
					type : 'donut',
				},
				labels : [ '웹', '어플리케이션', '퍼블리셔', '게임'  , 'ETC'],
				series : [ h_web, h_app, h_pub, h_game , h_etc ],
				responsive : [ {
					breakpoint : 480,
					options : {
						chart : {
							width : 350
						},
						legend : {
							position : 'bottom'
						}
					}
				} ]
			}

			var chart = new ApexCharts(document
					.querySelector("#apex_donut_chart"), options);

			chart.render();

	
			// 바 그래프 
			
			/////////////////////////////////// Bar Chart /////////////////////
		    
			options = {
		        theme: {
		            mode: theme
		        },
		        chart: {
		            height: 350,
		            type: 'bar',
		            dropShadow: {
		            enabled: true,
		            color: '#000',
		            top: 18,
		            left: 7,
		            blur: 10,
		            opacity: 0.1
		          }
		        },
		        colors:['#17a2b8'],
		        plotOptions: {
		            bar: {
		                horizontal: true,
		            }
		        },
		        dataLabels: {
		            enabled: false
		        },
		        series: [{
		                data: all_User_Average
		            }],
		        xaxis: {
		            categories: all_User_Id_Array,
		        }
		    }

		    var chart = new ApexCharts(
		            document.querySelector("#apex_bar_chart"),
		            options
		            );

		    chart.render();
			
			
		})(jQuery);

	};
</script>
