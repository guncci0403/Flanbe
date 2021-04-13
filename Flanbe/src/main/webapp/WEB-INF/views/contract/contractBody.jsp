<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>

<%@ include file="/WEB-INF/views/common/projectSidebar.jsp" %>

<script>
      //문서 로딩이 완료되고 나서 실행되는 영역
      $(function(){
         $('#summernote3').summernote({
            height:300,width:1000,
             popover: {
                 image:[],
                 link:[],
                 air:[]
              },
            toolbar: []
         });
         
        $("#saveSign").on('click', function() {
        	saveImage();
        })
        		 
		$("#contract").on("click", function(){
			$('#cont').val($('#summernote3').val());
			$("#c_money").val($("#money").val());
			$("#insertCon").submit();
		});

      })
</script>
<script type="text/javascript">
if (window.addEventListener) {
	<!-- 아래 initEvent함수 존재 -->
	<!-- addEventListener: 지정한 이벤트가 대상에 전달될떄에만 호출 -->
	window.addEventListener('load', InitEvent, false);
}
var canvas, context, tool;
function InitEvent() {
	
    canvas = document.getElementById('drawCanvas');
    if (!canvas) {
	alert("캔버스화면을 찾을 수 없습니다. 다시 시도 해 주세요");
	return;
    }
    if (!canvas.getContext) {
	alert("Drawing Contextf를 찾을 수 없음");
	return;
    }
    context = canvas.getContext('2d');
    if (!context) {
	alert("getContext() 함수를 호출 할 수 없음");
	return;
    }
    // Pencil tool 객체를 생성 한다.
    tool = new tool_pencil();
    canvas.addEventListener('mousedown', ev_canvas, false);
    canvas.addEventListener('mousemove', ev_canvas, false);
    canvas.addEventListener('mouseup', ev_canvas, false);
    canvas.addEventListener('touchstart', ev_canvas, false);
    canvas.addEventListener('touchmove', ev_canvas, false);
    canvas.addEventListener('touchend', ev_canvas, false);
}
function tool_pencil() {
    var tool = this;
    this.started = false;

    // 마우스를 누르는 순간 그리기 작업을 시작 한다. 
    this.mousedown = function (ev) {
	context.beginPath();
	context.moveTo(ev._x, ev._y);
	tool.started = true;
    };
    // 마우스가 이동하는 동안 계속 호출하여 Canvas에 Line을 그려 나간다
    this.mousemove = function (ev) {
	if (tool.started) {
	    context.lineTo(ev._x, ev._y);
	    context.stroke();
	}
    };
    // 마우스 떼면 그리기 작업을 중단한다
    this.mouseup = function (ev) {
	if (tool.started) {
	    tool.mousemove(ev);
	    tool.started = false;
	}
    };

    // 마우스를 누르는 순간 그리기 작업을 시작 한다. 
    this.touchstart = function (ev) {
	context.beginPath();
	context.moveTo(ev._x, ev._y);
	tool.started = true;
    };
    // 마우스가 이동하는 동안 계속 호출하여 Canvas에 Line을 그려 나간다
    this.touchmove = function (ev) {
	if (tool.started) {
	    context.lineTo(ev._x, ev._y);
	    context.stroke();
	}
    };
    // 마우스 떼면 그리기 작업을 중단한다
    this.touchend = function (ev) {
	if (tool.started) {
	    tool.touchmove(ev);
	    tool.started = false;
	}
    };
}
// Canvas요소 내의 좌표를 결정 한다.
function ev_canvas(ev) {
    if (ev.layerX || ev.layerX == 0) { // Firefox 브라우저
	ev._x = ev.layerX;
	ev._y = ev.layerY;
    }
    else if (ev.offsetX || ev.offsetX == 0) { // Opera 브라우저
	ev._x = ev.offsetX;
	ev._y = ev.offsetY;
    }
    else if (ev.targetTouches[0] || ev.targetTouches[0].pageX == 0) {	//핸드폰
	var left = 0;
	var top = 0;
	var elem = document.getElementById('drawCanvas');

	while (elem) {
	    left = left + parseInt(elem.offsetLeft);
	    top = top + parseInt(elem.offsetTop);
	    elem = elem.offsetParent;
	}

	ev._x = ev.targetTouches[0].pageX - left;
	ev._y = ev.targetTouches[0].pageY - top;
    }
    // tool의 이벤트 핸들러를 호출한다.
    var func = tool[ev.type];
    if (func) {
	func(ev);
    }
}

function onClear() {
    canvas = document.getElementById('drawCanvas');
    context.save();
	context.setTransform(1, 0, 0, 1, 0, 0);
	context.clearRect(0, 0, canvas.width, canvas.height);
	context.restore();
}

<!--  이미지 캔버스 저장--> 
function saveImage(){
	<!-- blob 객체에 디코딩한 base64 데이터 값을 FormData()에 담음 -->
	<!-- atob()메소드와 Uint8Array객체는 모든 구식 브라우저에서완벽 구동을 보장하지 않는다.-->
	var $canvas = document.getElementById('drawCanvas');
	console.log('$canvas 찍어보자'+ $canvas)
	var imgDataUrl = $canvas.toDataURL('image/png');
	var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
    var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }
    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
   	var fileName = 'canvas_img_' + new Date().getMilliseconds() + '.png';
    formdata.append("file", file , fileName);	// file data 추가
    
    //processData 옵션을 false 으로 명시하지 않으면 FormData 에 추가한 파일 데이터가 string 값으로 자동 변환되어 전송
    $.ajax({
        type : 'post',
        url : '/sign/saveSign',
        enctype: 'multipart/form-data',
        data : formdata,
        cache : false,
        processData : false,	// data 파라미터 강제 string 변환 방지!!
        contentType : false,	// application/x-www-form-urlencoded; 방지!!
        dataType : "json",
        success : function (result) {
        	//성공하면, 그냥 id 만 넣어주면 된다.session 에서 
        	//$('#saveSign').attr("src" , ) 
        	$('#cSign').attr("src" , '/sign/viewSign?id=' + result.user_id ) 
        	//$('#saveSign').attr("src" ,   result.realFileName) 
        	$('#signmodal').modal('hide');
        },
        error : function(em){
        	alert("오류발생" + em.status)
        }
 
       
    })
    
}

</script>

<form id="insertCon" action="${cp }/contract/insertContract" method="POST">
	<input type="hidden" name="p_code" value="${pVo.p_code }"/>
	<input type="hidden" name="user_id" value="${pVo.user_id }"/>
	<input type="hidden" name="puser_id" value="${partner.user_id }"/>
	<input type="hidden" name="c_sdt" value="<fmt:formatDate value="${pVo.p_sdt }" pattern="yyyy.MM.dd" />" />
	<input type="hidden" name="c_edt" value="<fmt:formatDate value="${pVo.p_edt }" pattern="yyyy.MM.dd" />" />
	<input type="hidden" id="cont" name="con_cont" value="" />
	<input type="hidden" id="c_money" name="c_money" value="" />
</form>

<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<br>
		<div class="row">
			<div class="col-8 mt-4">
				<div class="card"><br><br>
					<h3 class="card-title" style="text-align: center;">프로젝트 계약서</h3>
					<div class="card-content">
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<br>
									<form>
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th colspan="1" style="text-align: center;">프로젝트명</th>
														<td colspan="3" align="center">${pVo.p_title }</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th colspan="1" style="text-align: center;">클라이언트</th>
														<td colspan="3" align="center">${client.user_nm }</td>
													</tr>
													<tr>
														<th rowspan="1" style="text-align: center;">파트너스</th>
														<td colspan="3" align="center">${partner.user_nm}</td>
													</tr>
													<tr>
														<th rowspan="1" style="text-align: center;">계약금액</th>
														<td colspan="3" align="center"><input type="text" id="money"></td>
													</tr>
													<tr>
														<th scope="row" style="text-align: center;">프로젝트 기간</th>
														<td align="center">시작일 : <fmt:formatDate value="${pVo.p_sdt }" pattern="yyyy.MM.dd" /></td>
														<td align="center">종료일 : <fmt:formatDate value="${pVo.p_edt }" pattern="yyyy.MM.dd" /></td>
													</tr>
													<tr>
														<th colspan="4" style="text-align: center;">프로젝트 계약 내용</th>
													</tr>
													<tr>
														<td colspan="3"><textarea id="summernote3" name="summernote">
														<pre style="font-size: 12px; font-family: unset;">
계약건명 :

계약기간 :
														
주식회사 ㅇㅇㅇ(이하'갑')와 ㅇㅇㅇㅇ(이하'을')은 건의 작업을 위하여 다음과 같이 계약을 체결한다.

제 1조 (목적)
"갑"이 "을"에게 의뢰한           용역을 효과적으로 진행하기 위한 범위와 규정을 목적으로 한다.

제 2조 (범위)
"을"은 "갑"의 작업 범위에 대해 다음의 내용을 수행한다.
 가.
 나.
 다.

제 3조 (계약기간 및 계약금액)
본 계약은 ㅇㅇㅇㅇ년 ㅇ월 ㅇ일 부터 ㅇㅇㅇㅇ년 ㅇ월 ㅇ일까지로 하며, 본 계약 내용의 총 계약 금액은 영만 원으로 계약 시
총 계약 금액의 30%, 작업 완료 납품과 동시에 잔금 70%를 "갑"은 "을"에게 지급하기로 한다.

제 4조 (납품)
"을"은 작업 진행 중 중간 완료된 성과물을 ㅇ일,ㅇ일 등 3회에 걸쳐서 중간 납품을 하기로 하며,
최종 납품은 검토 및 수저 후 완성품으로 ㅇㅇ(디스켓 등)으로 납품키로 한다.

제 5조 (자료제공)
"갑"은 "을"이 작업하는데 필요한 일체의 자료를 제공하기로 한다.

제 6조 (비밀 유지)
"을"은 작업과 관련된 일체의 정보를 외부에 누설하거나 유출해서는 안되며 이로 인해 발생되는 모든 책임은 "을"이 진다.
														</pre>
														
														
														
														</textarea></td>
													</tr>
												</tbody>
											</table>
										</div>
										<button type="button" id="contract" class="btn btn-primary">작성완료</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3 col-xl-2">
				<div class="card mb-2" style="margin-top: 25px;">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h4 class="card-title">클라이언트 사인</h4>
						<button type="button" class="btn btn-primary" id="signup" data-toggle="modal" data-target="#signmodal">
							<span>서명</span>
						</button>
					</div>
					<div class="card-body">
						<div class="media d-block d-sm-flex text-center text-sm-left mb-4">
							<div class="media-body align-self-center redial-line-height-1_5">
								<img id="cSign" class="user-image img-fluid" style="width: 300px; height: 150px;">
							</div>
						</div>
					</div>
				</div>
				<!-- 			</div> -->
				<!-- 			<div class="col-12 col-xl-2" style=" margin-left: 1245px; margin-top: -740px;"> -->
				<div class="card mb-2" style="margin-top: 50px;">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h4 class="card-title">파트너스 사인</h4>
					</div>
					<div class="card-body">
						<div class="media d-block d-sm-flex text-center text-sm-left mb-4">
							<div class="media-body align-self-center redial-line-height-1_5">
<!-- 								<h6 class="my-2 my-sm-0 redial-line-height-1_5 mb-xl-2">사인하는곳</h6> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body">
		<!-- Modal -->
		<div class="modal fade" id="signmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true" style="display: none;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">서명</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="allCanvas" style="padding-bottom: 15px; width: 98%;">
							<span style="font-weight: bold;">서명 후 '저장' 버튼을 클릭해주세요.</span> <br />
							<canvas id="drawCanvas" width="300" height="150" style="position: relative; border: 1px solid #000;"></canvas>
							<img id="myImage" style="display: none" /> <br /> <a href="#" onclick="onClear();">지우기</a>
<!-- 							<button type="button" onclick="saveImage();">save sign</button> -->
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="saveSign" class="btn btn-primary">저장하기</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</main>