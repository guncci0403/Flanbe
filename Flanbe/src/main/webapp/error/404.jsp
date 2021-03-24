<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <!-- START: Head-->
    <head>
        <meta charset="UTF-8">
        <title>404</title>
        <link rel="shortcut icon" href="dist/images/favicon.ico" />
        <meta name="viewport" content="width=device-width,initial-scale=1"> 
		
		<%@ include file="/WEB-INF/views/common/common_css.jsp" %>
		
        <!-- START: Custom CSS-->
        <link rel="stylesheet" href="dist/css/main.css">
        <!-- END: Custom CSS-->
    </head>
    <!-- END Head-->

    <!-- START: Body-->   
    <body id="main-container" class="default bg-primary">
        <!-- START: Main Content-->
        <div class="container">
            <div class="row vh-100 justify-content-between align-items-center">
                <div class="col-12">
                    <div  class="lockscreen  mt-5 mb-5">
                        <div class="jumbotron mb-0 text-center theme-background rounded">
                            <h1 class="display-3 font-weight-bold"> 404</h1>
                            <h5><i class="ion ion-alert pr-2"></i>Oops! Something went wrong</h5>
                            <p>The page you are looking for is not found, please try after some time or go back to home</p>
                            <a href="index.html" class="btn btn-primary">Go To Home</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- END: Content-->
    </body>
    <!-- END: Body-->
</html>

   
