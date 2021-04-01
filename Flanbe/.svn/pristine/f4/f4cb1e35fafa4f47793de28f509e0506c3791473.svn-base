<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- START: Head-->
    <head>
        <meta charset="UTF-8">
        <title>비밀번호 찾기</title>
        <link rel="shortcut icon" href="${cp }dist/images/favicon.ico" />
        <meta name="viewport" content="width=device-width,initial-scale=1"> 
		
		<%@ include file="/WEB-INF/views/common/common_css.jsp" %>
        <link rel="stylesheet" href="${cp }/dist/vendors/social-button/bootstrap-social.css"/>   
		
        <!-- START: Custom CSS-->
        <link rel="stylesheet" href="${cp }/dist/css/main.css">
        <!-- END: Custom CSS-->
        
        <script>
	        $(function(){
	        	$("#passfind").on('click',function(){
	        		
	        		var user_id = $("#user_id").val();
	        		var email = $("#email").val();
	        		
	        		$.ajax({
						url : "${cp }/login/passfind",
						data : { 
							"user_id" : user_id,
							"email" : email	
						},
						type : 'post',
						dataType : 'json',
						success : function(res) {
							if(res.cnt == 1) {
								$('#check').val("1");
								$('#find').text("임시비밀번호를 메일로 전송하였습니다.");
							} else {
								$('#find').text("등록된 정보가 존재하지 않습니다.");
							}
							$("#modal").modal();
						},
						error : function(xhr) {
							swal({
								title: "Error",
								text: "상태 :" + xhr.status,
								type: "error",
								showCancelButton: false,
								/* cancelButtonClass: 'btn-danger', */
								confirmButtonClass: 'btn-danger',
								confirmButtonText: '확인'
							});
						}
					});
	        	});
	        	
	        	$('#modal').on('hidden.bs.modal', function () {
	        		if($("#check").val() == 1) {
	        		  location.href = "${cp}/login/view";
	        		}
	        	})
	        })
        
        </script>
    </head>
    <!-- END Head-->

    <!-- START: Body-->
    <body id="main-container" class="default">
        <!-- START: Main Content-->
        <div class="container">
            <div class="row vh-100 justify-content-between align-items-center">
                <div class="col-12">
                    <div class="row row-eq-height lockscreen  mt-5 mb-5">
                        <!-- <div class="lock-image col-12 col-sm-5"> -->
                        <div class="col-12 col-sm-5"> <br><br><br><br><br>
                        	<img src="${cp }/images/FlanbeLogo.png" class="user-image img-fluid">
                        </div>
                        <div class="login-form col-12 col-sm-7">
                        	<h5>비밀번호 찾기</h5><hr><br>
                            <div class="form-group mb-3">
                                <label>아이디</label>
                                <input class="form-control" id="user_id" required="" placeholder="아이디">
                            </div>
                            <div class="form-group mb-3">
                                <label>이메일</label>
                                <input class="form-control" required="" id="email" placeholder="이메일">
                            </div>

                            <div class="form-group mb-0">
                                <button class="btn btn-primary" type="button" id="passfind">임시 비밀번호</button>
                                <!-- Modal -->
                                <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle1" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle1">비밀번호</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div id="find"class="modal-body"></div>
                                            <input type="hidden" id="check">
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--  -->
                            </div><br><br>
                            <div class="mt-2"><a href="${cp }/login/view">로그인</a> / <a href="${cp }/login/idfind">아이디 찾기</a></div>
                            <div class="mt-2">계정이 없으신가요? <a href="${cp }/login/signin">회원가입</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END: Content-->
        <%@ include file="/WEB-INF/views/common/common_js.jsp" %>
    </body>
    <!-- END: Body-->
</html>