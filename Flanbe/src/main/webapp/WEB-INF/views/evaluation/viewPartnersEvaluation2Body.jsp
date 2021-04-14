<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
<!-- 차트 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<!-- d3 -->
<script src="http://d3js.org/d3.v3.js"></script>

<!-- START: Page CSS-->
<link href="${cp}/dist/vendors/lineprogressbar/jquery.lineProgressbar.min.css" rel="stylesheet">
<link href="${cp}/dist/vendors/ionicons/css/ionicons.min.css" rel="stylesheet"> 
<!-- END: Page CSS-->


		
<!-- 차트를 위해 수정이가 쓰는것 나중에 마지막으로 정리해주기 -->
<!-- START: Page CSS-->
<link rel="stylesheet" href="${cp}/dist/vendors/quill/quill.snow.css" />
<link rel="stylesheet" href="${cp}/dist/vendors/chartist-js/chartist.min.css">
<script src="${cp}/dist/vendors/chartist-js/chartist.min.js"></script>
<!-- END: Page CSS-->

<style>

/* 	.list-unstyled inbox-nav mb-0 mt-2 notes-menu { */
/* 		display: inline; */
/* 	} */
	html, body {
			margin: 0;
			padding: 0;
			height: 100%;
		}
	
    .evalTable {
    
	    width : 300px;
	    height : 300px;
    
    }
    
    .chartcan {
    
    	display:inline
    }
    
    .blue {background : #E89494; display:inline }
    .red {background : #F1CECE;}
    .green {background : #ECD7B1; display:inline }
    .yellow {background : #A1B397;}
    .pink {background : #BFB6D0}
    
    .evalbar {
    	display : block ; 
    	margin : 10px 0 ;
    	color : #fff;
    	font-size : 20px; 
    	line-height : 1.3em;
    	text-align : center; 
    	border-radius : 15px;
    	width : 100px;
    }
    
    #projectEval {
    	width : 200px;
    	border : 1px solid #CDCDCD;
    	margin-left : 30px;
    	
    }
    
    #evalAllDiv {
    	display : inline ; 
    }
    
    
    li{
    	list-style: none;
    }
    
    .paging {
		float : bottom;
	}
	
	.charKindSelect:hover {
		background-color : #FFFF00;
		cursor: pointer;
	
	
	}
	.charKindSelect {
		display : inline-block;
		height : 40px;
		width : auto;
	}
	
	.pathChartInfo1 {
	    height : auto; 
	}
	.pathChartInfo2 {
	
	 
	
	}	

	.projectList {
		float : left ;
		width : 70%;
		height : 100%;
		position : relative; 
	}
	
	.CheckedUserList {
	
		float : right ; 
		width : 20%;
		height : auto;
		position : relative; 
		overflow: scroll; 
	}
	
	.pathGraphFromOneUser :hover {
		background-color: silver;
	} 
	
	.changelistColor {
		background-color: #0489B1 ;
	}

	
	.hoverUserInfo {
		border: 1px solid black;
		padding : 10px;
	}
    
    .leftBarUserList {
    	margin-right: 35px;
    	cursor : pointer;
  
    }
    .pageButton {
    	width : 30px; 
    	/* float : left; */ 
		display : inline-block
    }
    .pageNation {
    	text-align: center;
    	padding : 30px;
    }

	.start {
		padding-top : 100px; 
	}
	
	.totalDiv {
		display: flex; 
	}

    
</style>
	<!-- start script -->
<script charset="UTF-8">
	
	
	//기본 정보
	var user_id = '${user_id}';

	
	
	$(document).ready(function(){
	
	
		
		
		basicInfo();
		
		//그래프 비교의 메인 화면 이동. (세부 아작스 이동은 밑에서 만들것임)
		//왼쪽 사이드바의 userList 선택하고 검색누르면 비교 테이블의 메인화면 이동(이 안에서 여러개의그래프가 각각 ajax 로 작동함) 
		$('#leftSide').on('click' , '.searchGraph' , function(){
			var CheckedUser = []; 
			var graphCheck = $(this).attr('id');
			$('.chk:checked').each(function(){
				CheckedUser.push($(this).val());
			}); 
			CheckedUser.push('${user_id}'); 
			//필요한 골조를 만들어 준다.
			var basic = '<div class="row frame">';
			//첫번째 그래프 자리
				basic += '<div class="col-12 col-md-6 mt-3 firstFrame">';
				basic += '</div>';
			//두번째 그래프 자리
				basic += '<div class="col-12 col-md-6 mt-3 secondFrame">';
				basic += '</div>';
				
			//세번째 그래프 자리
				basic += '<div class="col-12 mt-3 thirdFrame">';
				basic += '</div>';
			//네번째 그래프 자리
				basic += '<div class="col-12 col-md-6 mt-3 forthFrame">';
				basic += '</div>';		
			//네번째 그래프 자리
				basic += '<div class="col-12 col-md-6 mt-3 fifthFrame">';
				basic += '</div>';	
			
			
			
				basic += '</div>';
			//만든 기본 골조를 넣어준다.	
			$('#MainBoard').html(basic);
			//각각의 ajax 를 호출하여 각각의 그래프를 한개씩 넣어준다. 
			//첫번째 path차트 그래프 그리기
			
			
			//두번째 barChart(막대그래프) 그래프 그리기
			barChartGraph(CheckedUser , graphCheck);
			pathGraph('${user_id}');
			radarChart('${user_id}');
			
		})
		
		
		$('#projectSearchTitle3').on('click' , '.leftBarUserList' , function(){
			$(this).addClass("changelistColor");
			$(this).next().show();
		}) 


		$('#projectSearchTitle3').on('mouseleave' , '.leftBarUserList' , function(){
			$(this).removeClass("changelistColor");
			$(this).next().hide();
		}) 
	})
	
	function basicInfo(){
		$('#myTab9').hide();
		$('#ProjectSearch1').hide();
		$('#ProjectSearch2').hide();
		$.ajax({
				url : "${cp}/evaluation/projectEvalInfo" , 
				type : "POST", 
				cache : false, 
				data :  { user_id : '${user_id}' } , 
				success : function(data){
						$('#MainBoard').html(data);
						mainInfoAverageGraph();
						basicInfoTable(1);
				},
				error : function(){
					swal({
						title: "Error",
						text: "에러 발생",
						type: "error",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-primary',
						confirmButtonText: '확인'
					});
				}
				
	})
	
	}
	
	
	function basicInfoTable(curPage){
		$.ajax({
			url : "${cp}/evaluation/projectEvalInfoTable" , 
			type : "POST", 
			cache : false , 
			data : { curPage : curPage , user_id : '${user_id}'}, 
			success : function(data){
				$('.evalContTable').html(data); 
			},
			error : function(){
				swal({
					title: "Error",
					text: "에러 발생",
					type: "error",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-primary',
					confirmButtonText: '확인'
				});	
			}
		})
	}
	
	//참여한 프로젝트 버튼 눌렀을 때 메인으로 나타나는 보드 부분 아작스로 분리해줌
	function mainProjectBoard(page , check){
		$('#myTab9').show();
		$('#ProjectSearch1').show();
		$('#ProjectSearch2').hide();
		$.ajax({
			url : "${cp}/evaluation/evalMainBoard", 
			type : "POST", 
			cache : false , 
			data :  { page : page , check : check , user_id : '${user_id}' } , 
			success : function(data){
				$('#MainBoard').html(data);
			},
			error : function(){
				swal({
					title: "Error",
					text: "에러 발생",
					type: "error",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-primary',
					confirmButtonText: '확인'
				});
			}
		})
		
	}
	
	

	
	
	//비교 위해 유저리스트 가져오기 시작
	
	function viewUserList(){
		$('#myTab9').hide();
		$('#MainBoard').html("");
		$('#ProjectSearch1').hide();
		$('#ProjectSearch2').show();
		$.ajax({
				url : "${cp}/evaluation/viewUserList" ,
				type : "POST", 
				cache : false, 
				success : function(data){
                    	  cont = " <h6  class='mb-0'>파트너스 비교</h6>  <input type='button' class='btn btn-primary searchGraph' id=1 style='float : right' value='조회' ><br><br>    ";
						  cont += "<ul>																													                          "; 
                    for(i = 0 ; i < data.userList.length ; i++){
                    	if(data.userList[i].user_id != '${user_id}'){
                    	  cont += "<li class='leftBarUserList'>                                                  										                          "; 
                    	  cont += "<h6>																													                          ";        
                    	  cont += "&nbsp; <input type='checkbox' value='" + data.userList[i].user_id + "' class='chk' name='selectedUser'>                           			  ";
                    	  cont +=  data.userList[i].user_id  			                                 												                           ;
                    	  cont += "</h6>																												                          "; 
                          cont += "</li>                                                                       																	  ";      
                    	  cont += "<div class='hoverUserInfo' >                                                     															  ";
                    	  cont += "<h6><span class='badge outline-badge-success'> 아이디  </span>  :&nbsp;&nbsp;" + data.userList[i].user_id + " </h6>"                              ; 
                    	  cont += "<h6><span class='badge outline-badge-success'>  보유기술  </span>  :&nbsp;&nbsp;" + data.userList[i].u_skills + "</h6>"                            ; 
                    	  cont += "<h6><span class='badge outline-badge-success'> 경력  </span>  :&nbsp;&nbsp;" + data.userList[i].careers + "</h6>"                                 ; 
                    	  cont += "<h6><span class='badge outline-badge-success'> 전문분야  </span><br> " + data.userList[i].us_kind + "</h6>"                                        ; 
                    	  cont += "</div>																																		  ";
                    	}
                    }
                    	  cont += "</ul><br><br>                                                                         										                  ";	
						$('#projectSearchTitle3').html(cont);
						$('.hoverUserInfo').hide(); 
				},
				error : function(){
					swal({
						title: "Error",
						text: "에러 발생",
						type: "error",
						showCancelButton: false,
						/* cancelButtonClass: 'btn-danger', */
						confirmButtonClass: 'btn-primary',
						confirmButtonText: '확인'
					});
				}
			
			
		})
	}
	
	//그래프 script
	// 첫번째 그래프 pathGraphAjax.jsp 
	function pathGraph(CheckedUser){
		$.ajax({
			url : "${cp}/evaluation/pathGraph", 
			type : "POST" , 
			cache : false , 
			data : {checkedUser : CheckedUser} , 
			traditional : true , 
			success : function(data){
				$('.firstFrame').html(data);
				pathGraph1()
			},
			error : function(){
				swal({
					title: "Error",
					text: "에러 발생",
					type: "error",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-primary',
					confirmButtonText: '확인'
				});
			}
				
			
		})
		
		
		
	}
	
	//barChartGraph 두번째 그래프 
	
	function barChartGraph(CheckedUser , graphCheck){

		
		$.ajax({
			url : "${cp}/evaluation/varChart" , 
			type : "POST" , 
			cache : false , 
			data : {checkedUser : CheckedUser , graphCheck : graphCheck}  , 
			traditional : true, 
			success : function(data) {
				//기본값은 평균값으로 barChart 그래프가 나오지만 전문성, 만족도 , 의사소통 ,일정준수 , 적극성을 각각 클릭가능 
				$('.secondFrame').html(data);
				barChart2();
			},
			error : function(){
				swal({
					title: "Error",
					text: "에러 발생",
					type: "error",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-primary',
					confirmButtonText: '확인'
				});
			}
			
		})			
		
	}
	
	
	function userListHover(){
		//골조 만들기 
		cont = ""
		cont = "<span>유저 이름 : </span>";
		cont = "<span>총 경력 : </span>";
		cont = "<span>보유 기술 : </span>";
		cont = "<span>가장 많이 수행한 분야 : </span>";
	}
	
	
	//세번째 그래프 
	function radarChart(user_id){
		
		$.ajax({
			url : "${cp}/evaluation/allAverageEval" , 
			type : "POST" , 
			cache : false , 
			data : { user_id : user_id}, 
			success : function(data) {
				$('.thirdFrame').html(data);
				radarScript()
			},
			error : function(){
				swal({
					title: "Error",
					text: "에러 발생",
					type: "error",
					showCancelButton: false,
					/* cancelButtonClass: 'btn-danger', */
					confirmButtonClass: 'btn-primary',
					confirmButtonText: '확인'
				});	
			}
		})
	}
</script>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- START: Main Content-->
<main>
    <div class="container-fluid site-width">
        <!-- START: Breadcrumbs-->
        <div class="row">
            <div class="col-12  align-self-center">
                <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
                    <div class="w-sm-100 mr-auto"><h4 class="mb-0">'${user_id}'님의 파트너스 평가 페이지 </h4></div>

<!--                     <ol class="breadcrumb bg-transparent align-self-center m-0 p-0"> -->
<!--                         <li class="breadcrumb-item">Home</li> -->
<!--                         <li class="breadcrumb-item">App</li> -->
<!--                         <li class="breadcrumb-item active"><a href="#">Notes</a></li> -->
<!--                     </ol> -->
                </div>
            </div>
        </div>
        <!-- END: Breadcrumbs-->

        <!-- START: Card Data-->
        <div class="row totalDiv" >
            <div class="col-12 col-lg-3 col-xl-2 mb-4 mt-3 pr-lg-0 flip-menu" >
                <div class="card border h-100 mail-menu-section leftBarAll" >
                    <ul class="list-unstyled inbox-nav mb-0 mt-2 notes-menu">
                        <li class="nav-item" onclick="basicInfo()"><a class="nav-link active"><i class="icon-envelope pr-2"></i> 기본 정보</a></li>
                        <li class="nav-item" onclick="mainProjectBoard( 1 , 'basic')"><a class="nav-link active">
                        <i class="icon-star pr-2"></i>참여한 프로젝트</a></li>
                        <li class="nav-item" onclick="viewUserList()"><a class="nav-link active"><i class="icon-exclamation pr-2"></i>비교</a></li>                               
                    </ul>
                    <div id="leftSide">
                   	  <div id="ProjectSearch1" class="card-header py-1 mt-4">                                 
                        <h6 id="projectSearchTitle1" class="mb-0">프로젝트 검색</h6>
                      </div>
                      <div id="ProjectSearch2" class="card-header py-1 mt-4" style="overflow : auto; height : 820px;">                                 
                        <!-- id="projectSearchTitle2" -->
                       <!--  <h6  class="mb-0">파트너스 비교</h6><br> -->
                        <h6 id="projectSearchTitle3" class="mb-0">
                        </h6>
                      </div>
                    </div>
                    
                    <ul class="nav flex-column font-weight-bold mt-3 note-label" id="myTab9" role="tablist">
                        <li class="nav-item  px-3">
                            <a class="nav-link text-primary" data-label="business-note" onclick="mainProjectBoard(1 , 'latest')" >
                                <i class="icon-pin"></i> 최신등록순
                            </a>
                        </li>
                        <li class="nav-item  px-3">
                            <a class="nav-link text-danger" data-label="private-note" onclick="mainProjectBoard(1 , 'highScore')" >
                                <i class="icon-pin"></i> 평점높은순
                            </a>
                        </li>
                        <li class="nav-item  px-3">
                            <a class="nav-link text-warning" data-label="social-note" onclick="mainProjectBoard( 1 , 'lowScore' )">
                                <i class="icon-pin"></i> 평점낮은순
                            </a>
                        </li>
                        <li class="nav-item px-3 ">
                            <a class="nav-link text-info" data-label="work-note" onclick="mainProjectBoard( 1, 'highMoney') ">
                                <i class="icon-pin"></i> 금액높은순
                            </a>
                        </li>

                    </ul>

                </div>
            </div>
            <div class="col-12 col-lg-9 col-xl-10 mb-4 mt-3 pl-lg-0 MainBoardParent" style="height : 1000px;">
                <div class="card border  h-100 notes-list-section" id="MainBoard" style="overflow : auto;"> 
                   
                </div>
            </div>
        </div>
    </div>
</main>


<!-- START: Page Vendor JS-->
<script src="${cp}/dist/vendors/apexcharts/apexcharts.min.js"></script> 
<script src="${cp}/dist/vendors/echarts/echarts.min.js"></script>
<script src="${cp}/dist/js/echart.script.js"></script>
<script src="${cp}/dist/js/apex.script.js"></script>
<script src="${cp}/dist/vendors/chartjs/Chart.min.js"></script>
<script src="${cp}/dist/js/chartjs.script.js"></script>
<!-- END: Page Vendor JS-->
        
      
     
     
<!-- Modal -->
<div class="modal fade" id="barGraphModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLabel">비교</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      	<input type="hidden" class="checkUserList">
      	<input type="hidden" class="kindCheck">
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" onclick="searchGraphAjax()" class="btn btn-primary">선택한 아이디로 평가 비교하기</button>
        <button type="button" class="btn btn-secondary close" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
     
     
     
       
