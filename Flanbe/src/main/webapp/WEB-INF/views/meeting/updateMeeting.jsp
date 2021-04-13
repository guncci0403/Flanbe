<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


        <!-- START: Page CSS-->   
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
<script src="${cp }/dist/vendors/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" href="${cp }/dist/vendors/sweetalert/sweetalert.css">

        <link rel="stylesheet" href="${cp }/dist/vendors/fullcalendar/core/main.min.css"> 
        <link rel="stylesheet" href='${cp }/dist/vendors/fullcalendar/daygrid/main.css'/>
        <link rel="stylesheet" href='${cp }/dist/vendors/fullcalendar/timegrid/main.css'/>
        <link rel="stylesheet" href='${cp }/dist/vendors/fullcalendar/list/main.css'/> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
	<c:if test="${msg != null }">
		swal({
			title: "Info",
			text: "${msg}",
			type: "info",
			showCancelButton: false,
			confirmButtonClass: 'btn-info',
			confirmButtonText: '확인',	
			closeOnConfirm: false
		});
	</c:if>
		
		<c:if test="${view.mtway == '01'}">
		$('#mtway').val('${view.mtway}').prop("selected", true);
		</c:if>
		<c:if test="${view.mtway == '02'}">
		$('#mtway').val('${view.mtway}').prop("selected", true);
		</c:if>
		<c:if test="${view.mtway == '03'}">
		$('#mtway').val('${view.mtway}').prop("selected", true);
		</c:if>
		
		 $("#chkmtbtn").click(function(){
			 
        var todayArr = getToday().split('-');
        var mtdtArr = $('#mtdt').val().split('-');
        
        var todayCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
        var mtdtCompare = new Date(mtdtArr[0], parseInt(mtdtArr[1])-1, mtdtArr[2]);
        
        if(todayCompare.getTime() > mtdtCompare.getTime()) {
        	/* alert(${msg});
        	alert("${msg}"); */
        	swal({
            	title: "Info",
            	text: "미팅날짜는 현재 날짜부터 설정 가능합니다.",
            	type: "info",
            	showCancelButton: false,
            	confirmButtonClass: 'btn-info',
            	confirmButtonText: '확인',	
            	closeOnConfirm: false
            });
            return false;
        }
        
        var m_no = '${view.m_no}';
        var mtdt =  $("#mtdt").val();
        var mtway = $("#mtway").val();
        $.ajax({
            url: '${cp}/contract/updatemeeting',
            type: 'post',
            data: {"m_no": m_no, "mtdt": mtdt, "mtway": mtway},
            dataType: 'json',
            success:function(data){
            	
            	window.open("about:blank", "_self").close();
            	opener.location.href = "${cp}/contract/calendar";

            }
        }); 
	});
		 
	})
function getToday(){
      
     var date = new Date();
     var year = date.getFullYear();
     var month = ("0" + (1 + date.getMonth())).slice(-2);
     var day = ("0" + date.getDate()).slice(-2);

     return year + "-" + month + "-" + day;
}
</script>
</head>
<body>
<div class="modal-content">
<%--            <form action="${cp}/meeting/updatemeeting" method="post"> --%>
		  <form id="form_chk" role="form">
          <input type="hidden" name="m_no" value="${view.m_no }">
    <div class="modal-header">      
        <h4 class="modal-title" id="model-header">${view.p_title }</h4>
    </div>
    <div class="modal-body">

            <div class="row">

                <div class="col-md-6 col-sm-6 col-12">
                    <div class="form-group start-date">
                        <label for="start-date" class="">미팅날짜</label>
                        <div class="d-flex">
                            <input id="mtdt" value="${view.mtdtS }" name="mtdt" class="form-control flatpickr-input" type="date">
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-12">
                    <div class="form-group end-date">
                        <label for="end-date" class="">미팅방식</label>
                        <div class="form-group">
                         <select class="form-control col-sm-4" name="mtway" id="mtway">
                            <option value="01">전화</option>
                            <option value="02">화상</option>
                            <option value="03">대면</option>
                         </select>
                        </div>
                    </div>
                </div>
            </div>
    	</div>
    <c:choose>
    <c:when test="${S_USER.purpose == 'C'}">
    <div class="modal-footer">
        <button type="button" id="chkmtbtn" class="btn btn-primary eventbutton">수정완료</button>
    </div>
    </c:when>
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