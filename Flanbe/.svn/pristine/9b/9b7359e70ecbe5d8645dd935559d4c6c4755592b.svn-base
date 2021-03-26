<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



		<div class="col-12 mt-3">
        	<div class="card">
	            <div class="card-header d-flex justify-content-between align-items-center">                               
	                <h6 class="card-title">전체 평균대비 ${user_id} 님의 점수</h6>                                   
	            </div>
	            <div class="card-body">                                      
	                <div id="e-radar-chart" class="height-500" _echarts_instance="ec_1616465377587" style="-webkit-tap-highlight-color: transparent; user-select: none;"><div style="position: relative; width: 805px; height: 500px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="805" height="500" style="position: absolute; left: 0px; top: 0px; width: 805px; height: 500px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>
	            </div>
           </div>
       </div>
    <script>
    /////////////////////// Radar Chart //////////////////////////
    
    function radarScript(){
    	
  	(function ($) {
  	    "use strict";

  	    var primarycolor = getComputedStyle(document.body).getPropertyValue('--primarycolor');
  	    var bordercolor = getComputedStyle(document.body).getPropertyValue('--bordercolor');
  	    var bodycolor = getComputedStyle(document.body).getPropertyValue('--bodycolor');

  	    var allPro = ${allUserEvaluationVo.pro};
    	var allSat = ${allUserEvaluationVo.sat};
    	var allComm = ${allUserEvaluationVo.comm};
    	var allOntime = ${allUserEvaluationVo.ontime};
    	var allActivity =  ${allUserEvaluationVo.activity};
    	
    	var onePro =  ${oneAverageEval.pro};
    	var oneSat = ${oneAverageEval.sat};
    	var oneComm = ${oneAverageEval.comm};
    	var oneOntime = ${oneAverageEval.ontime};
    	var oneActivity = ${oneAverageEval.activity};
    	
    	var oneWeb = ${oneHistoryVo.h_web};
    	var oneApp = ${oneHistoryVo.h_app}; 
    	var onePub = ${oneHistoryVo.h_pub};
    	var oneGame = ${oneHistoryVo.h_game};
    	var oneEtc = ${oneHistoryVo.h_etc};
    	
    	
    	
    var myradarChart = echarts.init(document.getElementById('e-radar-chart'));
    // specify chart configuration item and data


    var radaroption = {
        legend: {
            data: ['전체평균', '${user_id}', '${user_id}님의 경험분야'  , 'Li Si'],
            textStyle: {
                color: bodycolor
            }
        },
        radar: [
            {
                indicator: [
                    {text: '전문성'},
                    {text: '만족도'},
                    {text: '의사소통'},
                    {text: '일정준수'},
                    {text: '적극성'}
                ],
                center: ['25%', '50%'],
                radius: 120,
                startAngle: 90,
                splitNumber: 4,
                shape: 'circle',
                name: {
                    formatter: '[{value}]',
                    textStyle: {
                        color: bodycolor
                    }
                },
                splitArea: {
                    areaStyle: {
                        color: ['rgba(114, 172, 209, 0.2)',
                            'rgba(114, 172, 209, 0.4)', 'rgba(114, 172, 209, 0.6)',
                            'rgba(114, 172, 209, 0.8)', 'rgba(114, 172, 209, 1)'],
                        shadowColor: 'rgba(0, 0, 0, 0.3)',
                        shadowBlur: 10
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: bordercolor
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: bordercolor
                    }
                }
            },
            {
                indicator: [
                    {text: '웹' , max: 5},
                    {text: '어플리케이션', max: 5},
                    {text: '퍼블리싱', max: 5},
                    {text: '게임', max: 5},
                    {text: '기타', max: 5}
                ],
                center: ['75%', '50%'],
                radius: 120,
                name: {
                    formatter: '[{value}]',
                    textStyle: {
                        color: bodycolor
                    }
                }
            }
        ],
        series: [
            {
                name: 'Radar chart',
                type: 'radar',
                itemStyle: {
                    emphasis: {
                        lineStyle: {
                            width: 4
                        }
                    }
                },
                data: [
                    {
                        value: [allPro, allSat, allComm, allOntime, allActivity],
                        name: '전체평균',
                        symbol: 'rect',
                        symbolSize: 5,
                        lineStyle: {
                            normal: {
                                type: 'dashed'
                            }
                        }
                    },
                    {
                        value: [onePro, oneSat, oneComm, oneOntime, oneActivity],
                        name: '${user_id}',
                        areaStyle: {
                            normal: {
                                color: 'rgba(255, 255, 255, 0.5)'
                            }
                        }
                    }
                ]
            },
            {
                name: 'Transcript',
                type: 'radar',
                radarIndex: 1,
                data: [
                    {
                        value: [oneWeb, oneApp, onePub, oneGame, oneEtc],
                        //value: [0, 0, 0, 0, 0],
                        //value: [2, 3, 4, 5, 1],
                        name: '${user_id}님의 경험분야',
                        label: {
                            normal: {
                                show: true,
                                formatter: function (params) {
                                    return params.value;
                                }
                            }
                        }
                    }
                    /*  ,{
                        value: [2, 3, 4, 5, 1],
                        //value: [2, 3, 4, 5, 1],
                        name: 'Li Si',
                        areaStyle: {
                            normal: {
                                opacity: 0.9,
                                color: new echarts.graphic.RadialGradient(0.5, 0.5, 1, [
                                    {
                                        color: '#B8D3E4',
                                        offset: 0
                                    },
                                    {
                                        color: '#72ACD1',
                                        offset: 1
                                    }
                                ])
                            }
                        }
                    }  */
                ]
            }
        ]
    };
    // use configuration item and data specified to show chart
    myradarChart.setOption(radaroption);

    $(window).on('resize', function () {
        if (myradarChart != null && myradarChart != undefined) {
            myradarChart.resize();
        }
         if (myChart != null && myChart != undefined) {
            myChart.resize();
        }
         if (myBarChart != null && myBarChart != undefined) {
            myBarChart.resize();
        }
         if (mydoughnutChart != null && mydoughnutChart != undefined) {
            mydoughnutChart.resize();
        }
         if (mybubbleChart != null && mybubbleChart != undefined) {
            mybubbleChart.resize();
        }
    });
    
    
    
    
    })(jQuery);
    
    
    } //function 끝
    
  	
    
    </script>