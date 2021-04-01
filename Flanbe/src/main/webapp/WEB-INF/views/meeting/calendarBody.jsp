
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/common/contractSidebar.jsp"%>

<link href='${cp }/lib/main.css' rel='stylesheet' />
<script src='${cp }/lib/main.js'></script>
<script src='${cp }/lib/locales-all.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale : "ko",      
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      
//       var _left = Math.ceil(( window.screen.width - _width )/2);
//       var _top = Math.ceil(( window.screen.width - _height )/2); 

     //상세정보
    eventClick: function(arg) {
    	
	    $("#calendarList").val(arg.event._def.groupId);
	    window.open("${cp}/contract/viewmeeting?m_no="+arg.event._def.groupId, "PopupWin", "width=500,height=520,left=700,top=280");
    },
    
    editable: true,
    dayMaxEvents: true,
//          dayMaxEvents: true, // allow "more" link when too many events
      //일정전체출력
    events: [
  	  <c:forEach items="${Mtdt}" var="meetingList" varStatus="status">
  	  {
  		  groupId : '${meetingList.m_no}',
  		  title : '${meetingList.p_title}',
  		  start : '${meetingList.mtdtS}'
  	  }
  	  
        <c:if test="${status.count != fn:length(Mtdt)}">
        ,
   	 	</c:if>
        
  	  </c:forEach>
	]
    })

    calendar.render();

  });
  

</script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
}

#external-events {
	position: fixed;
	z-index: 2;
	top: 20px;
	left: 20px;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
}

.demo-topbar+#external-events { /* will get stripped out */
	top: 60px;
}

#external-events .fc-event {
	margin: 1em 0;
	cursor: move;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}

#calendar {
	max-width: 900px;
	margin: 20px auto;
}

.fc-day-number.fc-sat.fc-past {
	color: #0000FF;
} /* 토요일 */
.fc-day-number.fc-sun.fc-past {
	color: #FF0000;
} /* 일요일 */
</style>
<div class="sidebar">
	<div class="site-width">
		<!-- START: Menu-->
		<ul id="side-menu" class="sidebar-menu">
			<li class="dropdown"><a href="#" style="text-align: center; font-size: 15px;">계약 </a></li>
		</ul>
	</div>
	<div class="site-width">
		<ul class="list-unstyled inbox-nav  mb-0 mt-2 notes-menu" id="myTab1" role="tablist">
			<li class="nav-item"><a class="nav-link active" href="${cp }/contract/contractList?p_state=04&user_id=${S_USER.user_id}"> <i class="icon-list">계약 중인 목록 </i>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${cp }/contract/contractList?p_state=06&p_state2=07&p_state3=09&user_id=${S_USER.user_id}"> <i class="icon-star">완료된 계약 목록</i>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <i class="icon-star">일정 등록</i>
			</a></li>
		</ul>
	</div>
</div>
<main>
	<form action="${cp }/project/viewproject" method="get" id="frmView">
		<input type="hidden" id="calendarList" name="m_no">
		<!--          <input type="hidden" name="m_no"> -->
	</form>

	<div class="container-fluid site-width" style="margin-top: 60px;">
		<div class="col-12 col-md-11 mt-3" style="margin-left: 50px;">
			<div class="card-body h-100">
				<div id='calendar' class="h-100"></div>
			</div>
		</div>
	</div>
</main>