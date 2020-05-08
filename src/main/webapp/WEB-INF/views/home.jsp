<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <c:set var="context" value="${pageContext.request.contextPath}" />
  <title>Dashboard</title>

  <!-- Favicons -->
  <link href="${context}/resources/img/favicon.png" rel="icon">
  <link href="${context}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${context}/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${context}/resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${context}/resources/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${context}/resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="${context}/resources/css/style.css" rel="stylesheet">
  <link href="${context}/resources/css/style-responsive.css" rel="stylesheet">
  <script src="${context}/resources/lib/chart-master/Chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://files.codepedia.info/files/uploads/iScripts/html2canvas.js"></script>
</head>
<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right"></div>
      </div>
      <!--logo start-->
      <a href="${context}/home" class="logo"><b>SUB<span>STATION</span></b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="${context}/resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">Sam Soffes</h5>
          <li class="mt">
            <a class="active" href="${context}/home">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
          <li>
            <div id="showcal" style="display:block;">
            <a onclick="openNav()">
            <i class="fa fa-calendar" aria-hidden="true"></i>
            <span>Show Calendar</span>
            </a>
            <script>
                function openNav() {
                var dvPassport = document.getElementById("cal");
                var show = document.getElementById("hidecal");
                var show1 = document.getElementById("showcal");
                dvPassport.style.display = "block";
                show.style.display = "block";
                show1.style.display = "none";
              }
              </script>
            </div>
          </li>
          <li>
            <div id="hidecal" style="display:none;">
            <a onclick="closeNav()">
            <i class="fa fa-calendar" aria-hidden="true"></i>
            <span>Hide Calendar</span>
            </a>
            <script>
                function closeNav() {
                var dvPassport = document.getElementById("cal");
                var show = document.getElementById("showcal");
                var show1 = document.getElementById("hidecal");
                dvPassport.style.display = "none";
                show.style.display = "block";
                show1.style.display = "none";
              }
              </script>
              </div>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <h3>Records</h3><br>
            <style>
              .grid-container {
                display: grid;
				grid-gap:2px;
                grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
                background-color: #333;
                padding: 10px;
              }
              .grid-item {
                background-color: rgba(255, 255, 255, 0.8);
                border: 1px solid rgba(0, 0, 0, 0.8);
                padding: 20px;
                font-size: 30px;
                text-align: center;
		color: cadetblue;
              }
              </style>
			  <a id="btn-Convert-Html2Image" href="#" style="margin-left: 92%;font-size: large;"><i class="fa fa-download" aria-hidden="true"> Download</i></a>
    		  <div id="previewImage" style="display: none;"></div>
              <div id="html-content-holder" class="grid-container">
              <c:forEach items="${list}" var="item">
                <a href="#"><div class="grid-item">${item.id}</div></a>
               </c:forEach>
              </div>
            <!-- /row -->
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <div id="cal" style="display:none;">
          <div class="col-lg-3 ds">
            <!--COMPLETED ACTIONS DONUTS CHART-->
            <!-- CALENDAR-->
	    <a onclick="closeNav()">
	    <i class="fa fa-times" aria-hidden="true" style="font-size: 14px;margin-left: 98%;color: cadetblue;"></i></a>
            <div id="calendar" class="mb">
              <div class="panel green-panel no-margin">
                <div class="panel-body">
                  <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                    <div class="arrow"></div>
                    <h3 class="popover-title" style="disadding: none;"></h3>
                    <div id="date-popover-content" class="popover-content"></div>
                  </div>
                  <div id="my-calendar"></div>
                </div>
              </div>
            </div>
            <!-- / calendar -->
          </div>
          </div>
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!--main content end-->
      </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${context}/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${context}/resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${context}/resources/lib/jquery.scrollTo.min.js"></script>
  <script src="${context}/resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${context}/resources/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script src="${context}/resources/lib/zabuto_calendar.js"></script>
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  </script>
	<script>
        $(document).ready(function () {
            var element = $("#html-content-holder"); // global variable
            var getCanvas; // global variable

            html2canvas(element, {
                onrendered: function (canvas) {
                    $("#previewImage").append(canvas);
                    getCanvas = canvas;
                }
            });

            $("#btn-Convert-Html2Image").on('click', function () {
                var imgageData = getCanvas.toDataURL("image/png");
                // Now browser starts downloading it instead of just showing it
                var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
                $("#btn-Convert-Html2Image").attr("download", "image.png").attr("href", newData);
            });
        });
	</script>
</body>
</html>