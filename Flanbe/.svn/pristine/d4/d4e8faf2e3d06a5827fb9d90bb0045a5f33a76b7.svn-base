<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
      //문서 로딩이 완료되고 나서 실행되는 영역
      $(function(){
         $('#summernote').summernote({
            height:250,width:700,
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
         $('#summernote').summernote('disable');
         
         $('#summernote1').summernote({
            height:250,width:700,
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
         
         if(${S_USER.u_div} = "T") {
            $("#r2").attr("checked", true);
         }else{
            $("#r1").attr("checked", true);
         }
         
         $("#chkbtn").click(function(){
             if($.trim($('#p_title').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "프로젝트 제목에 빈간이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }
             
             if($.trim($('#summernote1').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "상세 업무내용에 빈간이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }
             
             if($.trim($('input[name="ps_no"]:checked').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "관련기술에 빈간이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }
             
             if($.trim($('#p_money').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "예상금액에 빈칸이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }
             
             if($.trim($('#period').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "예상기간에 빈칸이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }
             
             if($.trim($('#deadline').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "모집마감일에 빈칸이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }

             if($.trim($('#p_sdt').val()).length <= 0){
                swal({
                	title: "Info",
                	text: "시작일에 빈칸이 존재합니다.",
                	type: "info",
                	showCancelButton: false,
                	confirmButtonClass: 'btn-info',
                	confirmButtonText: '확인',	
                	closeOnConfirm: false
                });
                return false;
             }
             var deadlineArr = $('#deadline').val().split('-');
             var todayArr = getToday().split('-');
             var startdayArr = $('#p_sdt').val().split('-');
             
             var todayCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
             var deadlineCompare = new Date(deadlineArr[0], parseInt(deadlineArr[1])-1, deadlineArr[2]);
             var startdayCompare = new Date(startdayArr[0], parseInt(startdayArr[1])-1, startdayArr[2]);
             
             if(todayCompare.getTime() > deadlineCompare.getTime()) {
                 swal({
                 	title: "Info",
                 	text: "모집 마감일은 현재 요일 이후로 설정 가능합니다.",
                 	type: "info",
                 	showCancelButton: false,
                 	confirmButtonClass: 'btn-info',
                 	confirmButtonText: '확인',	
                 	closeOnConfirm: false
                 });
                 return false;
             }
             if(deadlineCompare.getTime() > startdayCompare.getTime()) {
                 swal({
                 	title: "Info",
                 	text: "시작일은 모집마감일 이후로 설정 가능합니다.",
                 	type: "info",
                 	showCancelButton: false,
                 	confirmButtonClass: 'btn-info',
                 	confirmButtonText: '확인',	
                 	closeOnConfirm: false
                 });
                 return false;
             }
             
             $("#exampleModalCenter").modal();

       });
      });
      function getToday(){
           
          var date = new Date();
          var year = date.getFullYear();
          var month = ("0" + (1 + date.getMonth())).slice(-2);
          var day = ("0" + date.getDate()).slice(-2);

          return year + "-" + month + "-" + day;
     }
</script>



<main class="flanbe">
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->

		<!-- END: Breadcrumbs-->

		<!-- START: Card Data-->
		<div class="row">

			<div class="col-11 mt-3" style="padding-left: 150px;">
				<div class="row">
					<div class="col-11 mt-3" style="padding-left: 150px;">

						<div class="card">
							<div class="row ">
								<div class="col-12  align-self-center">
									<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded" style="margin-left: 18%;">
										<div class="w-sm-100 mr-auto">
											<h4 class="mb-0">프로젝트 등록</h4>
										</div>
									</div>
								</div>
							</div>
							<hr>
							<div class="card-body">
								<div class="row p-3">

									<ul class="col-sm-6 nav nav-tabs d-block d-sm-flex mb-4" style="margin-left: 17%;">
										<li class="nav-item  mb-3" style="margin-right: 20px;"><a class="nav-link p-0 active" data-toggle="tab" href="#tab1"> <!-- 클릭시 이동 -->
												<div class="d-flex">
													<div class="mr-3 mb-0 h1">1</div>
													<div class="media-body align-self-center">
														<h6 class="mb-0 text-uppercase font-weight-bold">클라이언트</h6>
														기본정보
													</div>
												</div>
										</a></li>
										<li class="nav-item  mb-3"><a class="nav-link p-0" data-toggle="tab" href="#tab2">
												<div class="d-flex">
													<div class="mr-3 mb-0 h1">2</div>
													<div class="media-body align-self-center">
														<h6 class="mb-0 text-uppercase font-weight-bold">프로젝트</h6>
														정보등록
													</div>
												</div>
										</a></li>
									</ul>
								</div>
								<form id="chk" method="post" action="${cp }/project/insertProject">
									<div style="padding-left: 180px;" class="tab-content col-sm-9" style="margin-left: 300px; width: 730px;">
										<div class="tab-pane fade active show" id="tab1">
											<div class="form">
												<div class="form-group">
													<input type="hidden" class="form-control bg-transparent" name=user_id value="${S_USER.user_id }" placeholder=""> <label>그룹여부</label><br> &nbsp; &nbsp; <input type="radio" id="r1" name="u_div" value="1" checked onclick="return(false);"> 개인 &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" id="r2" name="u_div" value="2" checked onclick="return(false);"> 팀 &nbsp; &nbsp;
												</div>
												<div class="form-row" style="margin-left: 0px;">
													<div class="form-group input-primary col-sm-3 mb-2" style="padding-left: 0px;">
														<label class=" ">사용자 이름</label> <input type="text" class="form-control bg-transparent" name="user_nm" value="${S_USER.user_nm }" placeholder="" disabled>
													</div>
													<div class="form-group input-primary col-sm-3 mb-2">
														<label class=" ">담당자 전화번호</label> <input type="text" class="form-control bg-transparent" name="phone" value="${S_USER.phone }" placeholder="" disabled>
													</div>
												</div>

												<div class="form-row" style="margin-left: 0px;">
													<div class="form-group input-primary col-sm-6 mb-2" style="padding-left: 0px;">
														<label class=" ">주소</label> <input type="text" id="base_addr" class="form-control bg-transparent" name="base_addr" value="${S_USER.base_addr }" placeholder="" disabled>
													</div>
													<div class="form-group input-primary col-sm-6 mb-2">
														<label class=" ">상세주소</label> <input type="text" class="form-control bg-transparent" id="detail_addr" name="detail_addr" value="${S_USER.detail_addr }" placeholder="" disabled>
													</div>
												</div>

												<div class="form-group input-primary col-sm-3 mb-2" style="padding-left: 0px;">
													<label for="zipcode" class=" ">우편번호</label> <input type="text" class="form-control bg-transparent" id="zipcode" name="zipcode" value="${S_USER.zipcode }" placeholder="" disabled>
												</div>

												<label for="intro" class=" ">자기소개</label>
												<textarea id="summernote" name="summernote">${S_USER.intro }</textarea>
												<br>
												<button type="button" style="font-size: 15px; padding-right: 32px; padding-left: 32px;" class="btn float-right btn-primary nexttab">다음</button>
											</div>
										</div>
										<div class="tab-pane fade" id="tab2">
											<div class="form">
												<div class="form-group input-primary col-sm-6 mb-2" style="padding-left: 0px;">
													<label class=" ">프로젝트 제목</label> <input id="p_title" type="text" class="form-control bg-transparent" name="p_title" placeholder="프로젝트 제목" /> <br>
												</div>
												<div class="form-group">
													<label>개발분야</label> <select class="form-control col-sm-4" name="p_field" id="p_field">
														<option value="01">웹</option>
														<option value="02">애플리케이션</option>
														<option value="03">퍼블리싱</option>
														<option value="04">게임</option>
														<option value="05">기타</option>
													</select>
												</div>
												<br> <label>상세업무내용</label>
												<textarea id="summernote1" name="p_cont"></textarea>
												<br> <label>관련기술</label>

												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" value="01" name="ps_no" class="custom-control-input" id="ps_no"> <label class="custom-control-label" for="ps_no">Java</label>
												</div>

												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" value="02" name="ps_no" class="custom-control-input" id="ps_no2"> <label class="custom-control-label" for="ps_no2">C</label>
												</div>

												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" value="03" name="ps_no" class="custom-control-input" id="ps_no3"> <label class="custom-control-label" for="ps_no3">Python</label>
												</div>

												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" value="04" name="ps_no" class="custom-control-input" id="ps_no4"> <label class="custom-control-label" for="ps_no4">javascript</label>
												</div>

												<div class="custom-control custom-checkbox custom-control-inline">
													<input type="checkbox" value="05" name="ps_no" class="custom-control-input" id="ps_no5"> <label class="custom-control-label" for="ps_no5">기타</label>
												</div>
												<br> <br>
												<div class="form-row">
													<br>
													<div class="form-group input-primary col-sm-3 mb-2" style="padding-left: 0px;">
														<label class="">지출 가능 예산</label> <input type="text" class="form-control" id="p_money" name="p_money" type="text" placeholder="1000000(숫자만 입력)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													</div>

													<div class="form-group input-primary col-sm-2 mb-2" style="padding-left: 0px;">
														<label class="">예상기간</label> <input type="text" class="form-control" name="period" id="period" type="text" placeholder="60(일)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													</div>
												</div>
												<br>
												<div class="form-row">
													<div class="form-group input-primary col-sm-3 mb-2" style="padding-left: 0px;">
														<label class="">모집마감일</label> <input style="width: 200px;" class="form-control" onchange="this.setAttribute('value', this.value);" type="date" id="deadline" name="deadline" />
													</div>
													<div class="form-group input-primary col-sm-3 mb-2" style="margin-left: 60px;">
														<label class="">시작일</label> <input style="width: 200px;" class="form-control" onchange="this.setAttribute('value', this.value);" type="date" id="p_sdt" name="p_sdt" />
													</div>
												</div>
												<br>
												<button type="button" style="font-size: 15px; padding-right: 32px; padding-left: 32px;" class="btn btn-primary prevtab">이전</button>
												<button type="button" style="font-size: 15px; padding-right: 32px; padding-left: 32px;" id="chkbtn" class="btn btn-primary float-right" data-toggle="modal">등록</button>
												<!-- Modal -->
												<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLongTitle1">프로젝트 등록</h5>
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">한번 등록하면 수정이 불가능합니다.</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
																<button type="submit" class="btn btn-primary">완료</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>