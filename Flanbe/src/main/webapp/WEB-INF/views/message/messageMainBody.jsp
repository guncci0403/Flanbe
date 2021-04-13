<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){
   $('.mail-subject').on('click',function(){

      var m_no = $(this).data('m_no');      
      $('#m_no').val(m_no);
      
      $('#fm').submit();
   })
});
</script>
<!-- START: Body-->    
       <form id="fm" action="${cp }/message/messagedetail" >
         <input type="hidden" id="m_no" name="m_no" value="" />
      </form>
         <div class="sidebar">
             <div class="site-width">
                 <!-- START: Menu-->
                 <ul id="side-menu" class="sidebar-menu">
                    <li class="dropdown"><a href="#" style="text-align:center; font-size: 15px;">쪽지함</a>                  
                         <ul>
                             <li><a  href="${cp }/message/main?num=1">
                                <i class="icon-paper-plane pr-2"></i>  받은 쪽지함
                                <span class="ml-auto badge badge-pill badge-success bg-success">${messagecont} </span>
                                </a>
                             </li>
                             <li><a href="${cp }/message/main?num=2">
                            <i class="icon-envelope pr-2"></i> 보낸 쪽지함</a></li>
                         </ul>                   
                     </li>
               </ul>
               <div class="eagle-divider"></div>
             </div>
         </div>
        <!-- START: Main Content-->
        <main>
            <div class="container-fluid site-width">
                <!-- START: Breadcrumbs-->
                <div class="row">
                    <div class="col-12  align-self-center">
                        <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
                            <ol class="breadcrumb bg-transparent align-self-center m-0 p-0">
                            </ol>
                        </div>
                    </div>
                </div>
                
         <div class="row" style="margin-left: 100px;">
         <div class="col-12 col-lg-9 col-xl-10 mb-4 mt-3 pl-lg-0">
               <div class="card border  h-mail-list-section">
                  <div class="card-body p-15">
                     <div class="row m-0 border-bottom theme-border">
                        <div class="col-12 px-2 py-3 d-flex mail-toolbar">
                           <div class="check d-inline-block mr-3">
                              <label class="chkbox">All<input name="all" value="" type="checkbox" class="checkall"> 
                              <span class="checkmark"></span>
                              </label>
                              <label>
                                 <c:choose>
                                    <c:when test="${num == 2 }">
                                       &nbsp; &nbsp; 받는 사람
                                    </c:when>
                                    <c:otherwise>
                                       &nbsp; &nbsp; 보낸 사람
                                    </c:otherwise>
                                 </c:choose>
                              </label>
                           </div>

                        </div>
                     </div>
                     <div class="scrollertodo">
                        <ul class="mail-app list-unstyled">
                           <c:forEach items="${messageList }" var="inbox">
                              <li class="py-3 px-2 mail-item inbox unread personal-mail starred important">
                                 <div class="d-flex align-self-center align-middle">
                                    <label class="chkbox"> <input type="checkbox">
                                       <span class="checkmark small"></span>
                                    </label>
                                    <div class="mail-content d-md-flex w-100">
                                       <span class="mail-type-icon">
                                          <i class="icon-star mr-1"></i>
                                          <i class="icon-exclamation mr-2"></i>
                                       </span> 
                                       <span class="mail-user">
                                          <c:choose>
                                             <c:when test="${num == 2 }">
                                                ${inbox.r_id }
                                             </c:when>
                                             <c:otherwise>
                                                ${inbox.s_id }
                                             </c:otherwise>
                                          </c:choose>
                                       </span>
                                       <p class="mail-subject" data-m_no="${inbox.m_no }">${inbox.m_cont }</p>
                                       <div class="d-flex mt-3 mt-md-0 ml-auto">
                                          <div class="pill-link">
                                             <i class="icon-link mr-3"></i>
                                          </div>
                                          <div class="ml-md-auto mr-3 dot primary"></div>
                                          <p class="ml-auto mail-date mb-0">
                                             <fmt:formatDate value="${inbox.m_regdt }" pattern="yyyy-MM-dd hh:mm:ss" />
                                          </p>
                                          <c:choose>
                                             <c:when test="${num == 2  && inbox.m_state eq 'N'}">
                                                <a href="#" class="ml-3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                   <i class="icon-options-vertical"></i></a>
                                                <div class="dropdown-menu p-0 m-0 dropdown-menu-right">
                                                   <input class="dropdown-item single-delete" type="button" value="삭제"
                                                         onclick="location.href='${cp }/message/messageDelete?m_no=${inbox.m_no }&user_id=${inbox.r_id}'" />
                                                </div>
                                             </c:when>
                                             <c:otherwise></c:otherwise>
                                          </c:choose> 
                                       </div>
                                    </div>
                                 </div>
                              </li>
                           </c:forEach>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- END: Card DATA-->
            </div>
        </main>