<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card-header  justify-content-between align-items-center">                               
	        <h4 class="card-title">수행한 프로젝트</h4>  
	        :  <span class="text-primary">파트너스가 받은 후기</span>
	    </div>
	    <div class="card-body">
	        <div class="table-responsive">
	            <table class="table layout-primary">
	                <thead>
	                    <tr>
	                        <th scope="col">프로젝트명</th>
	                        <th scope="col">받은 후기</th>
	                        <th scope="col">평점</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <c:forEach items="${evaluationList}" var="evaluationList">
	                    <tr>
	                        <th scope="row">${evaluationList.p_title}</th>
	                        <td >${evaluationList.e_cont}</td>
	                        <td>${evaluationList.average}</td>
	                    </tr>
	                </c:forEach>
	                </tbody>
	            </table> 
	        </div>
	    </div>
	
<!-- 페이징 처리 시작 -->					
		<ul class="pageNation justify-content-center m-0">
			
			<li class="page-item pageButton firstPageButton">
				<a class="page-link" onclick="basicInfoTable(1)">
				<i class="fas fa-angle-double-left"></i>
				</a>
			</li>
			
			
			<li class="page-item pageButton" style="width : 30px">
				<a class="page-link" onclick="basicInfoTable('${pageNation.prevPage}')" >
				<i class="fas fa-angle-left">
				</i>
				</a>
			</li>
		
			<c:forEach begin="${pageNation.startPage}" end="${pageNation.endPage}"  var="i">
				<li class="page-item <c:if test="${pageNation.curPage eq i}">active</c:if> pageButton">
				<a class="page-link" onclick="basicInfoTable('${i}')">${i}</a>
				</li>
			</c:forEach> 
		
			<li class="page-item pageButton">
				<a class="page-link" onclick="basicInfoTable('${pageNation.nextPage}')">
					<i class="fas fa-angle-right"></i>
				</a>
			</li>
			
			<li class="page-item pageButton">
				<a class="page-link " onclick="basicInfoTable('${pageNation.pageCnt}')">
					<i class="fas fa-angle-double-right"></i>
				</a>
			</li>
		</ul>
						
<!-- 페이징 처리 끝 -->	