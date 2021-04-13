<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${cp }/dist/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${cp }/dist/vendors/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="${cp }/dist/vendors/jquery-ui/jquery-ui.theme.min.css">
<link rel="stylesheet" href="${cp }/dist/vendors/simple-line-icons/css/simple-line-icons.css">        
<link rel="stylesheet" href="${cp }/dist/vendors/flags-icon/css/flag-icon.min.css">
<link rel="stylesheet" href="${cp}/dist/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${cp}/dist/vendors/social-button/bootstrap-social.css">

<script src="${cp }/dist/vendors/jquery/jquery-3.3.1.min.js"></script> 
<script src="${cp }/dist/vendors/jquery-ui/jquery-ui.min.js"></script>
<script src="${cp }/dist/vendors/moment/moment.js"></script>
<script src="${cp }/dist/vendors/bootstrap/js/bootstrap.bundle.min.js"></script>    
<script src="${cp }/dist/vendors/slimscroll/jquery.slimscroll.min.js"></script>

<link rel="stylesheet" href="${cp }/dist/vendors/fullcalendar/core/main.min.css"> 
<link rel="stylesheet" href='${cp }/dist/vendors/fullcalendar/daygrid/main.css'/>
<link rel="stylesheet" href='${cp }/dist/vendors/fullcalendar/timegrid/main.css'/>
<link rel="stylesheet" href='${cp }/dist/vendors/fullcalendar/list/main.css'/> 
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script src="${cp }/jacktrip-webrtc-master/client/public/js/room/index.js" charset="utf-8"></script>
<script>
//회의방 생성 팝업 이벤트
	function myFunction() {
	   var windowpopup;
	   
	   var popupWidth = 890;
	   var popupHeight = 408;
	   var popupX = (window.screen.width / 2) - (popupWidth / 2);  //만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
	   var popupY= (window.screen.height / 2) - (popupHeight / 2);
	   
	   window.open('https://192.168.0.107:44300','windowpopup', 
	            'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	} 
	$(function() {
	    $("#updatemeetingbtn").on("click", function(){
			$("#meetingform").attr("method", "get");
			$("#meetingform").attr("action", "${cp}/contract/updatemeeting");
			$("#meetingform").submit();
		});		
	})
	
</script>        
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal-content">
          <form id="meetingform" role="form">
          <input type="hidden" name="m_no" value="${view.m_no }">
    <div class="modal-header">      
        <h4 class="modal-title" id="model-header">${view.p_title }</h4>
    </div>
    <div class="modal-body">

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="start-date" class="">클라이언트</label>
                        <div class="d-flex event-title">
                            <input id="ctn_id" type="text" value="${view.ctn_nm }" class="form-control flatpickr-input" name="ctn_id"  readonly="readonly">
                        </div>
                    </div>
                </div>
                
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="start-date" class="">파트너스</label>
                        <div class="d-flex event-title">
                            <input id="ctn_id" type="text" value="${view.ptn_nm }" class="form-control flatpickr-input" name="ctn_id"  readonly="readonly">
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 col-12">
                    <div class="form-group start-date">
                        <label for="start-date" class="">미팅날짜</label>
                        <div class="d-flex">
                            <input id="mtdtS" name="mtdt" value="${view.mtdtS }" class="form-control flatpickr-input" type="text" readonly="readonly">
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-12">
                    <div class="form-group end-date">
                        <label for="end-date" class="">미팅방식</label>
                        <div class="d-flex">
                        <c:choose>
                        <c:when test="${view.mtway == '01' }">
                            <input id="end-date" name="mtway" placeholder="전화" type="text" class="form-control flatpickr-input" readonly="readonly">
                        </c:when>
                        <c:when test="${view.mtway == '02' }">
                            <input id="end-date" name="mtway" placeholder="화상" type="text" class="form-control flatpickr-input" readonly="readonly">
                        </c:when>
                        <c:when test="${view.mtway == '03' }">
                            <input id="end-date" name="mtway" placeholder="대면" type="text" class="form-control flatpickr-input" readonly="readonly">
                        </c:when>                                                
                        </c:choose>
                        </div>
                    </div>
                </div>
            </div>
    	</div>
    <c:choose>
    <c:when test="${S_USER.purpose == 'C'}">
	    <div class="modal-footer">
	        <button type="button" id="windowpopup" class="btn btn-primary" onclick="myFunction()">회의방 생성</button>
	        <button id="updatemeetingbtn" class="btn btn-primary eventbutton">수정</button>
	    </div>
    </c:when>
    <c:otherwise>
	    <div class="modal-footer">
	    	<button class="btn btn-primary" onclick="window.open('https://192.168.0.107:44300/room/asas')">회의 참가</button>
	   	</div>
    </c:otherwise>
    </c:choose>
      		  </form>
</div>
</body>
        <script src="${cp }/dist/vendors/popper/popper.min.js"></script>
        <script src="${cp }/dist/vendors/tooltip/tooltip-min.js"></script>
        <script src="${cp }/dist/vendors/fullcalendar/core/main.min.js"></script>        
        <script src='${cp }/dist/vendors/fullcalendar/interaction/main.js'></script>
        <script src='${cp }/dist/vendors/fullcalendar/daygrid/main.js'></script>
        <script src='${cp }/dist/vendors/fullcalendar/timegrid/main.js'></script>
        <script src='${cp }/dist/vendors/fullcalendar/list/main.js'></script>
        <script src="${cp }/dist/vendors/fullcalendar/bundle/moment.min.js"></script>  
        <script src="${cp }/dist/js/calendar.script.js"></script>
</html>