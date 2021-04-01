<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(function(){
	<c:if test="${msg != null }">
		alert("${msg}");
	</c:if>
})
</script>
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
           		<a href="" style="text-align:center; font-size: 15px;">계약 관리</a>
           		<ul>
                    <li><a href="${cp }/manage/requestContractList"><i class="mdi h5 mr-2 mdi-clipboard-text-outline"></i>계약 관리</a></li>
           	    </ul>                  
           </li>
		</ul>
    </div>
</div>


<main>
	<div class="container-fluid site-width">
		<div class="row ">
    		<div class="col-11  align-self-center">
        		<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
            		<div class="w-sm-100 mr-auto"><h4 class="mb-0">요청받은 계약</h4></div>
        		</div>
    		</div>
		</div><br>
		<div class="col-12">
			<div class="col-12 col-lg-10 mt-3 pl-lg-0">
				<c:forEach items="${contractList }" var="contract" >
					<div class="card border h-invoice-list-section">
						<div class="card-header border-bottom p-3 d-flex">
							<span style="margin-right: 10px;">프로젝트 명 : </span> 
							<span style="font-size: 15px;"> ${contract.p_title } </span>
						</div>
						<div class="card-body p-0">
							<div class="invoices list">
								<div class="invoice">
									<div class="invoice-content" data-status="generated-invoice">
										<div class="invoice-info">
											<p class="mb-0 small">클라이언트</p>
											<p class="invoice-no">${contract.user_nm } (${contract.user_id })</p>
										</div>
										<div class="invoice-info">
											<p class="mb-0 small">파트너스</p>
											<p class="cliname">${contract.puser_nm } (${contract.puser_id })</p>
										</div>
										<div class="invoice-info">
											<p class="mb-0 small">계약일</p>
											<p class="invoice-due-date"><fmt:formatDate value="${contract.c_dt }" pattern="yyyy.MM.dd" /></p>
										</div>
										<div class="line-h-1">
											<a class="btn btn-primary" href="${cp }/manage/contractView?p_code=${contract.p_code }&puser_id=${contract.puser_id }">상세조회</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><br>
				</c:forEach>
			</div>
		</div>
	</div>
</main>