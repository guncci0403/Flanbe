<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/profileSidebar.jsp" %>
<script>
//문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
   var i = ${skillList.size() };
   $("#newSkill").on("click" , ".sdelete" , function(){
      var us_no = $(this).data("us_no");
      var th = $(this);
      $.ajax({
         url:'${cp}/user/deleteSkill',
         type:'get',
         dateType:'json',
         data : {
            "us_no" : us_no
         },
         success:function(data){
            $(th).parent().parent().remove();
            $(th).parent().remove();
            swal({
               title: "Success!!",
               text: "삭제 성공",
               type: "success",
               showCancelButton: false,
               /* cancelButtonClass: 'btn-danger', */
               confirmButtonClass: 'btn-success',
               confirmButtonText: '확인'
            });
            i--;
         },
         error:function(xhr){
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
      })
   });
   
   $("#newSkill").on("click" , ".sinsert" , function(){
      if($("#kind").val() == "05" && $("#etcSelect").val() == ""){
         swal({
            title: "Info",
            text: "보유기술명을 입력해주세요",
            type: "info",
            showCancelButton: false,
            confirmButtonClass: 'btn-info',
            confirmButtonText: '확인',   
            closeOnConfirm: false
         });
         return false;
      }
      else{
         $.ajax({
            url:'${cp}/user/insertSkill',
            type:'post',
            dateType:'json',
            data : {
               "user_id" : $("#user_id").val(),
               "us_kind" : $("#kind").val(),
               "us_prof" : $("#prof").val(),
               "etc" : $("#etcSelect").val()
               
            },
            success:function(res){
               $("#newSkill").html(res);
               if($("#msg").val()=="수정 성공!!"){
                  swal({
                     title: "Success!!",
                     text: $("#msg").val(),
                     type: "success",
                     showCancelButton: false,
                     /* cancelButtonClass: 'btn-danger', */
                     confirmButtonClass: 'btn-success',
                     confirmButtonText: '확인'
                  });
               }
               else if($("#msg").val()=="추가 성공!!"){
                  swal({
                     title: "Success!!",
                     text: $("#msg").val(),
                     type: "success",
                     showCancelButton: false,
                     /* cancelButtonClass: 'btn-danger', */
                     confirmButtonClass: 'btn-success',
                     confirmButtonText: '확인'
                  });
               }
               else if($("#msg").val()=="추가 실패!!"){
                  swal({
                     title: "Error",
                     text: $("#msg").val(),
                     type: "error",
                     showCancelButton: false,
                     /* cancelButtonClass: 'btn-danger', */
                     confirmButtonClass: 'btn-danger',
                     confirmButtonText: '확인'
                  });
               }
            },
            error:function(xhr){
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
         })
      }
   });
   
});
</script>
<script>
	
	  //종류 '기타' 선택하면 input 태그 생성 입력하기
	   function selectDivisionEtc(value){
	     var etcSelect = document.getElementById("etcSelect");
	     if(value == "05"){
	        etcSelect.style.display = "block";
	     }else{
	        etcSelect.style.display = "none";
	     }
	  }
</script>
<style>
.pull-right {
   float: right !important;
}

.table {
   width: 100%;
   border-collapse: collapse;
   text-align: left;
   line-height: 1.5;
   border: 1px solid #ccc;
   margin: 20px 10px;
}

.table thead th {
   width: 60%;
   padding: 10px;
   font-weight: bold;
   border-bottom: 2px solid #ccc;
   vertical-align: top;		
   margin: 20px 10px;
}

.table tbody th {
   padding: 10px;
   line-height: 3;
   border-bottom: 1px solid #ccc;
}

.table td {
   padding: 10px;
   line-height: 3;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}

.select2-container {
   display: inline-block;
}

.select2-search--dropdown .select2-search__field {
   display: none;
}
</style>
<main>
   <div class="content">
      <!-- END: Card DATA-->
      <div class="profile_frame">
         <div class="col-11 mt-4">
            <div class="card border  h-mail-list-section">
               <section>
                  <h3 class="p5-profile-head" style="margin-top: 25px; padding-bottom: 20px; height: 52px; font-size: 24px; line-height: 1.3;">보유 기술</h3>
               </section>
               <section class="p5-partition">
                  <div class="p5-2spanInfo" style="min-height: 200px; height: auto; margin-bottom: 10px !important;">
                     <br> <br>
                     <%-- <c:forEach items="${careerList }" var="career" varStatus="loop"> --%>
                     <div id="newSkill">
                        <div class="form-row col-9" style="margin-left: 12%;">
                           <c:choose>
                              <c:when test="${skillList[0] == null}">
                              	<c:if test="${user.user_id != S_USER.user_id }">
                                 <div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
                                    <div style="display: table-cell; vertical-align: middle;">
                                       <div>
                                          <img src="${cp }/images/profile_certify.png" style="vertical-align: middle;">
                                          <p class="p5-no-partners-info-text" style="margin-top: 15px; margin-bottom: 0; color: #999 !important; line-height: 1;">
                                             등록된 <span class="text-center p5-bold" style="font-weight: bold;">'보유 기술'</span>이 없습니다.
                                          </p>
                                       </div>
                                    </div>
                                 </div>
                                </c:if> 
                                 <c:if test="${user.user_id == S_USER.user_id }">
                                    <div class="col-12">
										<span style="border: none; text-align: right; color: #999999; font-size: 12px; float: right; padding-right: 5px;">(3년 미만 : 초급,  3년 이상 : 중급,  5년 이상: 고급,  10년 이상: 특급)</span>
									</div>
                                 	<table class="table table-striped" style="margin-top: 5px;">
                                       <thead>
                                          <tr>
                                             <th>종류</th>
                                             <th>숙련도</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <th scope="row"><select id="kind" onchange="selectDivisionEtc(this.value)" style="width: 100%;">
                                                   <option value="01">Java</option>
                                                   <option value="02">C</option>
                                                   <option value="03">Python</option>
                                                   <option value="04">JavaScript</option>
                                                   <option value="05">기타</option>
                                             </select> <input type="text" id="etcSelect" placeholder="보유기술명을 입력해 주세요" style="display: none; width: 99.4%; margin-left: 1px; margin-top: 5px; height: 32px;"> <input type="hidden" id="user_id" value="${user.user_id }"></th>
                                             <td nowrap="nowrap"><select id="prof" style="width: 200px;">
                                                   <option value="01">초급</option>
                                                   <option value="02">중급</option>
                                                   <option value="03">고급</option>
                                                   <option value="04">특급</option>
                                             </select>
                                                <button class="btn btn-outline-success pull-right sinsert" style="margin-left: 2px;">
                                                   <i class="fas fa-plus"></i>
                                                </button></td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </c:if>
                              </c:when>
                              <c:otherwise>
								<div class="col-12">
									<span style="border: none; text-align: right; color: #999999; font-size: 12px; float: right; padding-right: 5px;">(3년 미만 : 초급,  3년 이상 : 중급,  5년 이상: 고급,  10년 이상: 특급)</span>
								</div>
                                 <table class="table table-striped" style="margin-top: 5px;">
                                    <thead>
                                       <tr>
                                          <th scope="cols">종류</th>
                                          <th scope="cols">숙련도</th>
                                       </tr>
                                    </thead>
                                    <c:forEach items="${skillList }" var="skill">
                                       <tbody>
                                          <tr>
                                             <th scope="row"><span class="skl" style="margin-left: 10px;"> <c:choose>
                                                      <c:when test="${skill.us_kind == '01' }">Java</c:when>
                                                      <c:when test="${skill.us_kind == '02' }">C</c:when>
                                                      <c:when test="${skill.us_kind == '03' }">Python</c:when>
                                                      <c:when test="${skill.us_kind == '04' }">JavaScript</c:when>
                                                      <c:otherwise>${skill.us_kind }</c:otherwise>
                                                   </c:choose>
                                             </span></th>
                                             <td><span style="margin-left: 5px;"> <c:choose>
                                                      <c:when test="${skill.us_prof == '01' }">초급</c:when>
                                                      <c:when test="${skill.us_prof == '02' }">중급</c:when>
                                                      <c:when test="${skill.us_prof == '03' }">고급</c:when>
                                                      <c:when test="${skill.us_prof == '04' }">특급</c:when>
                                                   </c:choose>
                                             </span> <c:if test="${user.user_id == S_USER.user_id }">
                                                   <button data-us_no="${skill.us_no }" class="btn btn-outline-secondary pull-right sdelete" style="margin-left: 2px;">
                                                      <i class="fa fa-trash"></i>
                                                   </button>
                                                </c:if></td>
                                          </tr>
                                       </tbody>
                                    </c:forEach>
                                    <c:if test="${user.user_id == S_USER.user_id }">
                                       <tbody>
                                          <tr>
                                             <th scope="row">
                                             	<select id="kind" onchange="selectDivisionEtc(this.value)" style="width: 100%;">
                                                   <option value="01">Java</option>
                                                   <option value="02">C</option>
                                                   <option value="03">Python</option>
                                                   <option value="04">JavaScript</option>
                                                   <option value="05">기타</option>
	                                             </select> 
	                                             <input type="text" id="etcSelect" placeholder="보유기술명을 입력해 주세요" style="display: none; width: 99.4%; margin-left: 1px; margin-top: 5px; height: 32px;">
	                                             <input type="hidden" id="user_id" value="${user.user_id }">
                                             </th>
                                             <td nowrap="nowrap"><select id="prof" style="width: 200px;">
                                                   <option value="01">초급</option>
                                                   <option value="02">중급</option>
                                                   <option value="03">고급</option>
                                                   <option value="04">특급</option>
                                             </select>
                                                <button class="btn btn-outline-success pull-right sinsert" style="margin-left: 2px;">
                                                   <i class="fas fa-plus"></i>
                                                </button></td>
                                          </tr>
                                       </tbody>
                                    </c:if>
                                 </table>
                              </c:otherwise>
                           </c:choose>
                        </div>
                        <br> <br>
                     </div>
                  </div>
               </section>
            </div>
         </div>
      </div>
   </div>
</main>
<script src="${cp }/dist/vendors/select2/js/select2.full.min.js"></script>
<script src="${cp }/dist/js/select2.script.js"></script>