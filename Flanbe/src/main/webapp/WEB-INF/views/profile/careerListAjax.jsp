<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="msg" value="${msg }">

<c:forEach items="${careerList }" var="career" varStatus="loop">
	<div>
		<div class="form-row col-10" id="borderdiv">
			<div class="form-group col-11">
				<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
					<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">회사명</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_nm }">
				</div>
				<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
					<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">근무부서</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_dept }">
				</div>
				<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
					<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">직위</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_position }">
				</div>
				<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
					<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">근무기간</span> <input readonly="readonly" type="text" class="form-control col-8" style="margin-left: 10px; border: none; text-align: left; font-size: 16px;" value="${career.c_sdt } ~ ${career.c_edt }">
				</div>
				<div class="form-row col-12" style="border-bottom: 1px solid lightgray;">
					<span class="form-control col-2" style="border: none; text-align: center; padding-top: 8px; color: #999999; font-size: 16px;">설명</span>
					<span class="form-control col-9" style="margin-left: 10px; border: none; text-align: left; font-size: 16px; display: table;">${career.c_cont }</span>
				</div>
			</div>
			<div>
				<button data-c_no="${career.c_no }" data-c_nm="${career.c_nm }" data-c_dept="${career.c_dept }" data-c_position="${career.c_position }" data-c_sdt="${career.c_sdt }" data-c_edt="${career.c_edt }" data-c_cont="${career.c_cont }" class="btn btn-outline-primary cupdate">
					<i class="fa fa-edit"></i>
				</button>
				<button data-c_no="${career.c_no }" class="btn btn-outline-secondary cdelete" style="margin-left: 2px;">
					<i class="fa fa-trash"></i>
				</button>
			</div>
		</div>
		<br> <br>
	</div>
</c:forEach>
