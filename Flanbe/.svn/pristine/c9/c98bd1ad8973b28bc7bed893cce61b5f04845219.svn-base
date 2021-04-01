<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
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



<!-- START: Main Content-->
<main>
	<div class="container-fluid site-width">
	
		<div class="row ">
    		<div class="col-12  align-self-center">
        		<div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
            		<div class="w-sm-100 mr-auto"><h4 class="mb-0">
            			<c:choose>
            				<c:when test="${dv == 'C'}">
            					클라이언트
            				</c:when>
            				<c:otherwise>
            					파트너스
            				</c:otherwise>
            			</c:choose>
            		</h4></div>
        		</div>
    		</div>
		</div><br>

		<!-- START: Card Data-->
		<div class="col-12">
				<div class="card">
                   <div class="card-header d-flex justify-content-between align-items-center">                               
                       <h4 class="card-title">회원 리스트</h4>                                   
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
                                       <th scope="col">가입일</th>
                                   </tr>
                               </thead>
                               <tbody>
                               	<c:forEach items="${userList }" var="user" >
                                   <tr style="height: 50px;">
                                       <th scope="row">${user.user_id }</th>
                                       <td>${user.user_nm }</td>
                                       <td>${user.email }</td>
                                       <td>${user.phone }</td>
                                       <td><fmt:formatDate value="${user.regdt }" pattern="yyyy.MM.dd"/></td>
                                   </tr>
                                </c:forEach>
                               </tbody>
                           </table> 
                       </div>
                   </div>
               </div>
		</div>
		<!-- END: Card DATA-->
	</div>
</main>