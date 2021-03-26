<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${cp }/dist/vendors/select2/css/select2.min.css">
<link rel="stylesheet" href="${cp }/dist/vendors/select2/css/select2-bootstrap.min.css">
<script src="${cp }/dist/vendors/select2/js/select2.full.min.js"></script>
<script src="${cp }/dist/js/select2.script.js"></script>

<style>
.select2-container {
	display: inline-block;
}
</style>
<input type="hidden" id="msg" value="${msg }">


<div class="form-row col-9" style="margin-left: 12%;">
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
					<th scope="row"><span style="margin-left: 10px;"> <c:choose>
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
					</span>
						<button data-us_no="${skill.us_no }" class="btn btn-outline-secondary pull-right sdelete" style="margin-left: 2px;">
							<i class="fa fa-trash"></i>
						</button></td>
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
</div>
