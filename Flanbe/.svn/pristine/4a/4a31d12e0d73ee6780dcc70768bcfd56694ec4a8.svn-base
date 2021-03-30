<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
         <thead>
							                                            <tr>
							                                                <th scope="col" style="width: 200px;">작성자</th>
							                                                <th colspan="4"  scope="col">댓글내용</th>
							                                                <th style="width: 200px;" scope="col">작성일시</th>
							                                                <th style="width: 180px;" scope="col"></th>
							                                            </tr>
							                                        </thead>
							                                        <tbody id="replyBody">
							                                        <c:forEach items="${replyVoList}" var="replyVo">

																		<c:choose>
							                                            <c:when test="${replyVo.r_parent_name != null }">
							                                             <tr class="eachReplyTr replyReply" id="${replyVo.r_no}" data-rnumber="${replyVo.r_no}" data-pno="${replyVo.r_parent}">
							                                            </c:when>   
																		<c:otherwise>
							                                            <tr class="eachReplyTr" id="${replyVo.r_no}" data-rnumber="${replyVo.r_no}" data-pno="${replyVo.r_parent}">
							                                            </c:otherwise>
							                                            </c:choose> 
							                                                <th scope="row" style="width: 200px;">${replyVo.user_id }</th>
							                                                <c:choose>
								                                                <c:when test="${replyVo.r_parent_name != null }">
								                                                <td class="Cont" id="${replyVo.r_no}" colspan="4">&emsp;&emsp;&emsp;&emsp;<c:if test="${replyVo.r_cont == '삭제된 댓글입니다.'}"><i id="trashIcon" class="fas fa-trash-alt trashIcon"></i></c:if> 
								                                                <span class="replyParentId">${replyVo.r_parent_name}</span> 답글 :<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span class="replyContSpan">${replyVo.r_cont }</span></td>
								                                                </c:when>
								                                                
								                                                <c:otherwise>
								                                                <td class="Cont" id="${replyVo.r_no}" colspan="4"><c:if test="${replyVo.r_cont == '삭제된 댓글입니다.'}"><i id="trashIcon" class="fas fa-trash-alt trashIcon"></i></c:if> 
								                                                <span class="replyParentId">${replyVo.r_parent_name}</span><span class="replyContSpan">${replyVo.r_cont }</span></td>
								                                                </c:otherwise>
							                                                </c:choose>
							                                                
							                                                <td style="width: 200px;">${replyVo.r_regdt }</td>
							                                                <td class="deleteAjaxTd" style="width: 180px;">
							                                                	<c:choose>
							                                                	<c:when test="${replyVo.r_cont != '삭제된 댓글입니다.'}">
							                                                	<!-- 수정이가 수정함 id data로 변해버림 -->
							                                                	<c:if test="${ S_USER.user_id == replyVo.user_id  }">
								                                                	<button class="btn btn-outline-primary deleteReply" data-delete="${replyVo.r_no }" >
								                                                		<i class="fa fa-trash deleteIcon"></i>
								                                                	</button>
								                                                 	<!-- 댓글 수정하는 버튼 -->
								                                                 	<button class="btn btn-outline-primary updateReplyView" data-rno="${replyVo.r_cont }" data-rnono="${replyVo.r_no}">
								                                                 		<i class="far fa-edit updateIcon"></i>
								                                                 	</button>
							                                                 	</c:if>
							                                                  	<!-- 대댓글 작성하는 버튼 -->
							                                                  	<!-- 수정이가 수정함 id data로 변해버림 -->
							                                                  	<button class="btn btn-outline-primary ChildReplyViewBtn" data-up="${replyVo.r_no }" >+ <i  class="far fa-edit updateIcon"></i></button>
							                                                	</c:when>
							                                                	<c:otherwise></c:otherwise>
							                                                	</c:choose>
							                                                 </td>
							                                            <!-- 댓글 수정 / 대댓글 입력 -->
							                                         <!--     <tr style="height: 150px;">
							                                                <th scope="col" style="width: 200px;"></th>
							                                                <th colspan="4" style="width: 200px; height: 50px;" ><span id="titlereplyReply">답글 입력</span><br><textarea rows="3" cols="130"></textarea><input type="button" class="btn float-right btn-primary" value="답글등록"></th>
							                                                <th style="width: 200px;" scope="col"></th>
							                                                <th style="width: 180px;" scope="col"></th>
							                                            </tr> -->
							                                             <!-- 댓글 수정 / 대댓글 입력 끝-->
							                                         </c:forEach> 
							                                         </tbody>