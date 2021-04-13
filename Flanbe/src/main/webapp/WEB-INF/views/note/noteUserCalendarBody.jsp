<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href='${cp }/lib/main.css' rel='stylesheet'/>
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
    location.href="${cp}/note/viewOneNote?n_no="+arg.event._def.groupId
    },
    
    editable: true,
    dayMaxEvents: true,
//          dayMaxEvents: true, // allow "more" link when too many events
      //일정전체출력
    events: [
  	  <c:forEach items="${caluserlist}" var="noteuserList" varStatus="status">
  	  {
  		  groupId : '${noteuserList.n_no}',
  		  title : '${noteuserList.n_title}',
  		  textColor : "#000000",
  		  <c:choose>
  		  <c:when test="${noteuserList.n_state == 01}">
  		backgroundColor : "#F7819F",
          </c:when>
  		  <c:when test="${noteuserList.n_state == 02}">
  		backgroundColor : "#A9F5BC",
  	      </c:when>  		
  		  <c:when test="${noteuserList.n_state == 03}">  
  		backgroundColor : "#A4A4A4",
  		  </c:when>
  		  </c:choose>
  		  start : '${noteuserList.n_sdt}',
  		  end : '${noteuserList.n_edt}'
  	  }
  	  
        <c:if test="${status.count != fn:length(caluserlist)}">
        ,
   	  </c:if>
        
  	  </c:forEach>
        ]
    })

    calendar.render();

  });
  

</script>

<script type="text/javascript">
	//문서 로딩이 완료되고 나서 실행되는 영역
	$(function() {
		$(".nuserid").on("click", function() {
			var user = $(this).data("nuserid");
			 location.href="${cp}/note/noteuserCalendar?p_code=${p_code}&user_id=" + user;
		});
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
.demo-topbar + #external-events { /* will get stripped out */
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
  max-width: 950px;
  margin: 20px auto;
  
}
    .fc-col-header-cell .fc-day .fc-day-sun { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */

</style>
<%@ include file="/WEB-INF/views/common/noteSidebar.jsp"%>

<main>
	<div class="container-fluid site-width">

		<div class="col-11 col-sm-11" style="padding-left: 120px;">
			<div class="row">
				<div class="col-11 col-xl-8 mb-10 mb-xl-10"
					style="margin-left: 300px; margin-top: 20px;">
					<div class="card">
						<div class="card-content">
							<div class="card-body" style="margin-left: 5px;">
								<div class="row">
									<div class="col-12">
										<div id='calendar' class="h-100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="col-13 col-sm-2 mt-4">
			<div class="card" style="margin-top: -700px; text-align: center;">
				<div
					class="card-header d-flex justify-content-between align-items-center"
					style="padding-left: 26px;">
					<h4 class="card-title" style="padding-left: 55px;">조원리스트</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<ul class="d-md-flex m-0 pl-0 list-unstyled">
							<li class="pill cl-personal py-1 px-2 mr-md-2 text-center my-1"
								style="background-color: #F7819F; margin-left: 10px">진행예정</li>
							<li class="pill cl-professional py-1 px-2 mr-md-2 text-center my-1"
								style="background-color: #A9F5BC;">진행중</li>
							<li class="pill cl-work py-1 px-2 mr-md-2 text-center my-1"
								style="background-color: #A4A4A4;">완료</li>
						</ul>
						<table class="table" id="caltable">
							<thead>
								<tr>
									<th scope="col">조원 이름</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr class="nuserid" style="height: 50px; cursor: pointer;"
										data-nuserid="${user.user_id }">
										<c:choose>
											<c:when test="${user.purpose  == 'P'}">
												<td>${user.user_nm }</td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
