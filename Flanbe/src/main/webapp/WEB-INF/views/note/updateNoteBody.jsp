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
			$('#updateBtn').on('click' , function(){
				var user_id = $('#user_id').val();
				var select = $('#select').val();
				var status = $('#status').val();
				var progress = $('#progress').val(); 
				
				
				
				$('#form').submit()
				
			})
			
			$('#cancel').on('click' , function(){
				
				var n_no  = $('#n_no').val()
				location.href="${cp}/note/viewOneNote?n_no=" + n_no;
				
			})
			
			
			
		});
			
	
		function yellostar(){
			$('#yelloStar').attr("disabled" , true);
			$('#blackStar').attr("disabled" , false);
			$('#starText').text('보통') 
			$('#starCheck').val('02')
		}
		
		function blackStar(){
			$('#yelloStar').attr("disabled" , false);
			$('#blackStar').attr("disabled" , true);
			$('#starText').text('중요') 
			$('#starCheck').val('01')
		}
		
		
		function ProjectProgressOption(val){
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
						<h4 class="mb-0">업무노트 수정</h4>
					</div>

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
					<form id="form" action="${cp}/note/updateNote" method="POST" style="margin-left: 2%; margin-right: 2%;">
						
						<input type="hidden" disabled="disabled" value="${noteVo.p_code}" >

						<!-- <h2>코드들확인</h2> -->
						<!-- 프로젝트 코드 -->
						<input type="hidden" name="p_code" id="p_code" value="${noteVo.p_code}">
						<!-- 노트번호 코드 -->
						<input type="hidden" name="n_no" id="n_no" value="${noteVo.n_no}">
						<!-- 중요표시 -->
						<input type="hidden" name="n_import" id="starCheck" value="${noteVo.n_import}">
						<!-- 그룹번호(최상위코드) 자식글 작성 일때만 나옴 -->
						<input type="hidden" name="n_gno" value="${noteVo.n_gno}">
						<!-- 상위번호 자식글 작성일때만 나옴  -->
						<input type="hidden" name="n_parent" value="${noteVo.n_parent}">



						<div class="tab-content">
							<div class="tab-pane fade active show" id="id1">
								<div class="form">
									<div></div>
									<!-- <span id="starText"></span> <small class="form-text"> : 중요도를 체크해주세요</small> <br> -->
									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-people icons"></i>담당자</label> <label class="form-control col-3" style="border: none">${noteVo.user_id}</label> <small class="form-text"></small>
									</div>

									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-tag icons"></i>업무분류</label> <select id="select" name="category" onchange="selectDivisionEtc(this.value)" style="margin-bottom: 10px;">
											<option value="structure" <c:if test="${noteVo.category == 'structure'}">selected</c:if>>structure</option>
											<option value="interface" <c:if test="${noteVo.category == 'interface'}">selected</c:if>>interface</option>
											<option value="safety" <c:if test="${noteVo.category == 'safety'}">selected</c:if>>safety</option>
											<option value="test" <c:if test="${noteVo.category == 'test'}">selected</c:if>>test</option>
											<!-- etc 를 누르면 밑에 있는 name="etc" 인 input 태그가 나옴  등록이 여기서됨 -->
											<option value="${noteVo.category}" <c:if test="${etcCheck == 'etcCheck'}">selected</c:if>>${noteVo.category}</option>
											<option value="etc">etc</option>
										</select> <br> <input type="text" style="display: none; margin-left: 1%; margin-bottom: 10px;" value="${noteVo.category}" name="etc" id="etcSelect" placeholder="업무분류를 입력해 주세요"> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 원하는 업무를 선택하세요 직접 입력도 가능합니다.</small>
									</div>
									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-chart icons"></i>상태</label> <select id="status" onchange="ProjectProgressOption(this.value)" name="n_state" style="margin-bottom: 10px;">
											<option value="01" <c:if test="${noteVo.n_state == '01'}">selected</c:if>>진행전</option>
											<option value="02" <c:if test="${noteVo.n_state == '02'}">selected</c:if>>진행중</option>
											<option value="03" <c:if test="${noteVo.n_state == '03'}">selected</c:if>>진행완료</option>
										</select> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 업무를 진행전/진행중/진행완료로 구분해 주세요</small>
									</div>

									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-chart icons"></i>진행률</label> <select id="progress" name="progress" style="margin-bottom: 10px;">
											<c:if test="${noteVo.progress == 01}">selected</c:if>
											<option value="0" <c:if test="${noteVo.progress == 0}">selected</c:if>>0%</option>
											<option value="10" <c:if test="${noteVo.progress == 10}">selected</c:if>>10%</option>
											<option value="20" <c:if test="${noteVo.progress == 20}">selected</c:if>>20%</option>
											<option value="30" <c:if test="${noteVo.progress == 30}">selected</c:if>>30%</option>
											<option value="40" <c:if test="${noteVo.progress == 40}">selected</c:if>>40%</option>
											<option value="50" <c:if test="${noteVo.progress == 50}">selected</c:if>>50%</option>
											<option value="60" <c:if test="${noteVo.progress == 60}">selected</c:if>>60%</option>
											<option value="70" <c:if test="${noteVo.progress == 70}">selected</c:if>>70%</option>
											<option value="80" <c:if test="${noteVo.progress == 80}">selected</c:if>>80%</option>
											<option value="90" <c:if test="${noteVo.progress == 90}">selected</c:if>>90%</option>
											<option value="100" <c:if test="${noteVo.progress == 100}">selected</c:if>>100%</option>
										</select> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 업무의 진행률을 선택해 주세요</small>
									</div>

									<c:if test="${ parentTitle != null }">
										<div class="form-row">
											<label class="form-control col-1 lab" style="border: none"><i class="icon-people icons"></i>상위업무</label> <label>${parentTitle}</label> <small class="form-text"></small>
										</div>
									</c:if>


									<div name="" class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-calendar icons"></i>시작일자</label> <input type="Date" name="n_sdt" style="margin-bottom: 10px;" value="${noteVo.n_sdt}"> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 시작일자와 입력해 주세요</small>
									</div>
									<div class="form-row">
										<label class="form-control col-1 lab" style="border: none"><i class="icon-calendar icons"></i>마감일자</label> <input type="Date" name="n_edt" style="margin-bottom: 10px;" value="${noteVo.n_edt}"> <small class="form-text"> &nbsp;&nbsp;&nbsp; : 마감일자를 입력해 주세요</small>
									</div>
									<br>
									<div class="form-group">
										<label class=""><i class="icon-doc icons"></i>업무명</label> <input type="text" name="n_title" class="form-control transparent" id="title" value="${noteVo.n_title }" placeholder="업무명을 입력해주세요"> <small class="form-text"></small>
									</div>
									<div class="form-group">
										<label class=""><i class="icon-speech icons"></i>업무내용</label><br>
										<textarea id="summernote" name="n_cont">${noteVo.n_cont }</textarea>
									</div>
									<input type="hidden" value="${checkParent}" name="checkParent">



								</div>


							</div>
							<button type="button" id="cancel" class="btn float-right btn-secondary" value="" style="margin-left: 5px;">취소</button>
							<button type="button" id="updateBtn" class="btn float-right btn-primary">수정완료</button>
						</div>

					</form>
					<!-- form 태그끝 -->






				</div>
			</div>
		</div>


	</div>
</main>
