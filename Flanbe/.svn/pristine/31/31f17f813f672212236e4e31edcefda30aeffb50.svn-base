<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script>
$(function() {
	filesCnt = ${fn:length(filesname)};
	
	$('.filesdelete').on('click',function(){		
		var a_no = $(this).data("a_no");
		var that = $(this); 
		filesCnt = filesCnt - 1;
		swal({
			title: "Success!!",
			text: "삭제 성공",
			type: "success",
			showCancelButton: false,
			confirmButtonClass: 'btn-success',
			confirmButtonText: '확인'
		});
		$.ajax({
			url : "${cp }/user/filesDelete",
			type : "post",
			data : {"a_no" : a_no},
			success : function(result) {
				if(result="success"){					
					that.parent("div").remove();
			  }
			}
		});		
	});
	
    var code = "";
    var fileCnt = 2; 
	$("#fileAdd").on("click",function() {		
		if (fileCnt < 3) {		
			code += '<div class="form-group row" style="margin-left:0px; display:flex;">';
 		    code += '<input type="text" id="fileName3'+fileCnt+'" name="po_file" style="width:290px; height:36px; border: 1px solid #dedede;" readonly />';
			code += '<label class="file-upload btn btn-info" style="margin-left:20px; width:90px;" for="input-file'+fileCnt+'">파일 추가</label>';
			code += '<input id="input-file'+fileCnt+'" class="form-control" type="file" name="insertfile" onchange="javascript:document.getElementById(&#39;fileName3'+fileCnt+'&#39;).value=this.value" style="display:none;"/>';
			code += '</div>';
			
 			$("#fileupload").append(code);
			fileCnt++;
		} else {
			swal({
				title: "Info",
				text: "파일 첨부는 2개까지만 가능합니다.",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
		}
	}); 
	//유효성 검사 후 폼 전송
	$('#registBtn').click(function(){		     //포트폴리오 등록 버튼
		if($("#po_title").val() == "" || !$("input:checked[name='po_field'").is(":checked") || $("#po_cont").val() == "" || $("#po_sdt").val() == "" || $("#po_edt").val() == "") {
			swal({
				title: "Info",
				text: "모든 항목을 입력해 주세요.",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',
				closeOnConfirm: false
			});
		} else {			
		$("#frm").attr("method", "post");
		$("#frm").attr("action", "${cp }/user/registpopol?num=1");
		$("#frm").submit();
		}
	});
	
	$('#modifyBtn').click(function(){			//포트폴리오 수정완료 버튼
		$("#frm").attr("method", "post");	
		$("#frm").attr("action", "${cp }/user/registpopol?num=2");

		$("#frm").submit();
	});
	
	// 수정페이지에서 개발분야 값 체크되게 출력
	var field = '${popolVo.po_field}';
	var split_field = field.split(",");
	
	for(var i in split_field) {
		if(split_field[i] == '01') {
			$("#field_web").prop('checked',true);
		}else if(split_field[i] == '02'){
			$("#field_application").prop('checked',true);
		}else if(split_field[i] == '03'){
			$("#field_publishing").prop('checked',true);
		}else if(split_field[i] == '04'){
			$("#field_game").prop('checked',true);
		}else if(split_field[i] == '05'){
			$("#field_etc").prop('checked',true);
		}
	}
});
</script>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>

<!-- START: Main Content-->
<main>
	<div class="content">
		<div class="profile_frame">
			<div class="col-11 mt-4 pl-lg-0">
				<div class="card border  h-mail-list-section">
					<section>
     				<c:if test="${popolVo.po_no eq null}"><h4 class="p5-profile-head">포트폴리오 추가 </h4></c:if>
				    <c:if test="${popolVo.po_no ne null}"><h4 class="p5-profile-head">포트폴리오 수정 
				    	<a href="${cp }/user/detailpopol?po_no=${popolVo.po_no}" class="bg-primary float-right mr-3 py-1 px-1 rounded text-white"><!-- 뒤로가기 버튼 -->
                        <i class="fas h5 mr-2 fa-angle-left" style="margin: 6px;"></i></a></h4> </c:if>		     
					</section>

					<!-- START: Card Data-->
					<div class="row mt-3">
						<div class="col-12 col-sm-12">
								<div class="col-12 col-xl-9 mb-5 mb-xl-0">
									<div class="card-body">
										<div class="row">
											<div class="col-12">
										
											<form id="frm" enctype="multipart/form-data">
												<input type="hidden" name="user_id" value="${S_USER.user_id }" />
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">
														<span class="popolspan">* &nbsp;</span>제목</label>
														<div class="col-sm-4">
														<c:choose>
														<c:when test="${popolVo.po_no ne null}"> <!-- 포트폴리오 수정일 때-->
															<input type="text" class="form-control" name="po_title" id="po_title" value="${popolVo.po_title}">
														</c:when>
														<c:otherwise> <!-- 포트폴리오 등록일 때-->
															<input type="text" class="form-control" name="po_title" id="po_title">
														</c:otherwise>
														</c:choose>
														</div>
													</div>
													 
												<div class="form-group row">
												  <label class="col-sm-2 col-form-label"><span class="popolspan">* &nbsp;</span>개발분야</label> 
													<section class="portfolio-manage-field">
													   <div class="condition_content_box" style="max-width: 578px; padding-top: 5px;">
														<div class="ht89" id="ht89">
														<input class="label_check_trigger" id="field_web" name="po_field" type="checkbox" value="01" style="margin-left:15px"/>
															<label for="field_web" style="margin-left: 12px;">웹</label>
														<input class="label_check_trigger" id="field_application" name="po_field" type="checkbox" value="02"/>
															<label for="field_application">애플리케이션</label>															
														<input class="label_check_trigger" id="field_publishing" name="po_field" type="checkbox" value="03" />
															<label for="field_publishing">퍼블리싱</label>
														<input class="label_check_trigger" id="field_game" name="po_field" type="checkbox" value="04" />
															<label for="field_game">게임</label>
														<input class="label_check_trigger" id="field_etc" name="po_field" type="checkbox" value="05" />
															<label for="field_etc">기타</label>
														</div>														
													</div>
													</section>
													</div>
													<div class="form-group row">
														<label class="col-sm-2 col-form-label"><span class="popolspan">* &nbsp;</span>설명</label>
														<div class="col-sm-10">
														<c:choose>
														<c:when test="${popolVo.po_no ne null}"> <!-- 포트폴리오 수정일 때-->
															<textarea class="form-control p5-portfolio-description" id="po_cont" rows="10" id="p5-form-description" name="po_cont">${popolVo.po_cont}</textarea>
														</c:when>
														<c:otherwise> <!-- 포트폴리오 등록일 때-->
															<textarea class="form-control p5-portfolio-description" id="po_cont" name="po_cont" rows="10"></textarea>
														</c:otherwise>
														</c:choose>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-sm-2 col-form-label"><span class="popolspan">* &nbsp;</span>참여 시작일</label>
														<div class="col-sm-3">
														<c:choose>
														<c:when test="${popolVo.po_no ne null}"> <!-- 포트폴리오 수정일 때-->
															<input type="month" class="form-control" name="po_sdt" id="po_sdt" value="<fmt:formatDate value="${popolVo.po_sdt }" pattern="yyyy-MM" />" />
														</c:when>
														<c:otherwise> <!-- 포트폴리오 등록일 때-->
															<input type="month" class="form-control" name="po_sdt" id="po_sdt">
														</c:otherwise>
														</c:choose>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-sm-2 col-form-label"><span class="popolspan">* &nbsp;</span>참여 종료일</label>
														<div class="col-sm-3">
														<c:choose>
														<c:when test="${popolVo.po_no ne null}"> <!-- 포트폴리오 수정일 때-->
															<input type="month" class="form-control" name="po_edt" id="po_edt" value="<fmt:formatDate value="${popolVo.po_edt }" pattern="yyyy-MM" />" />
														</c:when>	
														<c:otherwise> <!-- 포트폴리오 등록일 때-->
															<input type="month" class="form-control" name="po_edt" id="po_edt" value="">
														</c:otherwise>
														</c:choose>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-sm-2 col-form-label">대표 이미지</label>
														<c:choose>
														<c:when test="${popolVo.po_no ne null}"><!-- 포트폴리오 수정일 때-->											
															<input type="hidden" name="po_no" value="${popolVo.po_no}"/> 					
															<input type="text" id="fileImg" name="po_image" value="${popolVo.po_image}" readonly />
															<label class="file-upload btn btn-info" for="input-image" style="margin-left: 20px;">이미지 변경</label>
															 <input id="input-image" class="form-control" type="file" name="image" accept=".gif, .jpg, .png" 
														 	   	    onchange="javascript:document.getElementById('fileImg').value = this.value" style="display:none;"/><br>
														</c:when>
														<c:otherwise> <!-- 포트폴리오 등록일 때-->														
														 	<input type="text" id="fileImg" name="image" placeholder="  이미지를 등록해주세요" readonly />
															<label class="file-upload btn btn-info" for="input-image" style="margin-left: 20px;">이미지 추가</label>
															<input id="input-image" class="form-control" type="file" name="image" accept=".gif, .jpg, .png" 
														 	   	   onchange="javascript:document.getElementById('fileImg').value = this.value" style="display:none;"/><br>
														</c:otherwise>
														</c:choose>
													</div>
													
													<div class="form-group row">
														<label class="col-sm-2 col-form-label">첨부 파일</label>
														
												   <c:choose>
												   <c:when test="${popolVo.po_no ne null}">	<!-- 포트폴리오 수정일 때-->								
													   <div class="form-group2 row" id="fileupload" style="margin-left: 15px; display: inline;">
													     <c:forEach items="${filesname}" var="filesname">
													     	<input type="hidden" name="no" value="${filesname.no}" />
													     	<div class="fileform">
															<input type="text" id="fileName${filesname.a_no}" name="po_file" value=" ${filesname.a_nm}" style="width:290px; height:36px; border: 1px solid #dedede;" readonly/>
															<input type="button" class="filesdelete" value="❌" data-a_no="${filesname.a_no}" style="border:0px; background:white;">
															</div>
															<input id="input-file${filesname.a_no}" class="form-control" type="file" name="insertfile" 
															   	   onchange="javascript:document.getElementById('fileName${filesname.a_no}').value = this.value" style="display:none;"/>
													     </c:forEach>
													     <button type="button" id="fileAdd" class="btn btn-outline-primary" style="margin-bottom: 9px;"><i class="fas fa-plus"></i></button>
													   </div>			
													</c:when>
														
													<c:otherwise> <!-- 포트폴리오 등록일 때-->
													   <div class="form-group row" id="fileupload" style="margin-left: 15px; display: inline;">
													     <input type="text" id="fileName1" name="po_file"  placeholder="  파일을 등록해주세요" style="width:290px; height:36px; border: 1px solid #dedede;" readonly/>
													     	<label class="file-upload btn btn-info" for="input-file1" style="margin-left:16px; width:90px;">파일 추가</label>
													     	<input id="input-file1" class="form-control" type="file" name="insertfile" 
															   	   onchange="javascript:document.getElementById('fileName1').value = this.value" style="display:none;"/>	
													     	<button type="button" id="fileAdd" class="btn btn-outline-primary" style="margin-bottom: 9px;"><i class="fas fa-plus"></i></button>
														    <br>
													   </div>														  
													</c:otherwise>
													</c:choose>													
												</div>
														
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">관련 기술</label>
													<div class="col-sm-5">
														<c:choose>
														<c:when test="${popolVo.po_no ne null}"> <!-- 포트폴리오 수정일 때-->
															<input type="text" class="form-control" name="po_skil" id="po_skil" value="${popolVo.po_skil}">
														</c:when>
														<c:otherwise> <!-- 포트폴리오 등록일 때-->											
															<input type="text" class="form-control" name="po_skil" id="po_skil" placeholder="관련기술을 입력하세요">
														</c:otherwise>
														</c:choose>
													    <span class="p5-portfolio-information">예) Photoshop, Android, HTML5, Python, Django ...</span>
													</div>
												</div>
												<div class="form-group" style="margin-right: 50px; float: right;">
													<button type="reset" class="btn btn-secondary">재작성</button>
													<c:if test="${popolVo.po_no eq null}"><button id="registBtn" type="button" class="btn btn-success">등록</button></c:if>
 													<c:if test="${popolVo.po_no ne null}"><button id="modifyBtn" type="button" class="btn btn-primary">수정 완료</button></c:if>
												</div>
											</form>
											
										  </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</main>