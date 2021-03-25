<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
{
	"msg" : "${msg}",
	"body" : "<h6 class='p5-content-title'>자기소개</h6><div class='p5-description-hasvalue'><c:choose><c:when test='${user.intro == null}'>등록된 '자기 소개'가 없습니다.</c:when><c:otherwise><input type='hidden' id='introCont' value='${user.intro }'>${user.intro }</c:otherwise></c:choose></div>"
}
--%>

<input type="hidden" id="msg" value="${msg }">


<h6 class="p5-content-title">자기소개</h6>
<div class="p5-description-hasvalue">
	<c:choose>
		<c:when test="${user.intro == null}">
			<div class="p5-assign-component" style="display: table; width: 100%; height: 100%; text-align: center; margin: 0 auto;">
				<div style="display: table-cell; vertical-align: middle;">
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${cp }/images/profile_introduction.png" style="vertical-align: middle;">
						<p class="p5-no-partners-info-text" style="margin-top: 15px; margin-bottom: 0; color: #999 !important; line-height: 1;">
							등록된 <span class="text-center p5-bold" style="font-weight: bold;">'자기 소개'</span>가 없습니다.
						</p>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<input type="hidden" id="introCont" value="${user.intro }">
			${user.intro }
		</c:otherwise>
	</c:choose>
</div>
