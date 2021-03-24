<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 스크립트 부분 -->
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
        	alert("파일 불러오기 성공")
        	//성공하면, 그냥 id 만 넣어주면 된다.session 에서 
        	alert("result 확인 : " + result.id)
        	//$('#saveSign').attr("src" , ) 
        	$('#saveSign2').attr("src" , '/sign/viewSign?id=' + result.id ) 
        	//$('#saveSign').attr("src" ,   result.realFileName) 
        },
        error : function(em){
        	alert("오류발생" + em.status)
        }
 
       
    })
    
}

</script>



<main>
	<div class="container-fluid site-width">
		<!-- START: Breadcrumbs-->
		<div class="row ">
			<div class="col-12  align-self-center">
				<div
					class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
					<div class="w-sm-100 mr-auto">
						<h4 class="mb-0">Blank Page</h4>
					</div>

					<ol class="breadcrumb bg-transparent align-self-center m-0 p-0">
						<li class="breadcrumb-item">Home</li>
						<li class="breadcrumb-item">Page</li>
						<li class="breadcrumb-item active"><a href="#">Blank Page</a></li>
					</ol>
				</div>
			</div>
		</div>
		<!-- END: Breadcrumbs-->

		<!-- START: Card Data-->
		<div class="row">
			<div class="col-12  mt-3">
				<div class="card">
					<div
						class="card-header d-flex justify-content-between align-items-center">
						<h4 class="card-title">Heading Here</h4>
					</div>
					<div class="card-body">
						<div class="card  h-100">
							<div
								class="card-header  justify-content-between align-items-center">
								<h4 class="card-title">Live Demo</h4>
							</div>
							<div class="card-body">
								<h2>저장된 사인 이미지 불러오기</h2>
								<img id="saveSign"> <img id="saveSign2" src="">
								<!-- 작동함 -->
								<!-- <img id="saveSign3" src="../image/8220eca3-731d-4e53-a5a6-aba686deaeb4.png" > -->

								<div>
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#exampleModal">
										Launch demo modal</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">서명</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div id="allCanvas"
														style="padding-bottom: 15px; width: 98%;">
														<span style="font-weight: bold;">서명 후 '저장' 버튼을
															클릭해주세요.</span> <br />
														<canvas id="drawCanvas" width="300" height="150"
															style="position: relative; border: 1px solid #000;"></canvas>
														<img id="myImage" style="display: none" /> <br /> <a
															href="#" onclick="onClear();">지우기</a>
														<button type="button" onclick="saveImage();">save
															sign</button>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save
														changes</button>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>



			</div>
			<!-- END: Card DATA-->
		</div>
</main>
