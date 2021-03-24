<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="titles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프랜비</title>
	
	<%@ include file="/WEB-INF/views/common/common_css.jsp" %>
</head>
<body>
	<titles:insertAttribute name="header" />
	
	<titles:insertAttribute name="body" />
	
	<titles:insertAttribute name="footer" />
	
	<!-- START: APP JS-->
<%-- 	<script src="${cp }/dist/js/app.js"></script> --%>
	<!-- END: APP JS-->
	<%@ include file="/WEB-INF/views/common/common_js.jsp" %>
</body>
</html>