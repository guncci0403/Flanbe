<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
	$(function(){
		$('#approvalBtn').on('click', function() {
			$('#updateConFrm').submit();
		})
	});
</script>
<form id="updateConFrm" action="${cp }/manage/updateContract" method="POST">
	<input type="hidden" name="p_code" value="${contract.p_code }"/>
	<input type="hidden" name="puser_id" value="${contract.puser_id }"/>
</form>
<div class="sidebar">
    <div class="site-width">
        <!-- START: Menu-->
        <ul id="side-menu" class="sidebar-menu">
           <li>
           		<a href="#" style="text-align:center; font-size: 15px;">회원관리</a>                  
                <ul>
                    <li><a href="${cp }/manage/userList"><i class="mdi h5 mr-2 mdi-account-outline"></i> 클라이언트 </a></li>
                    <li><a href="${cp }/manage/userList?div=P"><i class="mdi h5 mr-2 mdi-account"></i> 파트너스 </a></li>
           	    </ul>
           </li>
           <li>
           		<a href="#" style="text-align:center; font-size: 15px;">프로젝트 관리</a>
           		<ul>
                    <li><a href="${cp }/manage/requestProjectList"><i class="fas  h5 mr-2 fa-clipboard-check"></i>프로젝트 관리</a></li>
           	    </ul>                
           </li>
           <li>
           		<a href="#" style="text-align:center; font-size: 15px;">계약 관리</a>
           		<ul>
                    <li><a href="${cp }/manage/requestContractList"><i class="mdi h5 mr-2 mdi-clipboard-text-outline"></i>계약 관리</a></li>
           	    </ul>                  
           </li>
		</ul>
    </div>
</div>
<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<br>
		<div class="row">
			<div class="col-8 mt-4">
				<div class="card">
					<br>
					<br>
					<h3 class="card-title" style="text-align: center;">프로젝트 계약서</h3>
					<div class="card-content">
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<br>
									<form>
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th colspan="1" style="text-align: center;">프로젝트명</th>
														<td colspan="3" align="center">${contract.p_title }</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th colspan="1" style="text-align: center;">클라이언트</th>
														<td colspan="3" align="center">${contract.user_nm }</td>
													</tr>
													<tr>
														<th rowspan="1" style="text-align: center;">파트너스</th>
														<td colspan="3" align="center">${contract.puser_nm}</td>
													</tr>
													<tr>
														<th rowspan="1" style="text-align: center;">계약금액</th>
														<td colspan="3" align="center"><fmt:formatNumber value="${contract.c_money }"/></td>
													</tr>
													<tr>
														<th scope="row" style="text-align: center;">프로젝트 기간</th>
														<td align="center">시작일 : ${contract.c_sdt }</td>
														<td align="center">종료일 : ${contract.c_edt }</td>
													</tr>
													<tr>
														<th colspan="4" style="text-align: center;">프로젝트 계약 내용2</th>
													</tr>
													<tr>
														<td colspan="3"><div style="min-height: 300px;">${contract.con_cont }</div></td>
													</tr>
												</tbody>
											</table>
										</div>
										<button type="button" id="approvalBtn" class="btn btn-primary">승인</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3 col-xl-2">
				<div class="card mb-2" style="margin-top: 25px;">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h4 class="card-title">클라이언트 사인</h4>
					</div>
					<div class="card-body">
						<div class="media d-block d-sm-flex text-center text-sm-left mb-4">
							<div class="media-body align-self-center redial-line-height-1_5">
								<img class="user-image img-fluid" src="/sign/viewSign?id=${contract.user_id }" style="width: 300px; height: 150px;">
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-2" style="margin-top: 150px;">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h4 class="card-title">파트너스 사인</h4>
					</div>
					<div class="card-body">
						<div class="media d-block d-sm-flex text-center text-sm-left mb-4">
							<div class="media-body align-self-center redial-line-height-1_5">
								<img class="user-image img-fluid" src="/sign/viewSign?id=${contract.puser_id }" style="width: 300px; height: 150px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

