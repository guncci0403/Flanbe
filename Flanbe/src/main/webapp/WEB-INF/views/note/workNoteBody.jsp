<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#newNote {
	float: right;
}

.importance {
	float: right;
}

.color {
	background-color: #BBDEFB;
}

.blue {
	background: #021C8E;
}

.evalbar {
	display: block;
	margin: 10px 0;
	color: #fff;
	font-size: 20px;
	line-height: 1.3em;
	text-align: center;
	border-radius: 15px;
	width: 300px;
}

li {
	list-style: none;
}

#pageNumberBoard {
	clear: inherit;
	float: left;
	width: 30px;
	display: block;
	margin-top: 10px;
	text-align: center;
}

#pagingNumber {
	text-align: center;
}
.page-item,  .updatePen, .deleteTrash{
	cursor: pointer;
}
.font-w-600:hover{
	text-decoration: underline;
	color: blue;
	cursor: pointer;
}
</style>

<script src="http://d3js.org/d3.v3.js"></script>
<script>
   		$(document).ready(function(){
   			//전체 글을 감싸는 div 를 가지고 와서 위치를 알아낸다.   			
   			//3가지 리스트를 호출하기
   			pagination(1 , '01' , null)
   			pagination(1 , '02' , null)
   			pagination(1 , '03' , null)
   			
   			var offset = $('#ThreeListBox').offset();
   			$('html , body').animate({scrollTop : offset.top} , 2000)   		  
   			
    		d3.selectAll(".evalbar")
    		  .datum(function(){ return this.dataset; })
    		  .style("width" , "12px")
    		  .transition().duration(3000)
    		  .style("width" , d => d.val);
    		  //중요한 글만 조회하기 
    		  $('.importance').on('click',function(){
    			  //프로젝트 번호가지고 오기 
    			  var p_code = $('#p_code').val();
    			  var page = 1;
    			  //firstList 눌렀을때는 01 이오고 , secondList 눌렀을때는 02가 오고 , thirdList 눌렀을때는 03이 온다. 
				  var divList = $(this).data('order');
    			  //checkImpor 값이 null(현상태는 중요인데) 일때는 전체로 변경 1(현상태는전체인데)일때는 중요를 검색 
    			  var checkimpor = $(this).data('impor'); 
    			  //중요하면 key 가 1이고 중요하지않으면 null
				  pagination(page , divList , checkimpor )
    			 
    			  })
    			
    		
    		  
			//글 등록하기 페이지로 이동
			
			$('#newNote').on('click' , function(){
				var p_code = $('#p_code').val();
				location.href="${cp}/note/viewInsertNote?p_code=" + p_code;
			})
			
			
			//휴지통이모티콘 누르면 삭제됨 . 권한이 다름 (그 글을 쓴사람만 지울 수 있음)
    		$('#ThreeListBox').on('click' , '.deleteTrash' , function(e){
    			e.stopPropagation();
    			 //노트번호
    			  var n_no =  $(this).data('no');
    			  var p_code = $('#p_code').val();
    			 location.href="${cp}/note/deleteReplyTrashCan?n_no=" + n_no + "&p_code=" + p_code
    			  
    		  })
    		  
    		  
    		 //연필이모티콘 누르면 수정페이지로 이동 
			
    		 $('#ThreeListBox').on('click' , '.updatePen' , function(e){
    			 e.stopPropagation();
    			 var n_no = $(this).data('no');
    			 location.href="${cp}/note/viewUpdate?n_no=" + n_no
    			 
    		 })
			
   		})
    
</script>

<script>
    function oneArticle(value){
		
		var n_no = $(value).attr('class');
		location.href="${cp}/note/viewOneNote?n_no=" + n_no
		  }
    
    //페이지네이션 ajax 데이터 보내기
    //pageNumger 는 우리가 가려는 page , checkListType 은 진행중01/진행전02/진행후03 구분 key 는 중요하면 1 아니면 null
    function pagination(pageNumber , checkListType , key){

    	var checkListTypeNumber = null;   
    	if(checkListType == 01){
    		checkListTypeNumber = "workNoteFirst";
    	}else if(checkListType == 02){
    		checkListTypeNumber = "workNoteSecond";
    	}else {
    		checkListTypeNumber = "workNoteThird";
    	}   	
    	//데이터 만들어주기 : page 값 : p_code 값 : key 값 : (중요한것만 보여줄지 아닐지) , checkListType(01이면 진행전리스트 02이면 진행중 리스트 03이면 진행후 리스트)
    	var form = {
    			page : 	pageNumber , 
    			checkListType : checkListType , 
    			p_code : $('#p_code').val() , 
    			key  : key
    	}
    	$.ajax({
    		url : "${cp}/note/ListPaging" , 
    		type : "POST" ,
    		cache : false , // ajax 캐시 처리  
    		data : form, 
    		success : function(data){
    			$('#' + checkListTypeNumber ).html("");
    			$('#' + checkListTypeNumber ).html(data);
    		},
    		error : function(){
    		}
    	})
    	
    	
    }

     function finishProject(p_code){
		        swal({
		    		title: "Warning!",
		          	text: "정말 프로젝트를 최종 완료 하시겠습니까?",
			        type: "warning",
			        showCancelButton: true,
			        confirmButtonClass: 'btn-danger',
			        confirmButtonText: '확인',
			        cancelButtonText: "취소",
		            closeOnConfirm: false,
		            //closeOnCancel: false
		          },
		          function(){
		            	location.href="${cp}/project/projectFinishButton?p_code=" + p_code;	
		          });

		}

		
</script>

<%@ include file="/WEB-INF/views/common/noteSidebar.jsp" %>

<input type="hidden" value="${p_code}" id="p_code" name="p_code">
<input type="hidden" value="${key}" id="keyCheck">


<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="row ">
			<div class="col-12  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">${p_title }</h4>
					</div>
				</div>
				<c:if test="${ableFinishProjectBtn eq true }">
					<input type="button" onclick="finishProject('${p_code}')" class="btn btn-success mt-2" value="프로젝트 완료" style="margin : 5px; float: right;" />
				</c:if>
				<c:if test="${finalTrue eq 'finalTrue'}">
				<h3>최종 완료된 프로젝트 입니다.</h3>
				</c:if>
				<c:if test="${S_USER.purpose eq 'P'}">
					<input type="button" id="newNote" class="btn btn-primary mt-2" value="업무노트 등록" />
				</c:if>
			</div>
		</div><br>
		<!-- END: Breadcrumbs-->
		<!-- Add List -->
		<div class="card">
			<div class="card-body">
				<div class="modal fade" id="addlist">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">
									<i class="icon-pencil"></i> Add List
								</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<i class="icon-close"></i>
								</button>
							</div>

							<form class="add-list">
								<div class="modal-body">
									<div class="form-group">
										<label for="list-name" class="col-form-label">List Name</label> <input type="text" class="form-control" id="list-name">
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary send-email">Add List</button>
								</div>
							</form>


						</div>
					</div>
				</div>

				<!-- Add List -->
				<div class="modal fade" id="editlist">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">
									<i class="icon-pencil"></i> Edit List
								</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<i class="icon-close"></i>
								</button>
							</div>

							<form class="edit-list">
								<div class="modal-body">
									<div class="form-group">
										<label for="edit-list-name" class="col-form-label">List Name</label> <input type="text" class="form-control" id="edit-list-name">
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary send-email">Update List</button>
								</div>
							</form>


						</div>
					</div>
				</div>


				<!-- Add Task -->
				<div class="modal fade" id="addtask">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">
									<i class="icon-pencil"></i> Add Task
								</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<i class="icon-close"></i>
								</button>
							</div>

							<form class="add-task">
								<div class="modal-body">
									<div class="form-group">
										<label for="task-name" class="col-form-label">Name</label> <input type="text" class="form-control" id="task-name">
									</div>
									<div class="form-group">
										<label for="task-description" class="col-form-label">Description</label>
										<textarea class="form-control" rows="10" id="task-description"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary send-email">Add Task</button>
								</div>
							</form>

						</div>
					</div>
				</div>

				<!-- START: Card Data-->
				<div class="row row-eq-height task-list-row">
					<div class="col-12 col-md-6 col-lg mt-3 task-list-item">
						<!-- 중요글만볼지 전체글도 볼지 -->
						<!-- 전체를 조회data-impor 값이 없어서 key 는 null -->
						<input type="button" class="btn btn-primary mt-2 mr-1 importance" data-order="01" value=" ★ 전체" />
						<!-- 중요를 조회 data-impor 값은 key 값으로 key 값이 1 로들어감-->
						<input type="button" class="btn btn-primary mt-2 mr-1 importance" data-order="01" data-impor="1" value=" ⭐ 중요" />
					</div>
					<div class="col-12 col-md-6 col-lg mt-3 task-list-item">
						<!-- 중요글만볼지 전체글도 볼지 -->
						<input type="button" class="btn btn-primary mt-2 mr-1 importance" data-order="02" value=" ★ 전체" /> <input type="button" class="btn btn-primary mt-2 mr-1 importance" data-order="02" data-impor="1" value=" ⭐ 중요" />
					</div>
					<div class="col-12 col-md-6 col-lg mt-3 task-list-item">
						<!-- 중요글만볼지 전체글도 볼지 -->
						<input type="button" class="btn btn-primary mt-2 mr-1 importance" data-order="03" value=" ★ 전체" /> <input type="button" class="btn btn-primary mt-2 mr-1 importance" data-order="03" data-impor="1" value=" ⭐ 중요" />
					</div>
				</div>

				<div class="row row-eq-height task-list-row" id="ThreeListBox">

					<!-- 첫번째 진행전 위치 -->
					<div class="col-12 col-md-6 col-lg mt-3 task-list-item" id="workNoteFirst"></div>
					<!-- 두번째 진행중 위치 -->
					<div class="col-12 col-md-6 col-lg mt-3 task-list-item" id="workNoteSecond"></div>
					<!-- 세번째 진행완료 위치 -->
					<div class="col-12 col-md-6 col-lg mt-3 task-list-item" id="workNoteThird"></div>

				</div>
				<!-- END: Card DATA-->
			</div>
		</div>
	</div>
</main>
<!-- END: Content-->


