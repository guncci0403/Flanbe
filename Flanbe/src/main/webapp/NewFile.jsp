<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>동기</title>
        <link rel="shortcut icon" href="dist/images/favicon.ico" />
        <meta name="viewport" content="width=device-width,initial-scale=1">

		<%@ include file="/WEB-INF/views/common/common_css.jsp" %>
		
        <!-- START: Page CSS-->
        <link rel="stylesheet"  href="${cp }/dist/vendors/chartjs/Chart.min.css">
        <!-- END: Page CSS-->

        <!-- START: Page CSS-->
        <link rel="stylesheet" href="${cp }/dist/vendors/morris/morris.css">
        <link rel="stylesheet" href="${cp }/dist/vendors/weather-icons/css/pe-icon-set-weather.min.css">
        <link rel="stylesheet" href="${cp }/dist/vendors/chartjs/Chart.min.css">
        <link rel="stylesheet" href="${cp }/dist/vendors/starrr/starrr.css">
        <link rel="stylesheet" href="${cp }/dist/vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="${cp }/dist/vendors/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="${cp }/dist/vendors/jquery-jvectormap/jquery-jvectormap-2.0.3.css">
        <!-- END: Page CSS-->

        <!-- START: Custom CSS-->
        <link rel="stylesheet" href="${cp }/dist/css/main.css">
        <!-- END: Custom CSS-->
    </head>
    <!-- END Head-->

    <!-- START: Body-->
    <body id="main-container" class="default">

        <!-- START: Pre Loader-->
        <div class="se-pre-con">
            <div class="loader"></div>
        </div>
        <!-- END: Pre Loader-->

        <!-- START: Header-->
        <div id="header-fix" class="header fixed-top">
            <div class="site-width">
                <nav class="navbar navbar-expand-xl  p-0">
                    <div class="navbar-header  h-100 h4 mb-0 align-self-center logo-bar text-left">
                        <a href="index.html" class="horizontal-logo text-left">
                            <span class="h4 font-weight-bold align-self-center mb-0"> 프랜비 </span>
                        </a>
                    </div>
                    <div class="navbar-header h4 mb-0 text-center h-100 collapse-menu-bar">
                        <a href="#" class="sidebarCollapse" id="collapse"><i class="icon-menu"></i></a>
                    </div>
			
				  <div class="navbar-collapse collapse" id="navbarsExample05" style="">
				    <ul class="navbar-nav mr-auto">
				      <li class="nav-item active">
				        <a class="nav-link p-3" href="#"> <i class="icon-rocket"></i> 프로젝트 관리 </a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link p-3" href="#"> <i class="icon-layers"></i> 프로젝트 찾기 </a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link p-3" href="#"> <i class="icon-picture"></i> 파트너스 찾기 </a>
				      </li>
				      <li class="nav-item dropdown">
				        <a class="nav-link p-3" href="#"> <i class="icon-plus"></i> 프랜비 소식 </a>
				      </li>
				    </ul>
				    <div class="navbar-right ml-auto h-100">
                        <ul class="ml-auto p-0 m-0 list-unstyled d-flex top-icon h-100">
                            <li class="dropdown align-self-center">
                                <a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false"><i class="icon-reload h4"></i>
                                    <span class="badge badge-default"> <span class="ring">
                                        </span><span class="ring-point">
                                        </span> </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right border  py-0">
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0">john</p>
                                                    <span class="text-success">New user registered.</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author2.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0">Peter</p>
                                                    <span class="text-success">Server #12 overloaded.</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author3.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0">Bill</p>
                                                    <span class="text-danger">Application error.</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>

                                    <li><a class="dropdown-item text-center py-2" href="#"> See All Tasks <i class="icon-arrow-right pl-2 small"></i></a></li>
                                </ul>

                            </li>
                            <li class="dropdown align-self-center d-inline-block">
                                <a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false"><i class="icon-bell h4"></i>
                                    <span class="badge badge-default"> <span class="ring">
                                        </span><span class="ring-point">
                                        </span> </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right border   py-0">
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle w-50">
                                                <div class="media-body">
                                                    <p class="mb-0 text-success">john send a message</p>
                                                    12 min ago
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author2.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0 text-danger">Peter send a message</p>
                                                    15 min ago
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author3.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0 text-warning">Bill send a message</p>
                                                    5 min ago
                                                </div>
                                            </div>
                                        </a>
                                    </li>

                                    <li><a class="dropdown-item text-center py-2" href="#"> Read All Message <i class="icon-arrow-right pl-2 small"></i></a></li>
                                </ul>
                            </li>
                            <li class="dropdown user-profile align-self-center d-inline-block">
                                <a href="#" class="nav-link py-0" data-toggle="dropdown" aria-expanded="false">
                                    <div class="media">
                                        <img src="dist/images/author.jpg" alt="" class="d-flex img-fluid rounded-circle" width="29">
                                    </div>
                                </a>

                                <div class="dropdown-menu border dropdown-menu-right p-0">
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-pencil mr-2 h6 mb-0"></span> Edit Profile</a>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-user mr-2 h6 mb-0"></span> View Profile</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-support mr-2 h6  mb-0"></span> Help Center</a>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-globe mr-2 h6 mb-0"></span> Forum</a>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-settings mr-2 h6 mb-0"></span> Account Settings</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="" class="dropdown-item px-2 text-danger align-self-center d-flex">
                                        <span class="icon-logout mr-2 h6  mb-0"></span> Sign Out</a>
                                </div>

                            </li>

                        </ul>
                    </div>
				   
				  </div>
			</nav>
                <!-- <nav class="navbar navbar-expand-lg  p-0">
                    <div class="navbar-header  h-100 h4 mb-0 align-self-center logo-bar text-left">
                        <a href="index.html" class="horizontal-logo text-left">
                            <span class="h4 font-weight-bold align-self-center mb-0 ml-auto">PICK</span>
                        </a>
                    </div>
                    <div class="navbar-header h4 mb-0 text-center h-100 collapse-menu-bar">
                        <a href="#" class="sidebarCollapse" id="collapse"><i class="icon-menu"></i></a>
                    </div>

                    <div class="navbar">
                    	<a href="">프로젝트 관리</a>
                    	<a href="">프로젝트 찾기</a>
                    	<a href="">파트너스 찾기</a>
                    	<a href="">프랜비 소식</a>
                    </div>
                    <div class="navbar-right ml-auto h-100">
                        <ul class="ml-auto p-0 m-0 list-unstyled d-flex top-icon h-100">
                            <li class="dropdown align-self-center">
                                <a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false"><i class="icon-reload h4"></i>
                                    <span class="badge badge-default"> <span class="ring">
                                        </span><span class="ring-point">
                                        </span> </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right border  py-0">
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0">john</p>
                                                    <span class="text-success">New user registered.</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author2.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0">Peter</p>
                                                    <span class="text-success">Server #12 overloaded.</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author3.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0">Bill</p>
                                                    <span class="text-danger">Application error.</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>

                                    <li><a class="dropdown-item text-center py-2" href="#"> See All Tasks <i class="icon-arrow-right pl-2 small"></i></a></li>
                                </ul>

                            </li>
                            <li class="dropdown align-self-center d-inline-block">
                                <a href="#" class="nav-link" data-toggle="dropdown" aria-expanded="false"><i class="icon-bell h4"></i>
                                    <span class="badge badge-default"> <span class="ring">
                                        </span><span class="ring-point">
                                        </span> </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right border   py-0">
                                    <li>
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle w-50">
                                                <div class="media-body">
                                                    <p class="mb-0 text-success">john send a message</p>
                                                    12 min ago
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author2.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0 text-danger">Peter send a message</p>
                                                    15 min ago
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item px-2 py-2 border border-top-0 border-left-0 border-right-0" href="#">
                                            <div class="media">
                                                <img src="dist/images/author3.jpg" alt="" class="d-flex mr-3 img-fluid rounded-circle">
                                                <div class="media-body">
                                                    <p class="mb-0 text-warning">Bill send a message</p>
                                                    5 min ago
                                                </div>
                                            </div>
                                        </a>
                                    </li>

                                    <li><a class="dropdown-item text-center py-2" href="#"> Read All Message <i class="icon-arrow-right pl-2 small"></i></a></li>
                                </ul>
                            </li>
                            <li class="dropdown user-profile align-self-center d-inline-block">
                                <a href="#" class="nav-link py-0" data-toggle="dropdown" aria-expanded="false">
                                    <div class="media">
                                        <img src="dist/images/author.jpg" alt="" class="d-flex img-fluid rounded-circle" width="29">
                                    </div>
                                </a>

                                <div class="dropdown-menu border dropdown-menu-right p-0">
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-pencil mr-2 h6 mb-0"></span> Edit Profile</a>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-user mr-2 h6 mb-0"></span> View Profile</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-support mr-2 h6  mb-0"></span> Help Center</a>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-globe mr-2 h6 mb-0"></span> Forum</a>
                                    <a href="" class="dropdown-item px-2 align-self-center d-flex">
                                        <span class="icon-settings mr-2 h6 mb-0"></span> Account Settings</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="" class="dropdown-item px-2 text-danger align-self-center d-flex">
                                        <span class="icon-logout mr-2 h6  mb-0"></span> Sign Out</a>
                                </div>

                            </li>

                        </ul>
                    </div>
                </nav>  -->
            </div>
        </div>
        <!-- END: Header-->

        <!-- START: Main Menu-->
        <div class="sidebar">
            <div class="site-width">

                <!-- START: Menu-->
                <ul id="side-menu" class="sidebar-menu">
                    <li class="dropdown"><a href="#"><i class="icon-home mr-1"></i> Dashboard</a>
                        <ul>
                            <li><a href="index.html"><i class="icon-rocket"></i> Dashboard</a></li>
                            <li><a href="index-account.html"><i class="icon-layers"></i> Account</a></li>
                            <li><a href="index-analytic.html"><i class="icon-grid"></i> Analytic</a></li>
                            <li><a href="index-covid.html"><i class="icon-earphones"></i> COVID</a></li>
                            <li><a href="index-crypto.html"><i class="icon-support"></i> Crypto</a></li>
                            <li><a href="index-ecommerce.html"><i class="icon-briefcase"></i> Ecommerce</a></li>
                        </ul>
                    </li>
                     <li class="dropdown active"><a href="#"><i class="icon-organization mr-1"></i> Layout</a>
                        <ul>
                            <li class="dropdown"><a href="#"><i class="icon-options"></i>Horizontal</a>
                                <ul class="sub-menu">
                                    <li><a href="layout-horizontal.html"><i class="icon-energy"></i> Light</a></li>
                                    <li><a href="layout-horizontal-semidark.html"><i class="icon-disc"></i> Semi Dark</a></li>
                                    <li><a href="layout-horizontal-dark.html"><i class="icon-frame"></i> Dark</a></li>
                                </ul>
                            </li>
                            <li class="dropdown active"><a href="#"><i class="icon-options-vertical"></i>Vertical</a>
                                <ul class="sub-menu">
                                    <li class="active"><a href="layout-vertical.html"><i class="icon-energy"></i> Light</a></li>
                                    <li><a href="layout-vertical-semidark.html"><i class="icon-disc"></i> Semi Dark</a></li>
                                    <li><a href="layout-vertical-dark.html"><i class="icon-frame"></i> Dark</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><i class="icon-grid"></i>Compact Menu</a>
                                <ul class="sub-menu">
                                    <li><a href="layout-compact.html"><i class="icon-energy"></i> Light</a></li>
                                    <li><a href="layout-compact-semidark.html"><i class="icon-disc"></i> Semi Dark</a></li>
                                    <li><a href="layout-compact-dark.html"><i class="icon-frame"></i> Dark</a></li>
                                </ul>
                            </li>
                           
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#"><i class="icon-layers mr-1"></i> Web Apps</a>
                        <ul>
                            <li><a href="app-calendar.html"><i class="icon-calendar"></i> Calendar</a></li>
                            <li><a href="app-chat.html"><i class="icon-speech"></i> Chats</a></li>
                            <li><a href="app-to-do.html"><i class="icon-support"></i> Todo</a></li>
                            <li><a href="app-mail.html"><i class="icon-envelope"></i>Mailapp</a></li>
                            <li><a href="app-filemanager.html"><i class="icon-folder"></i> File Manager</a></li>
                            <li><a href="app-contactlist.html"><i class="icon-people"></i> Contact List</a></li>
                            <li><a href="app-taskboard.html"><i class="icon-event"></i> Task Board</a></li>
                            <li><a href="app-notes.html"><i class="icon-tag"></i> Notes</a></li>
                            <li><a href="app-invoicelist.html"><i class="icon-book-open"></i> Invoices</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#"><i class="icon-cursor mr-1"></i> Elements</a>
                        <ul>
                            <li class="dropdown"><a href="#"><i class="icon-chart"></i>Charts</a>
                                <ul class="sub-menu">
                                    <li><a href="chart-morris.html"><i class="icon-energy"></i> Morris Chart</a></li>
                                    <li><a href="chart-chartist.html"><i class="icon-disc"></i> Chartist js</a></li>
                                    <li><a href="chart-echart.html"><i class="icon-frame"></i> eCharts</a></li>
                                    <li><a href="chart-flot.html"><i class="icon-fire"></i> Flot Chart</a></li>
                                    <li><a href="chart-knob.html"><i class="icon-shuffle"></i> Knob Chart</a></li>
                                    <li class="dropdown"><a href="#" class="d-flex align-items-center"><i class="icon-control-pause"></i> Charts js</a>
                                        <ul class="sub-menu">
                                            <li><a href="chartjs-bar.html"><i class="icon-energy"></i> Bar charts</a></li>
                                            <li><a href="chartjs-line.html"><i class="icon-disc"></i> Line charts</a></li>
                                            <li><a href="chartjs-area.html"><i class="icon-frame"></i> Area charts</a></li>
                                            <li><a href="chartjs-other.html"><i class="icon-fire"></i> Doughnut, Pie, Polar charts</a></li>
                                            <li><a href="chartjs-linear.html"><i class="icon-shuffle"></i> Linear scale</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="chart-sparkline.html"><i class="icon-graph"></i> Sparkline Chart</a></li>
                                    <li><a href="chart-peity.html"><i class="icon-pie-chart"></i> Peity Chart</a></li>
                                    <li><a href="chart-google.html"><i class="icon-drawer"></i> Google Charts</a></li>
                                    <li><a href="chart-apex.html"><i class="icon-magnet"></i> Apex Charts</a></li>
                                    <li><a href="chart-c3.html"><i class="icon-hourglass"></i> C3 Charts</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><i class="icon-film"></i>Form</a>
                                <ul class="sub-menu">
                                    <li><a href="form-basic.html"><i class="icon-disc"></i> Basic Form</a></li>
                                    <li><a href="form-layout.html"><i class="icon-cursor-move"></i> Form Layout</a></li>
                                    <li><a href="form-validation.html"><i class="icon-star"></i> Form Validation</a></li>
                                    <li class="dropdown"><a href="#" class="d-flex align-items-center"><i class="icon-film"></i> Form Elements</a>
                                        <ul class="sub-menu">
                                            <li><a href="form-elements-switch.html"><i class="icon-energy"></i> Switch</a></li>
                                            <li><a href="form-elements-checkbox.html"><i class="icon-disc"></i> Checkbox</a></li>
                                            <li><a href="form-elements-radiobutton.html"><i class="icon-frame"></i> Radio</a></li>
                                            <li><a href="form-elements-input.html"><i class="icon-fire"></i> Input</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="form-float-input.html"><i class="icon-symbol-male"></i> Float Input</a></li>
                                    <li><a href="form-wizard.html"><i class="icon-loop"></i> Form Wizards</a></li>
                                    <li><a href="form-upload.html"><i class="icon-pin"></i> Form Uploads</a></li>
                                    <li><a href="form-mask.html"><i class="icon-check"></i> Form Mask</a></li>
                                    <li><a href="form-dropzone.html"><i class="icon-present"></i> Form Dropzone</a></li>
                                    <li><a href="form-icheck.html"><i class="icon-briefcase"></i> Icheck Controls</a></li>
                                    <li><a href="form-cropper.html"><i class="icon-hourglass"></i> Image Cropper</a></li>
                                    <li><a href="form-htmleditor.html"><i class="icon-graduation"></i> HTML5 Editor</a></li>
                                    <li><a href="form-typehead.html"><i class="icon-puzzle"></i> Form Typehead</a></li>
                                    <li><a href="form-xeditable.html"><i class="icon-cloud-upload"></i> Xeditable</a></li>
                                    <li><a href="form-summernote.html"><i class="icon-ghost"></i> Summernote</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><i class="icon-menu"></i>Tables</a>
                                <ul class="sub-menu">
                                    <li><a href="table-basic.html"><i class="icon-grid"></i> Table Basic</a></li>
                                    <li><a href="table-layout.html"><i class="icon-layers"></i> Table Layout</a></li>
                                    <li><a href="table-datatable.html"><i class="icon-docs"></i> Datatable</a></li>
                                    <li><a href="table-footable.html"><i class="icon-wallet"></i> Footable</a></li>
                                    <li><a href="table-jsgrid.html"><i class="icon-folder"></i> Jsgrid</a></li>
                                    <li><a href="table-responsive.html"><i class="icon-control-pause"></i> Table Responsive</a></li>
                                    <li><a href="table-editable.html"><i class="icon-pencil"></i> Editable Table</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#"><i class="icon-magnet mr-1"></i> UI Component</a>
                        <ul>
                            <li class="dropdown"><a href="#"><i class="icon-screen-desktop"></i>UI Elements</a>
                                <ul class="sub-menu">
                                    <li><a href="ui-alert.html"><i class="icon-bell"></i> Alerts</a></li>
                                    <li><a href="ui-badges.html"><i class="icon-badge"></i> Badges</a></li>
                                    <li><a href="ui-buttons.html"><i class="icon-control-play"></i> Buttons</a></li>
                                    <li><a href="ui-cards.html"><i class="icon-layers"></i> Cards</a></li>
                                    <li><a href="ui-carousel.html"><i class="icon-picture"></i> Carousel</a></li>
                                    <li><a href="ui-collapse.html"><i class="icon-arrow-up"></i> Collapse</a></li>
                                    <li><a href="ui-dropdowns.html"><i class="icon-arrow-down"></i> Dropdowns</a></li>
                                    <li><a href="ui-jumbotron.html"><i class="icon-screen-desktop"></i> Jumbotron</a></li>
                                    <li><a href="ui-modals.html"><i class="icon-frame"></i> Modal</a></li>
                                    <li><a href="ui-pagination.html"><i class="icon-docs"></i> Pagination</a></li>
                                    <li><a href="ui-popoverandtooltip.html"><i class="icon-pin"></i> Popover &amp; Tooltip</a></li>
                                    <li><a href="ui-progress.html"><i class="icon-graph"></i> Progress</a></li>
                                    <li><a href="ui-scrollspy.html"><i class="icon-shuffle"></i> Scrollspy</a></li>
                                    <li><a href="ui-select2.html"><i class="icon-wallet"></i> Select2</a></li>
                                    <li><a href="ui-sweetalert.html"><i class="icon-fire"></i> Sweet Alert</a></li>
                                    <li><a href="ui-timeline.html"><i class="icon-graduation"></i> Timeline</a></li>
                                    <li><a href="ui-toastr.html"><i class="icon-layers"></i> Toastr</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><i class="icon-badge"></i>Icons</a>
                                <ul class="sub-menu">
                                    <li><a href="icon-materialdesign.html"><i class="icon-star"></i> Material Icon</a></li>
                                    <li><a href="icon-font-awesome.html"><i class="icon-screen-tablet"></i> Font-awesome</a></li>
                                    <li><a href="icon-themify.html"><i class="icon-plane"></i> Themify Icon</a></li>
                                    <li><a href="icon-weather.html"><i class="icon-drawer"></i> Weather Icon</a></li>
                                    <li><a href="icon-simple-line.html"><i class="icon-map"></i> Simple Line Icon</a></li>
                                    <li><a href="icon-flag.html"><i class="icon-flag"></i> Flag Icon</a></li>
                                    <li><a href="icon-ionicons.html"><i class="icon-rocket"></i> Ionicons Icon</a></li>
                                    <li><a href="icon-icofont.html"><i class="icon-fire"></i> Icofont Icon</a></li>
                                    <li><a href="icon-linearicons.html"><i class="icon-list"></i> Linear</a></li>
                                    <li><a href="icon-crypto.html"><i class="icon-diamond"></i> Crypto</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#"><i class="icon-doc mr-1"></i> Pages</a>
                        <ul>
                            <li class="dropdown"><a href="#"><i class="icon-book-open"></i>Other Pages</a>
                                <ul class="sub-menu">
                                    <li><a href="page-lockscreen.html"><i class="icon-lock"></i> Lockscreen</a></li>
                                    <li><a href="page-login.html"><i class="icon-login"></i> login</a></li>
                                    <li><a href="page-register.html"><i class="icon-direction"></i> Register</a></li>
                                    <li><a href="page-404.html"><i class="icon-crop"></i> 404 Page</a></li>
                                    <li><a href="page-404-menu.html"><i class="icon-layers"></i> 404 Page With Menu</a></li>
                                    <li><a href="page-blank.html"><i class="icon-frame"></i> Blank Page</a></li>
                                    <li><a href="page-gallery.html"><i class="icon-layers"></i> Gallery</a></li>
                                    <li><a href="page-pricing.html"><i class="icon-wallet"></i> Pricing</a></li>
                                    <li><a href="page-contact-us.html"><i class="icon-wrench"></i> Contact us</a></li>
                                </ul>
                            </li>
                            <li><a href="user-profile.html"><i class="icon-user"></i>Profile Pages</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#"><i class="icon-support mr-1"></i> Extras</a>
                        <ul>
                            <li class="dropdown"><a href="#"><i class="icon-map"></i>Map</a>
                                <ul class="sub-menu">
                                    <li><a href="map-google.html"><i class="icon-map"></i> Google Map</a></li>
                                    <li><a href="map-vector.html"><i class="icon-vector"></i> Vector Map</a></li>

                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><i class="icon-pencil"></i>Blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog-list.html"><i class="icon-plus"></i> Blog List</a></li>
                                    <li><a href="blog-single.html"><i class="icon-tag"></i> Blog Post</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#"><i class="icon-bag"></i>Ecommerce</a>
                                <ul class="sub-menu">
                                    <li><a href="ecommerce-product-list.html"><i class="icon-grid"></i> Products List</a></li>
                                    <li><a href="ecommerce-product-detail.html"><i class="icon-plus"></i> Product Detail</a></li>
                                    <li><a href="ecommerce-cart.html"><i class="icon-badge"></i> Cart</a></li>
                                    <li><a href="ecommerce-checkout.html"><i class="icon-plus"></i> Checkout</a></li>
                                    <li><a href="ecommerce-orders.html"><i class="icon-basket"></i> Orders</a></li>
                                    <li><a href="ecommerce-order-view.html"><i class="icon-equalizer"></i> Order View</a></li>

                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- END: Menu-->
                <ol class="breadcrumb bg-transparent align-self-center m-0 p-0 ml-auto">
                    <li class="breadcrumb-item"><a href="#">Application</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </div>
        </div>
        <!-- END: Main Menu-->

        <!-- START: Main Content-->
        <main>
            <div class="container-fluid site-width">
                <!-- START: Breadcrumbs-->
                <div class="row">
                    <div class="col-12  align-self-center">
                        <div class="sub-header mt-3 py-3 align-self-center d-sm-flex w-100 rounded">
                            <div class="w-sm-100 mr-auto"><h4 class="mb-0">Dashboard</h4> <p>Welcome to liner admin panel</p></div>

                            <ol class="breadcrumb bg-transparent align-self-center m-0 p-0">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- END: Breadcrumbs-->

                <!-- START: Card Data-->
                <div class="row">
                    <div class="col-12  mt-3">
                        <div class="card outline-badge-primary">
                            <div class="card-content">
                                <div class="card-body p-2">
                                    <div class="d-md-flex">
                                        <p class="mb-0 my-auto font-w-500 tx-s-12">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis.</p>
                                        <div class="my-auto ml-auto">
                                            <a href="#" class="btn btn-outline-primary font-w-600 my-auto text-nowrap"><i class="fas fa-external-link-alt"></i></a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-12  mt-3">
                        <div class="card overflow-hidden">
                            <div class="card-content">
                                <div class="card-body p-0">
                                    <div class="row">
                                        <div class="col-12 col-lg-3 d-block d-md-flex d-lg-block">
                                            <div class="card bg-primary rounded-0 col-12 col-md-4 col-lg-12">
                                                <div class="card-body">
                                                    <div class='d-flex px-0 px-lg-2 py-2 align-self-center'>
                                                        <i class="fas fa-dollar-sign card-liner-icon mt-2 text-white"></i>
                                                        <div class='card-liner-content'>
                                                            <h2 class="card-liner-title text-white">1,76,390</h2>
                                                            <h6 class="card-liner-subtitle text-white">Investment Cost</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card bg-primary  rounded-0 col-12 col-md-4 col-lg-12">
                                                <div class="card-body">
                                                    <div class='d-flex px-0 px-lg-2 py-3 align-self-center'>
                                                        <i class="fas fa-donate card-liner-icon mt-2 text-white"></i>
                                                        <div class='card-liner-content'>
                                                            <h2 class="card-liner-title text-white">1,50,390</h2>
                                                            <h6 class="card-liner-subtitle text-white">Current Value</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card bg-primary  rounded-0 col-12 col-md-4 col-lg-12">
                                                <div class="card-body">
                                                    <div class='d-flex px-0 px-lg-2 py-2 align-self-center'>
                                                        <i class="fab fa-creative-commons-nc card-liner-icon mt-2 text-white"></i>
                                                        <div class='card-liner-content'>
                                                            <h2 class="card-liner-title text-white">-15,568</h2>
                                                            <h6 class="card-liner-subtitle text-white">Total Profit/Loss</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-8  col-lg-6 mt-3">
                                            <canvas id="chartjs-account-chart"></canvas>
                                        </div>
                                        <div class="col-12 col-md-4  col-lg-3 mt-3">
                                            <div class="p-2">
                                                <div class="d-flex">
                                                    <div class="media-body align-self-center ">
                                                        <span class="mb-0 h5 font-w-600">Total Investment</span><br>
                                                        <p class="mb-0 font-w-500 tx-s-12">San Francisco, California, USA</p>
                                                    </div>
                                                    <div class="ml-auto border-0 outline-badge-success circle-50"><span class="h5 mb-0">$</span></div>
                                                </div>
                                                <div class="d-flex mt-4">
                                                    <div class="border-0 outline-badge-info w-50 p-3 rounded text-center"><span class="h6 mb-0">$78,600</span><br>
                                                        Mutual Funds
                                                    </div>
                                                    <div class="border-0 outline-badge-success w-50 p-3 rounded ml-2 text-center"><span class="h6 mb-0">$1,24,600</span><br>
                                                        Equity
                                                    </div>
                                                </div>
                                                <div class="d-flex mt-3">
                                                    <div class="border-0 outline-badge-dark w-50 p-3 rounded text-center"><span class="h6 mb-0">$4,600</span><br>
                                                        Commodity
                                                    </div>
                                                    <div class="border-0 outline-badge-danger w-50 p-3 rounded ml-2 text-center"><span class="h6 mb-0">$2,600</span><br>
                                                        Real Estate
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-12 col-sm-6 col-xl-3 mt-3">
                        <div class="card">
                            <div class="card-body text-center p-0">
                                <div class="px-4 pt-4 pb-0 d-flex">
                                    <i class="fas fa-dollar-sign card-liner-icon font-size-60 mt-2 text-primary"></i>
                                    <div class="w-100 text-right">
                                        <h4 class="card-title  m-0">Investment</h4>
                                        <span class="text-success"><i class="ion ion-android-arrow-dropup"></i> 15% higher</span> <span class="text-muted">20.5K</span>
                                    </div>
                                </div>
                                <div id="eth_apex_area_chart" class="min-height-auto"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-xl-3 mt-3">
                        <div class="card">
                            <div class="card-body text-center p-0">
                                <div class="px-4 pt-4 pb-0 d-flex">
                                    <i class="fas fa-donate card-liner-icon font-size-60 mt-2 text-success"></i>
                                    <div class="w-100 text-right">
                                        <h4 class="card-title  m-0">Total Profit</h4>
                                        <span class="text-success"><i class="ion ion-android-arrow-dropup"></i> 1.5% higher</span> <span class="text-muted">28.5K</span>
                                    </div>
                                </div>
                                <div id="bch_apex_area_chart" class="min-height-auto"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-xl-3 mt-3">
                        <div class="card bg-primary text-white h-100">
                            <div class="card-body text-center p-3 d-flex">
                                <div class="align-self-center text-center w-100">
                                    <span class="icon-people h1 bg-primary text-white shadow-circle p-3 rounded-circle"></span>
                                    <h2 class="card-title font-weight-bold mt-4">Unique Visitors</h2>
                                    <span class="h4">20.5K</span>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-xl-3 mt-3">
                        <div class="card">
                            <div class="card-body text-center p-0">
                                <div class="px-4 pt-4 pb-0 d-flex">
                                    <i class="fab fa-creative-commons-nc card-liner-icon mt-2 text-info font-size-60"></i>
                                    <div class="w-100 text-right">
                                        <h4 class="card-title  m-0">STATS</h4>
                                        <span class="text-success"><i class="ion ion-android-arrow-dropup"></i> 1.5% higher</span> <span class="text-muted">28.5K</span>
                                    </div>
                                </div>
                                <div id="stats_apex_area_chart" class="min-height-auto"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mt-3">
                        <div class="card overflow-hidden">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="card-title">Transactions</h6>
                            </div>
                            <div class="card-content">
                                <div class="card-body p-0">
                                    <ul class="list-group list-unstyled">
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <div class="transaction-date text-center rounded bg-primary text-white p-2">
                                                    <small class="d-block">MAR</small><span class="h6">28</span>
                                                </div>

                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Jonathan</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">SIP Purchase</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    +500<br/>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="transaction-date d-flex w-100">
                                                <div class="date text-center rounded bg-primary text-white p-2">
                                                    <small class="d-block">APR</small><span class="h6">12</span>
                                                </div>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">kelvin</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Mutual Funds</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-danger">
                                                    -500<br/>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <div class="transaction-date text-center rounded bg-primary text-white p-2">
                                                    <small class="d-block">MAY</small><span class="h6">13</span>
                                                </div>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Peter</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Equity</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-danger">
                                                    +500<br/>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <div class="transaction-date text-center rounded bg-primary text-white p-2">
                                                    <small class="d-block">JUN</small><span class="h6">23</span>
                                                </div>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Ray Sin</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Commodity</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-danger">
                                                    +500<br/>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <div class="transaction-date text-center rounded bg-primary text-white p-2">
                                                    <small class="d-block">JUL</small><span class="h6">16</span>
                                                </div>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Abexon Dixon</span><br/>
                                                    <p class="mb-0 font-w-500 tx-s-12">Real Estate</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    +500<br/>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 zoom">
                                            <div class="media d-flex w-100">
                                                <div class="transaction-date text-center rounded bg-primary text-white p-2">
                                                    <small class="d-block">AUG</small><span class="h6">28</span>
                                                </div>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Nathan S. Johnson</span><br/>
                                                    <p class="mb-0 font-w-500 tx-s-12">Switch Out</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    +500<br/>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4  mt-3">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body p-4 text-center">

                                    <div class="my-auto">
                                        <img src="dist/images/wallet.png" alt="author" width="48" class="my-auto">
                                    </div>
                                    <div class="content my-3">
                                        <span class="mb-0 font-w-600 h5">Lorem ipsum dolor sit</span><br>
                                        <p class="mb-0 font-w-500 tx-s-12">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis.</p>
                                    </div>
                                    <div class="card bg-primary my-3 text-left">
                                        <div class="card-body">
                                            <div class="d-flex px-0 px-lg-2 py-2 align-self-center">
                                                <i class="fas fa-dollar-sign card-liner-icon mt-2 text-white"></i>
                                                <div class="card-liner-content">
                                                    <h2 class="card-liner-title text-white">1,76,390</h2>
                                                    <h6 class="card-liner-subtitle text-white">Investment Cost</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-auto">
                                        <a href="#" class="btn btn-outline-primary font-w-600 my-auto text-nowrap">Get More</a>
                                    </div>
                                    <ul class="list-inline my-3">
                                        <li class="list-inline-item"><i class="fab fa-cc-mastercard h1 color-primary"></i></li>
                                        <li class="list-inline-item"><i class="fab fa-cc-visa h1 color-primary"></i></li>
                                        <li class="list-inline-item"><i class="fab fa-cc-paypal h1 color-primary"></i></li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mt-3">
                        <div class="card overflow-hidden">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="card-title">Accounts & Cards</h6>
                            </div>
                            <div class="card-content">
                                <div class="card-body p-0">
                                    <ul class="list-group list-unstyled">
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <i class="fab fa-cc-mastercard h1 color-primary"></i>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Master Card</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">1234 1234 1234 1234</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    Active
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="transaction-date d-flex w-100">
                                                <i class="fab fa-cc-visa h1 color-primary"></i>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Visa Card</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">1234 1234 1234 1234</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-danger">
                                                    Disable
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <i class="fab fa-cc-paypal h1 color-primary"></i>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Paypal</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">test@example.com</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    Active
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom">
                                            <div class="media d-flex w-100">
                                                <i class="fab fa-cc-amazon-pay h1 color-primary"></i>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Amazon Pay</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">amazon-pay@abc</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    Active
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <i class="fab fa-cc-stripe h1 color-primary"></i>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Stripe Payment</span><br/>
                                                    <p class="mb-0 font-w-500 tx-s-12">1234 1234 1234 1234</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-success">
                                                    Active
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 zoom">
                                            <div class="media d-flex w-100">
                                                <i class="fab fa-cc-discover h1 color-primary"></i>
                                                <div class="media-body align-self-center pl-4">
                                                    <span class="mb-0 font-w-600">Discover Card</span><br/>
                                                    <p class="mb-0 font-w-500 tx-s-12">1234 1234 1234 1234</p>
                                                </div>
                                                <div class="ml-auto my-auto font-weight-bold text-right text-danger">
                                                    Disable
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mt-3">
                        <div class="card overflow-hidden">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="card-title">Recent Invoices</h6>
                            </div>
                            <div class="card-content">
                                <div class="card-body p-0">
                                    <ul class="list-group list-unstyled">
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <span class="badge outline-badge-info my-auto">Paid</span>
                                                <div class="media-body align-self-center  text-right">
                                                    <span class="mb-0 font-w-600">Payment</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">SIP Purchase</p>
                                                </div>
                                                <div class="ml-auto my-auto pl-4 font-weight-bold  text-right text-success">
                                                    +500<br>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="transaction-date d-flex w-100">
                                                <span class="badge outline-badge-danger my-auto">Canceled</span>
                                                <div class="media-body align-self-center  text-right">
                                                    <span class="mb-0 font-w-600">Service Payment</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Mutual Funds</p>
                                                </div>
                                                <div class="ml-auto my-auto pl-4 font-weight-bold text-right text-danger">
                                                    -500<br>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <span class="badge outline-badge-warning my-auto">Standby</span>
                                                <div class="media-body align-self-center  text-right">
                                                    <span class="mb-0 font-w-600">Membership</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Equity</p>
                                                </div>
                                                <div class="ml-auto my-auto pl-4 font-weight-bold text-right text-danger">
                                                    +500<br>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <span class="badge outline-badge-success my-auto">Paid</span>
                                                <div class="media-body align-self-center  text-right">
                                                    <span class="mb-0 font-w-600">Renewal</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Commodity</p>
                                                </div>
                                                <div class="ml-auto my-auto pl-4 font-weight-bold text-right text-danger">
                                                    +500<br>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 border-bottom zoom">
                                            <div class="media d-flex w-100">
                                                <span class="badge outline-badge-danger my-auto">Hold</span>
                                                <div class="media-body align-self-center  text-right">
                                                    <span class="mb-0 font-w-600">New Purchase</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Real Estate</p>
                                                </div>
                                                <div class="ml-auto my-auto pl-4 font-weight-bold text-right text-success">
                                                    +500<br>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="p-2 zoom">
                                            <div class="media d-flex w-100">
                                                <span class="badge outline-badge-info my-auto">Process</span>
                                                <div class="media-body align-self-center  text-right">
                                                    <span class="mb-0 font-w-600">Widrawal</span><br>
                                                    <p class="mb-0 font-w-500 tx-s-12">Switch Out</p>
                                                </div>
                                                <div class="ml-auto my-auto pl-4 font-weight-bold text-right text-success">
                                                    +500<br>
                                                    <small class="d-block">USD</small>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-8 mt-3">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="card-title">Transaction History</h6>
                            </div>
                            <div class="card-content">
                                <div class="card-body p-0 table-responsive">
                                    <table class="table">

                                        <tbody id="transactionHistoryTrns">
                                            <tr>
                                                <td><strong>Date</strong></td>
                                                <td><strong>Transaction Number</strong></td>
                                                <td><strong>Details</strong></td>
                                                <td><strong>Amount</strong></td>
                                            </tr>
                                            <tr class="gray zoom">
                                                <td>09/04/2020</td>
                                                <td>19999999980409299887130</td>
                                                <td>EMI FOR BT EMI  INT 18  FOR 6  005 006 </td>
                                                <td>4,600.14 (Dr)</td>
                                            </tr>
                                            <tr class="zoom">
                                                <td>09/04/2020</td>
                                                <td>19999999980409299887140</td>
                                                <td>GST</td>
                                                <td>25.03 (Dr)</td>
                                            </tr>
                                            <tr class="zoom">
                                                <td>09/04/2020</td>
                                                <td>19999999980409299887140</td>
                                                <td>EMI INT BT EMI  INT 18  FOR 6  005 006 </td>
                                                <td>139.03 (Dr)</td>
                                            </tr>
                                            <tr class="zoom">
                                                <td>08/04/2020</td>
                                                <td>09999999980408001102363</td>
                                                <td>PAYMENT RECEIVED NEFT</td>
                                                <td>35,225.00 (Cr)</td>
                                            </tr>
                                            <tr class="zoom">
                                                <td>04/04/2020</td>
                                                <td>VT200960059001300000269</td>
                                                <td>PAYTM                  NOIDA         IN</td>
                                                <td>379.00 (Dr)</td>
                                            </tr>
                                            <tr class="zoom">
                                                <td>31/03/2020</td>
                                                <td>VT200920064000540000206</td>
                                                <td>RAZ PHONEPE RECHARGE   Bangalore     IN</td>
                                                <td>98.00 (Dr)</td>
                                            </tr>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- END: Card DATA-->
            </div>
        </main>
        <!-- END: Content-->
        <!-- START: Footer-->
        <footer class="site-footer">
            2020 © PICK
        </footer>
        <!-- END: Footer-->



        <!-- START: Back to top-->
        <a href="#" class="scrollup text-center">
            <i class="icon-arrow-up"></i>
        </a>
        <!-- END: Back to top-->

        <!-- START: APP JS-->
        <script src="${cp }/dist/js/app.js"></script>
        <!-- END: APP JS-->

        <!-- START: Page Vendor JS-->
        <script src="${cp }/dist/vendors/raphael/raphael.min.js"></script>
        <script src="${cp }/dist/vendors/morris/morris.min.js"></script>
        <script src="${cp }/dist/vendors/chartjs/Chart.min.js"></script>
        <script src="${cp }/dist/vendors/starrr/starrr.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.canvaswrapper.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.colorhelpers.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.saturated.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.browser.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.drawSeries.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.uiConstants.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.legend.js"></script>
        <script src="${cp }/dist/vendors/jquery-flot/jquery.flot.pie.js"></script>
        <script src="${cp }/dist/vendors/chartjs/Chart.min.js"></script>
        <script src="${cp }/dist/vendors/jquery-jvectormap/jquery-jvectormap-2.0.3.min.js"></script>
        <script src="${cp }/dist/vendors/jquery-jvectormap/jquery-jvectormap-world-mill.js"></script>
        <script src="${cp }/dist/vendors/jquery-jvectormap/jquery-jvectormap-de-merc.js"></script>
        <script src="${cp }/dist/vendors/jquery-jvectormap/jquery-jvectormap-us-aea.js"></script>
        <script src="${cp }/dist/vendors/apexcharts/apexcharts.min.js"></script>
        <!-- END: Page Vendor JS-->

        <!-- START: Page JS-->
        <script src="${cp }/dist/js/home.script.js"></script>
        <!-- END: Page JS-->
    </body>
    <!-- END: Body-->
</html>