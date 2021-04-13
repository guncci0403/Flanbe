<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">
/*     i { */
/*     	width : 300px; */
/*     	height : 300px; */
/*     } */
.lab{
	line-height: 2.3;
}
small{
	line-height: 2.8;
	color: grey;
}
select {
	width: 130px;
}
</style>

<script type="text/javascript">
		$(document).ready(function(){
			
			
			$('#summernote').summernote({
		            height: 250,
		            popover: {
		               image:[],
		               link:[],
		               air:[]
		            },
		            toolbar: [
		                 ['style', ['style']],
		                 ['font', ['bold', 'underline', 'clear']],
		                 ['fontname', ['fontname']],
		                 ['color', ['color']],
		                 ['para', ['ul', 'ol', 'paragraph']],
		                 ['table', ['table']],
		                 ['view', ['fullscreen', 'codeview']],
		               ]
		    });
			
			
			
			//글 등록하기
			$('#insertBtn').on('click' , function(){
				var user_id = $('#user_id').val();
				var select = $('#select').val();
				var status = $('#status').val();
				var progress = $('#progress').val(); 
				
				
				
				$('#form').submit()
				
			})
			
			$('#cancel').on('click' , function(){
				
				location.href="${cp}/note/viewMain"
				
			})
			
			
			
		});
			
	
		function yellostar(){
			$('#yelloStar').attr("disabled" , true);
			$('#blackStar').attr("disabled" , false);
			$('#starText').text('보통') 
			$('#starCheck').val('black')
		}
		
		function blackStar(){
			$('#yelloStar').attr("disabled" , false);
			$('#blackStar').attr("disabled" , true);
			$('#starText').text('중요') 
			$('#starCheck').val('yello')
		}
		
		function ProjectProgressOption(val){
// 			alert("????셀렉트박스"); 
			if(val == '01')
			$('#progress').val('0').prop("selected" , true); 
			else if(val == '03')
			$('#progress').val('100').prop("selected" , true); 	
		}
		
</script>


<script>
	//분류 etc 선택하면 input 태그 생성 입력하기
 	function selectDivisionEtc(value){
		var etcSelect = document.getElementById("etcSelect");
		if(value == "etc"){
			etcSelect.style.display = "block";
			
		}else{
			etcSelect.style.display = "none";
			
		}
		
	} 
	
	
	function insertEtc(value){
		var writeEtc = value.val();
		$('#etcReal').val(writeEtc);
		
	}
	
</script>


<%@ include file="/WEB-INF/views/common/noteSidebar.jsp" %>
<main>
	<div class="container-fluid site-width">
		<div class="row ">
			<div class="col-12  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">업무노트 작성</h4>
					</div>

					<ol class="breadcrumb bg-transparent align-self-center m-0 p-0">
						<li class="breadcrumb-item">Home</li>
						<li class="breadcrumb-item">Form</li>
						<li class="breadcrumb-item active"><a href="#">Wizard</a></li>
					</ol>
				</div>
			</div>
		</div>
		<!-- END: Breadcrumbs-->

		<!-- START: Card Data-->


		<div class="card">
			<div class="card-body">
				<div class="wizard mb-4">



					<div class="connecting-line"></div>
					<ul class="nav nav-tabs d-flex mb-3">
						<li class="nav-item mr-auto"><a class="nav-link position-relative round-tab text-left p-0 active border-0" data-toggle="tab" href="#id1"> <i class="icon-book-open position-relative text-white h5 mb-3"></i> <br>
						</a></li>


					</ul>
					<div class="form-row" style="margin-left: 1.7%">
							<label class="form-control col-1 lab" style="border: none"><i class="icon-star icons"></i>중요</label>
						<button disabled onclick="yellostar()" id="yelloStar" style="margin: 5px 1px 10px 0px; border: none;"><i class='fas fa-star' style="color: gold;"></i></button>
						<button onclick="blackStar()" id="blackStar" style="margin: 5px 0px 10px 1px; border: none;"><i class='far fa-star'></i></button>
					</div>
					<form id="form" action="${cp}/note/insertNote" method="POST" style="margin-left: 2%; margin-right: 2%;">

						<input type="hidden" disabled="disabled" value="${p_code}">

						<!-- <h2>코드들확인</h2> -->
						<!-- 프로젝트 코드 -->
						<input type="hidden" name="p_code" id="p_code" value="${p_code}">
						<!-- 중요표시 -->
						<input type="hidden" name="starCheck" id="starCheck" value="black">
						<!-- 그룹번호(최상위코드) 자식글 작성 일때만 나옴 -->
						<c:if test="${n_gno != null }">
							<input type="hidden" name="n_gno" value="${n_gno}">
						</c:if>
						<!-- 상위번호 자식글 작성일때만 나옴  -->
						<c:if test="${n_parent != null}">
							<input type="hidden" name="n_parent" value="${n_parent}">
						</c:if>


						<div class="tab-content">
							<div class="tab-pane fade active show" id="id1">
								<div class="form">
									<div></div>
									<!-- <span id="starText"></span> <small class="form-text"> : 중요도를 체크해주세요</small> <br> -->
									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-people icons"></i>담당자</label> <input class="form-control col-3" style="border: none" disabled type="text" value="${user_id}"> <input type="hidden" value="${user_id}" id="user_id" name="user_id"> <small class="form-text"></small>
									</div>

									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-tag icons"></i>업무분류</label>
											<select id="select" name="category" onchange="selectDivisionEtc(this.value)" style="margin-bottom: 10px;">
												<option selected="selected" value="structure">structure</option>
												<option value="interface">interface</option>
												<option value="safety">safety</option>
												<option value="test">test</option>
												<!-- etc 를 누르면 밑에 있는 name="etc" 인 input 태그가 나옴  등록이 여기서됨 -->
												<option value="etc">etc</option>
											</select> 
										<br> <input type="text" style="display: none; margin-left: 1%; margin-bottom: 10px;" value="" name="etc" id="etcSelect" placeholder="업무분류를 입력해 주세요"> <input type="hidden" value="" name="etc2"> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 원하는 업무를 선택하세요 직접 입력도 가능합니다.</small>
									</div>
									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-chart icons"></i>상태</label> <select id="status" name="n_state" onchange="ProjectProgressOption(this.value)"style="margin-bottom: 10px;">
											<option value="01">진행전</option>
											<option value="02">진행중</option>
											<option value="03">진행완료</option>
										</select> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 업무를 진행전/진행중/진행완료로 구분해 주세요</small>
									</div>

									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-chart icons"></i>진행률</label> <select id="progress" name="progress" style="margin-bottom: 10px;">
											<option value="0">0%</option>
											<option value="10">10%</option>
											<option value="20">20%</option>
											<option value="30">30%</option>
											<option value="40">40%</option>
											<option value="50">50%</option>
											<option value="60">60%</option>
											<option value="70">70%</option>
											<option value="80">80%</option>
											<option value="90">90%</option>
											<option value="100">100%</option>
										</select> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 업무의 진행률을 선택해 주세요</small>
									</div>

									<c:if test="${ parentTitle != null }">
										<div class="form-row">
											<label class="form-control col-1 lab" style="border: none"><i class="icon-people icons"></i>상위업무</label> <label>${parentTitle}</label> <small class="form-text"></small>
										</div>
									</c:if>


									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-calendar icons"></i>시작일자</label> <input type="Date" name="n_sdt"  style="margin-bottom: 10px;"> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 시작일자와 입력해 주세요</small>
									</div>
									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-calendar icons"></i>마감일자</label> <input type="Date" name="n_edt"  style="margin-bottom: 10px;"> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 마감일자를 입력해 주세요</small>
									</div>
									<br>
									<div class="form-group">
										<label class=""><i class="icon-doc icons"></i>업무명</label> <input type="text" name="n_title" class="form-control transparent" id="title" placeholder="업무명을 입력해주세요"> <small class="form-text"></small>
									</div>
									<div class="form-group">
										<label class=""><i class="icon-speech icons"></i>업무내용</label><br>
										<textarea id="summernote" name="n_cont"></textarea>
									</div>
									<input type="hidden" value="${checkParent}" name="checkParent">



								</div>


							</div>
							<button type="button" id="cancel" class="btn float-right btn-secondary" value="" style="margin-left: 5px;">취소</button>
							<button type="button" id="insertBtn" class="btn float-right btn-primary">등록완료</button>
						</div>

					</form>
					<!-- form 태그끝 -->






				</div>
			</div>
		</div>


	</div>
</main>


