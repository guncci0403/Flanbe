<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
   	$(function() {
   		<c:if test="${chk != null}">
   			var a = '${chk}';
   			var arr = a.split(",");
   			for(var i in arr) {
				if(arr[i] == '01') {
					$("#p_filedW").prop('checked',true);
				} else if(arr[i] == '02'){
					$("#p_filedAP").prop('checked',true);
				} else if(arr[i] == '03') {
					$("#p_filedP").prop('checked',true);
				} else if(arr[i] == '04') {
					$("#p_filedG").prop('checked',true);
				} else if(arr[i] == '05') {
					$("#p_fileds").prop('checked',true);
				}
			}
		</c:if>
		<c:if test="${param.state eq 'preiod'}">
			$('#st_preiod').val('${param.st}').prop("selected", true);
			$('#end_preiod').val('${param.end}').prop("selected", true);
			$('#st').val('${param.st}');
			$('#end').val('${param.end}');
		</c:if>
		<c:if test="${param.state eq 'price'}">
// 			$('#st_price').val('${param.st}').prop("selected", true);
// 			$('#end_price').val('${param.end}').prop("selected", true);
			var sts = '${param.st}';
			var ends = '${param.end}';
			
			$('#st_price').val(sts);
			$('#end_price').val(ends);
		</c:if>
	$("#searchBtn").on("click", function() {
			var searchType = $("#searchType").val();
			var kw = $("#kw").val();

			$('#sT').val(searchType);
			$('#kW').val(kw);
			$('#sh').submit();
		})

	var test = [];
	$('input[type="checkbox"][name="p_filed"]').change(function(){
		 if($(this).prop('checked') == true){
  			 var chk  = $(this).val();
  			 test.push(chk);
  				
		 } else if($(this).prop('checked')==false) {
			 var unchk  = $(this).val();
			 test.pop(unchk);
			 console.log(unchk);
		 }
	       
	 });
	 

		$(document).ready(function() {
// 			$('select[id=st_price]').change(function() {
// 				console.log($(this).val());
// 				if ($(this).val() == "1") {
// 					$('#st').val("");
// 				} else {
// 					$('#st').val($(this).val());
// 				}

// 			});
// 			$('select[id=end_price]').change(function() {
// 				console.log($(this).val());
// 				if ($(this).val() == "1") {
// 					$('#end').val("");
// 				} else {
// 					$('#end').val($(this).val());
// 				}
// 			})

			$('select[id=st_preiod]').change(function() {
				console.log($(this).val());
				if ($(this).val() == "1") {
					$('#st').val("1");
				} else {
					$('#st').val($(this).val());
				}

			});
			$('select[id=end_preiod]').change(function() {
				console.log($(this).val());
				if ($(this).val() == "1") {
					$('#end').val("");
				} else {
					$('#end').val($(this).val());
				}

			});
			$('#priceBtn').on('click', function() {
				$('#st').val($("#st_price").val());
				$('#end').val($("#end_price").val());
				$('#state').val("price");
				$('#frm').attr("method", "get");
				$('#frm').attr("action", "${cp}/project/searchFilterPrice");
				$('#frm').submit();
			});

			$('#termBtn').on('click', function() {
				$('#state').val("preiod");
				$('#frm').attr("method", "get");
				$('#frm').attr("action", "${cp}/project/searchFilterPreiod");
				$('#frm').submit();
			});
			
			$('#pfiled').on('click', function() {
				var len = $("input:checkbox[name='p_filed']:checked").length
					$('#filedSearch').attr("method", "get");
					$('#filedSearch').attr("action", "${cp }/project/searchFilterpfileds");
				$('#filedSearch').submit();
			})
			});

		});

</script>



<form id="sh" action="${cp }/project/searchProject">
   <input type="hidden" id="sT" name="sT" value="" /> 
   <input type="hidden" id="kW" name="kW" value="" />
</form>

<form id="frm" >
   <input type="hidden" id="st" name="st" value="" /> 
   <input type="hidden" id="end" name="end" value="" />
   <input type="hidden" id="state" name="state" value="" />
</form>


<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu">
			<li class="dropdown">
			<a href="#" style="text-align: center; font-size: 15px;">프로젝트 상세조회</a></li>
		</ul>
		<div class="card-body p-2" style="margin-left : 10px;">
		<form id="filedSearch" >
		  <input type="hidden" name="state" value="filed" />
		  	<a style="cursor: default;">
				<font size="3"><strong> 프로젝트 분야 </strong></font>
				<span>
					<button class="btn" type="button" id="pfiled" data-card-widget="pfiled">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			</a><br>
			<div class="custom-control custom-checkbox custom-control-inline">                                        
				<input type="checkbox" class="custom-control-input" id="p_filedW" name="p_filed" value="01">
				<label class="custom-control-label" for="p_filedW"> 웹</label>
            </div><br>
            <div class="custom-control custom-checkbox custom-control-inline">                                        
				<input type="checkbox" class="custom-control-input" id="p_filedAP"name="p_filed" value="02">
				<label class="custom-control-label" for="p_filedAP"> 애플리케이션</label>
            </div><br>
            <div class="custom-control custom-checkbox custom-control-inline">                                        
				<input type="checkbox" class="custom-control-input" id="p_filedP"name="p_filed" value="03">
				<label class="custom-control-label" for="p_filedP"> 퍼블리싱</label>
            </div><br>
            <div class="custom-control custom-checkbox custom-control-inline">                                        
				<input type="checkbox" class="custom-control-input" id="p_filedG"name="p_filed" value="04">
				<label class="custom-control-label" for="p_filedG"> 게임</label>
            </div><br>
            <div class="custom-control custom-checkbox custom-control-inline">                                        
				<input type="checkbox" class="custom-control-input" id="p_fileds"name="p_filed" value="05">
				<label class="custom-control-label" for="p_fileds"> 기타</label>
            </div><br>
			</form>
		</div>
		<hr>
		<div class="card-body p-2">
			<a style="cursor: default;">
				<font size="3"><strong> 프로젝트 예상금액 </strong></font>
				<span>
					<button class="btn" type="button" id="priceBtn" data-card-widget="priceBtn">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			</a><br><br>
			<table>
				<tr>
					<td>
<!-- 						<select style="width: 100px;" id="st_price" -->
<!-- 							class="btn btn-outline-secondary dropdown-toggle"> -->
<!-- 							<option label="금액 선택" value="1"></option> -->
<!-- 							<option value ="0">0</option> -->
<!-- 							<option value="500000">50</option> -->
<!-- 							<option value="1000000">100</option> -->
<!-- 							<option value="1500000">150</option> -->
<!-- 							<option value="2000000">200</option> -->
<!-- 						</select> -->
						<input type="text" style="width: 100px;" id="st_price" value="" placeholder="금액 입력">
					</td>
					<td>
						만 원 <strong>이상</strong>
					</td>
				</tr>
			</table>
			<br><br>
			<table>
				<tr>
					<td>
<!-- 						<select style="width: 100px;" id="end_price" class="btn btn-outline-secondary dropdown-toggle"> -->
<!-- 							<option label="금액 선택" value="1"></option> -->
<!-- 							<option value="500000">50</option> -->
<!-- 							<option value="1000000">100</option> -->
<!-- 							<option value="1500000">150</option> -->
<!-- 							<option value="2000000">200</option> -->
<!-- 							<option value="2500000">250</option> -->
<!-- 		 				</select> -->
						<input type="text" style="width: 100px;" id="end_price" value="" placeholder="금액 입력">
					</td>
					<td>
						만 원 <strong>이하</strong>
					</td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="card-body p-2">
			<a style="cursor: default;">
				<font size="3"><strong> 프로젝트 예상기간 </strong></font>
				<span>
					<button class="btn" type="button" id="termBtn" data-card-widget="termBtn">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			</a><br><br>
			<table>
				<tr>
					<td>
						<select style="width: 100px;" id="st_preiod"
							class="btn btn-outline-secondary dropdown-toggle">
							<option label="기간 선택" value="1"></option>
							<option value="1">1일</option>
							<option value="30">30일</option>
							<option value="60">60일</option>
							<option value="90">90일</option>
							<option value="120">120일</option>
						</select>
					</td>
					<td>
						 <strong>이상</strong>
					</td>
				</tr>
			</table>
			<br><br>
			<table>
				<tr>
					<td>
						<select style="width: 100px;" id="end_preiod"
							class="btn btn-outline-secondary dropdown-toggle">
							<option label="기간 선택" value="1"></option>
							<option value="30">30일</option>
							<option value="60">60일</option>
							<option value="90">90일</option>
							<option value="120">120일</option>
							<option value="150">150일</option>
						</select>
					</td>
					<td>
						 <strong>이하</strong>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</div>

<div class="eagle-divider"></div>
<main>
   <div class="container-fluid site-width">
      <!-- START: Breadcrumbs-->
      <div class="row ">
         <div class="col-11  align-self-center">
            <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
               <div class="w-sm-100 mr-auto">
                  <h4 class="mb-0">프로젝트 찾기</h4>
               </div>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-11 mt-4">
            <div class="card">
               <div class="card-header justify-content-between align-items-center">
                  <div id="keyword" class="card-tools" style="width: 550px;">
                     <div class="input-group row">
                        &nbsp; &nbsp; &nbsp;
                        <select class="form-control col-md-3" name="searchType" id="searchType">
                           <option value="">검색구분</option>
                           <option value="i">클라이언트</option>
                           <option value="p">프로젝트명</option>
                        </select>
                        <input class="form-control" type="text" id="kw" name="keyword" placeholder="검색어를 입력하세요." value=""> 
                        <span class="input-group-append">
                           <button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search">
                              <i class="fa fa-fw fa-search"></i>
                           </button>
                        </span>
                     </div>
                  </div>
               </div>
               <div class="card-body">
                  <div class="col-12">
                     <div class="col-12 mt-3 pl-lg-0">

                        <c:forEach items="${projectList }" var="project">
                           <div class="card border h-invoice-list-section">
                              <div class="card-header border-bottom p-3 d-flex">
                                 <span style="margin-right: 10px;">프로젝트 명 : </span> 
                                 <span style="font-size: 15px;"> ${project.p_title } </span>
                              </div>
                              <div class="card-body p-0">
                                 <div class="invoices list">

                                    <div class="invoice">
                                       <div class="invoice-content">
                                          <div class="invoice-info">
                                             <p class="mb-0 small">클라이언트:</p>
                                             <p class="invoice-no">${project.user_id }</p>
                                          </div>
                                          <div class="invoice-info">
                                             <p class="mb-0 small">계약금액:</p>
                                             <p class="cliname"><fmt:formatNumber value="${project.p_money }"/>원</p>
                                          </div>
                                          <div class="invoice-info">
                                             <p class="mb-0 small">프로젝트 기간:</p>
                                             <p class="invocie-date">${project.period }일</p>
                                          </div>
                                          <div class="invoice-info">
                                             <p class="mb-0 small">등록일</p>
                                             <p class="invoice-due-date">
                                                <fmt:formatDate value="${project.p_regdt }" pattern="yyyy.MM.dd" />
                                             </p>
                                          </div>
                                          <div class="invoice-info">
                                             <p class="mb-0 small">마감일</p>
                                             <p class="invoice-due-date">
                                                <fmt:formatDate value="${project.deadline }" pattern="yyyy.MM.dd" />
                                             </p>
                                          </div>
                                          <div class="line-h-1">
                                             <a class="btn btn-primary" href="${cp }/project/viewProject?p_code=${project.p_code }">상세조회</a>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div><br>
                        </c:forEach>
                     </div>
			         <nav aria-label="member list Navigation">
			            <ul class="pagination justify-content-center m-0">
			               <c:set var="cnt" value="${pagination}" />
			               <li class="page-item">
			               		<c:choose>
			               			<c:when test="${state eq 'filed' }">
			               				<a class="page-link" href="${cp }/project/searchFilter?page=1&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${p_filed }">
			               			</c:when>
			               			<c:otherwise>
			                  			<a class="page-link" href="${cp }/project/searchFilter?page=1&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${param.p_filed }">
			               			</c:otherwise>
			               		</c:choose>
			                     <i class="fas fa-angle-double-left"></i>
			                  </a>
			               </li>
			               <li class="page-item">
			                  <c:choose>
			                     <c:when test="${pageVo.page > 1 }">
			                     	<c:choose>
				               			<c:when test="${state eq 'filed' }">
				               				<a class="page-link" href="${cp }/project/searchFilter?page=${pageVo.page - 1}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${p_filed }">
				               			</c:when>
				               			<c:otherwise>
				                        	<a class="page-link" href="${cp }/project/searchFilter?page=${pageVo.page - 1}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${param.p_filed }">
				                        </c:otherwise>
			                        </c:choose>
			                           <i class="fas fa-angle-left"></i>
			                        </a>
			                     </c:when>
			                     <c:otherwise>
			                        <span class="page-link">
			                           <i class="fas fa-angle-left"></i>
			                        </span>
			                     </c:otherwise>
			                  </c:choose>
			               </li>
			               <c:forEach begin="1" end="${pagination}" var="i">
			                  <c:choose>
			                     <c:when test="${pageVo.page == i}">
			                        <li class="page-item active">
			                        <c:choose>
				               			<c:when test="${state eq 'filed' }">
				               				<a class="page-link" href="${cp}/project/searchFilter?page=${i}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${p_filed }">${i}</a>
				               			</c:when>
				               			<c:otherwise>
			                           		<a class="page-link" href="${cp}/project/searchFilter?page=${i}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${param.p_filed }">${i}</a>
			                           	</c:otherwise>
			                        </c:choose>
			                        </li>
			                     </c:when>
			                     <c:otherwise>
			                        <li class="page-item">
			                        	<c:choose>
				               			<c:when test="${state eq 'filed' }">
				               				<a class="page-link" href="${cp}/project/searchFilter?page=${i}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${p_filed }">${i}</a>
				               			</c:when>
				               			<c:otherwise>
			                           		<a class="page-link" href="${cp}/project/searchFilter?page=${i}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${param.p_filed }">${i}</a>
			                           	</c:otherwise>
			                           	</c:choose>
			                        </li>
			                     </c:otherwise>
			                  </c:choose>
			               </c:forEach>
			               <li class="page-item">
			                  <c:choose>
			                     <c:when test="${pageVo.page < pagination }">
			                     	<c:choose>
				               			<c:when test="${state eq 'filed' }">
				               				<a class="page-link" href="${cp}/project/searchFilter?page=${pageVo.page + 1}&pageSize=${pageVo.pageSize }&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${p_filed }">
				               			</c:when>
				               			<c:otherwise>
			                        		<a class="page-link" href="${cp}/project/searchFilter?page=${pageVo.page + 1}&pageSize=${pageVo.pageSize }&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${param.p_filed }">
			                        	</c:otherwise>
			                        	</c:choose>
			                        <i class="fas fa-angle-right"></i>
			                        </a>
			                     </c:when>
			                     <c:otherwise>
			                        <span class="page-link">
			                           <i class="fas fa-angle-right"></i>
			                        </span>                     
			                     </c:otherwise>
			                  </c:choose>
			               </li>
			               <li class="page-item">
			               		<c:choose>
				               			<c:when test="${state eq 'filed' }">
				               				<a class="page-link" href="${cp}/project/searchFilter?page=${pagination}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${p_filed }">
				               			</c:when>
				               			<c:otherwise>
			                  				<a class="page-link" href="${cp}/project/searchFilter?page=${pagination}&pageSize=${pageVo.pageSize}&st=${param.st}&end=${param.end}&state=${param.state}&p_filed=${param.p_filed }">
			                  			</c:otherwise>
			                  	</c:choose>
			                     <i class="fas fa-angle-double-right"></i>
			                  </a>
			               </li>
			            </ul>
			         </nav>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</main>
