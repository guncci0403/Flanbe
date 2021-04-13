<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	#proStar a ,  #satStar a , #commStar a, #ontimeStar a , #activityStar  a  {
		text-decoration : none; 
		color : gray;
	}
	
	#proStar a.on{
		color : #5858FA;
	}
	
	#satStar a.on{
		color : #A9F5E1;
	}
	
	#commStar a.on{
		color : #0489B1;
	}
	
	#ontimeStar  a.on{
		color : #F7819F;
	}
	
	#activityStar  a.on {
		color : #A5DF00;
	}
	
	.starValue {
		float-left : 40px; 
	}
	
	.evalBtn {
		margin-left : 35% ;
	}

</style>
<script charset="UTF-8">
	$(function() {
		<c:if test="${msg == 'msg'}">
			swal({
				title: "Info",
				text: "모든 파트너스를 평가한 후에\n프로젝트를 최종 완료할 수 있습니다.",
				type: "info",
				showCancelButton: false,
				confirmButtonClass: 'btn-info',
				confirmButtonText: '확인',	
				closeOnConfirm: false
			});
		</c:if>
	
		
		$('#inviteUserBtn').on('click', function() {
			//$("#buser").remove();
			var p_code = ${p_code};
			var group_nm = $('#gnm').val();
			$.ajax({
				url : "${cp}/note/inviteUser",
				data : {
					"p_code" : p_code,
					"group_nm" : group_nm
				},
				type : 'get',
				success : function(data){
					var html = "";
					$.each(data.userList, function(i, user){
						html += "<div><input type='checkbox' id='check"+i+"' value='"+user.user_id+"'>";
						html += "	<label for='check"+i+"'> "+user.user_nm +"</label><br></div>";
					});
					$("#auser").html(html);
				},
				error : function(xhr) {
				}
				
			})
			
			$('#inviteModal').modal();
		});
		
		$('#right').on('click', function() {
			// $('#auser').find('input[type="checkbox"]:checked').val();
// 			var users = "";
// 			$('#auser').find('input[type="checkbox"]:checked').each(function(index){
// 				if (index != 0) {
// 					users += ', ';
// 	            }
// 				users += $(this).val();
// 			})
			
			$('#auser').find('input[type="checkbox"]:checked').each(function(){
				$(this).prop('checked',false);
				$('#buser').append($(this).parent());
				//$('#buser').('input[type="checkbox"][name="filtercheck"]').prop('checked',false);
				$('#auser').find(this).parent().remove();
			})
		})
		
		$('#left').on('click',function() {
			
			$('#buser').find('input[type="checkbox"]:checked').each(function(){
				$(this).prop('checked',false);
				$('#auser').append($(this).parent());
				//$('#buser').('input[type="checkbox"][name="filtercheck"]').prop('checked',false);
				$('#buser').find(this).parent().remove();
			})
		})
		
		$('#inviteModal').on('hidden.bs.modal', function () {
			$('#buser').html("");
		})
		
		$('#inviteBtn').on('click',function() {
			var users = "";
			$('#buser').find('input[type="checkbox"]').each(function(index){
				if (index != 0) {
					users += ', ';
	            }
				users += $(this).val();
			})
			if(users == "") {
				swal({
					title: "Info",
					text: "추가된 사람이 없습니다.",
					type: "info",
					showCancelButton: false,
					confirmButtonClass: 'btn-info',
					confirmButtonText: '확인',	
					closeOnConfirm: false
				});
				return false;
			}
			$('#users').val(users);
			$("#inviteFrm").submit();
		})
		
		
		$('.evalBtn').on('click' , function(){
			user_id = $(this).attr('id')
			$('#modalUserId').val(user_id); 
			$('#evalModal').modal('show'); 
			
		})
		
		
		// 별 선택하면 색상 선택되는 것 
		$('#proStar a').on('click' , function(){
			$(this).parent().children("a").removeClass("on");	
			$(this).addClass("on");
			$(this).prevAll("a").addClass("on");
			$('#proStarHidden').val($(this).data('pro'));
			return false; 
		}); 
		
		$('#satStar a').on('click' , function(){
			$(this).parent().children("a").removeClass("on");	
			$(this).addClass("on");
			$(this).prevAll("a").addClass("on");
			$('#satStarHidden').val($(this).data('sat'));
			return false; 
		}); 
		
		$('#commStar a').on('click' , function(){
			$(this).parent().children("a").removeClass("on");	
			$(this).addClass("on");
			$(this).prevAll("a").addClass("on");
			$('#commStarHidden').val($(this).data('comm'));
			return false; 
		}); 
		
		$('#ontimeStar a').on('click' , function(){
			$(this).parent().children("a").removeClass("on");	
			$(this).addClass("on");
			$(this).prevAll("a").addClass("on");
			$('#ontimeStarHidden').val($(this).data('ontime'));
			return false; 
		}); 
		
		$('#activityStar a').on('click' , function(){
			$(this).parent().children("a").removeClass("on");	
			$(this).addClass("on");
			$(this).prevAll("a").addClass("on");
			$('#activityStarHidden').val($(this).data('activity'));
			return false; 
		}); 
		
		//평가 모달 최종 저장하기
		
		$('#starEvalSave').on('click' , function(){
			if($('#proStarHidden').val() == 0 || $('#satStarHidden').val() == 0 || $('#commStarHidden').val() == 0
					|| $('#ontimeStarHidden').val() == 0 || $('#activityStarHidden').val() == 0 || $('#activityStarHidden').val() == 0 ){
				swal({
					title: "Info",
					text: "평가항목의 별점을 모두 매겨주세요",
					type: "info",
					showCancelButton: false,
					confirmButtonClass: 'btn-info',
					confirmButtonText: '확인',	
					closeOnConfirm: false
				});
				return false ; 
			}else{
			   $('#starEvalForm').submit();
			}
		});
		
		
		$('#intro').on('keyup' , function(){
			$('#intro_cnt').html("(" + $(this).val().length + "/ 100)");
			
			if($(this).val().length > 100) {
				$(this).val($(this).val().substring(0, 100));
				$('#intro_cnt').html("(100 / 100)"); 
			}
			
			
		})
		
		
		
	})
</script>

<form id="inviteFrm" action="${cp }/note/inviteUser" method="post">
	<input type="hidden" name="p_code" value="${p_code }">
	<input type="hidden" id="users" name="userid" value="">
</form>

<input type="hidden" id="gnm" value="${S_USER.group_nm }">
<%@ include file="/WEB-INF/views/common/noteSidebar.jsp" %>

<main>
	<div class="container-fluid site-width">

		<div class="row ">
			<div class="col-12  align-self-center">
				<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">프로젝트 구성원</h4>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div class="col-12">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<button type="button" id="inviteUserBtn" class="btn float-right btn-primary" data-toggle="modal">사용자 초대</button>
					<a class="btn btn-default float-right" href="${cp }/note/excelDownload?p_code=${p_code}">사용자 엑셀 다운로드</a>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">구분</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr class="userTr" style="height: 50px;">
										<th scope="row">${user.user_id }</th>
										<td>${user.user_nm }</td>
										<td>${user.email }</td>
										<td>${user.phone }</td>
										<c:choose>
											<c:when test="${user.purpose  == 'C'}">
												<td>클라이언트</td>
											</c:when>
											<c:otherwise>
												<td>개발자</td>
											</c:otherwise>
										</c:choose>
										<!-- 평가 상태와 평가 버튼 -->
										<c:choose>
											<c:when test="${user.p_state eq '04' }">
												<td class="allProjectDoneCheck">프로젝트 참여중</td>
											</c:when>
											<c:when test="${user.p_state eq '05' }">
												<td class="allProjectDoneCheck">프로젝트 완료</td>
											</c:when>
											<c:when test="${user.p_state eq '10' }">
												<td class="allProjectDoneCheck">평가대기중
												<c:if test="${S_USER.user_id == client_id}"> 
													<input type="button" class="btn btn-primary evalBtn" id="${user.user_id }" value="평가">
												 </c:if> 
												</td>
											</c:when>
											<c:otherwise>
												<td> </td>
											</c:otherwise>
										</c:choose>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
		
		
	
	</div>
</main>

<!-- Modal -->
<div class="modal fade" id="inviteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle3" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle3">사용자 초대하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" style="min-height: 500px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-5 border p-4" style="min-height: 450px;">
							<span>사용자 리스트</span>
							<hr>
							<div class="col-md-10" id="auser">
							</div>
						</div>
						<div class="col-md-2"><br><br><br><br><br><br>
							<button class="btn float-center" id="left"><i class="mdi mdi-arrow-left-bold-outline h4"></i></button><br>
							<button class="btn float-center" id="right"><i class="mdi mdi-arrow-right-bold-outline h4"></i></button>
						</div>
						
						<div class="col-md-5 border p-4" style="min-height: 450px;">
							<span>초대할 사용자</span>
							<hr>
							<div class="col-md-10" id="buser">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="inviteBtn">초대하기</button>
				<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
			</div>
		</div>
	</div>
</div>
	


<!-- 수정이가 추가  Modal : 평가창 모달 -->
<div class="modal fade" id="evalModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLabel">비교</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <img alt="" src="/img/theme/starScore.jpg">
      <div class="modal-body">
      	<h4>   프로젝트는 만족하셨습니까?  </h4>
      	<h4>평가는 파트너스에게 큰 힘이 됩니다 </h4>
      	
      	
      	<div class="starValue">
	      	<p id="proStar">
	      	<span>전문성 : </span>
	      		<a data-pro="1">★</a>
	      		<a data-pro="2">★</a>
	      		<a data-pro="3">★</a>
	      		<a data-pro="4">★</a>
	      		<a data-pro="5">★</a>
	      	</p>  
	      	
	     	<p id="satStar">
	     	<span>만족성 : </span>
	      		<a data-sat="1">★</a>
	      		<a data-sat="2">★</a>
	      		<a data-sat="3">★</a>
	      		<a data-sat="4">★</a>
	      		<a data-sat="5">★</a>
	      	</p> 
	      
	        <p id="commStar">
	      	<span>의사소통 용이 : </span>	
	      		<a data-comm="1">★</a>
	      		<a data-comm="2">★</a>
	      		<a data-comm="3">★</a>
	      		<a data-comm="4">★</a>
	      		<a data-comm="5">★</a>
	      	</p> 
	      	
	        <p id="ontimeStar">
	        <span>일정준수 : </span>
	      		<a data-ontime="1">★</a>
	      		<a data-ontime="2">★</a>
	      		<a data-ontime="3">★</a>
	      		<a data-ontime="4">★</a>
	      		<a data-ontime="5">★</a>
	      	</p> 
	 
	      	<p id="activityStar">
	      	<span>적극성 : </span>
	      		<a data-activity="1">★</a>
	      		<a data-activity="2">★</a>
	      		<a data-activity="3">★</a>
	      		<a data-activity="4">★</a>
	      		<a data-activity="5">★</a>
	      	</p> 
     		
     		<!-- 별을 클릭하면 hidden 에 값이 저장되고 , 평가완료 버튼을 누르면 이거를 보낸다 -->
	      	<form id="starEvalForm" action="${cp}/project/starRating" method="POST">
	      		<input type="hidden" value="${p_code}" name="p_code" >
		      	<input type="hidden" id="proStarHidden" name="pro" >
		      	<input type="hidden" id="satStarHidden" name="sat" >
		      	<input type="hidden" id="commStarHidden" name="comm" >
		      	<input type="hidden" id="ontimeStarHidden" name="ontime" >
	     		<input type="hidden" id="activityStarHidden" name="activity" >
				<input type="hidden" id="modalUserId" name="user_id">
				<span style="background : yellow;">평가글을 작성해주세요</span><br>
				<textarea id="intro" rows="5" cols="70" placeholder="평가글 작성해주세요" name="e_cont"></textarea>
				<div id="intro_cnt">(최대 100글자)</div>
			</form>
			
			
			
			
		 </div>    	
      </div>
      <div class="modal-footer">
        <button type="button" id="starEvalSave" class="btn btn-primary">평가 완료</button>
        <button type="button" class="btn btn-secondary close" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>