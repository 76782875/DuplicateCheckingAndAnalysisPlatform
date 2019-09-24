<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="dao.Userdao"%>
<%@page import="bean.Userbean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Creative - Bootstrap Admin Template</title>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />    
    <!-- full calendar css-->
    <link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
	<link href="assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
    <!-- easy pie chart-->
    <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
	<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
	<link rel="stylesheet" href="css/fullcalendar.css">
	<link href="css/widgets.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	<link href="css/xcharts.min.css" rel=" stylesheet">	
	<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
  </head>

<body>
<!-- container section start -->
  
  <section id="container" class="">
     
      
      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
            </div>

            <!--logo start-->
            <a href="index.html" class="logo">ENTERPRISE <span class="lite">PA</span></a>
            <!--logo end-->

            
            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    <!-- task notificatoin start -->
                    <li id="task_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-task-l"></i>
                            <span class="badge bg-important">6</span>
                        </a>
                       
                    </li>
                    <!-- task notificatoin end -->
                    <!-- inbox notificatoin start-->
                    <li id="mail_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-l"></i>
                            <span class="badge bg-important">5</span>
                        </a>
                       
                    </li>
                    <!-- inbox notificatoin end -->
                    <!-- alert notification start-->
                    <li id="alert_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-l"></i>
                            <span class="badge bg-important">7</span>
                        </a>
                       
                    </li>
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span>
                            <span class="username">王云玲</span>
                            <b class="caret"></b>
                        </a>
                       
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>      
      <!--header end-->

      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" href="look.jsp">
                          <i class="icon_house_alt"></i>
                          <span>热词搜索</span>
                      </a>
                  </li>
				  <li class="sub-menu">
                      <a href="fenlei.jsp" class="">
                          <i class="icon_document_alt"></i>
                          <span>热词分类</span>
                      </a>
                     
                  </li>       
                  
                   <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_table"></i>
                          <span>数据</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="xiazai.jsp" >导出word文档</a></li>
                      </ul>
                  </li>
                  
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
			  
            </section>
            
      </section>
      <!--main content end-->
      <center>
      <div class="panel-body">
      <form class="navbar-form" action="result.jsp" method="post">
                            <input class="form-control" placeholder="Search" type="text" name="content"/>
                           &nbsp;&nbsp;<input id="add-without-image" class="btn btn-info  btn-sm" type="submit" value="查询"/>
                        </form>
                        </div>
     <%

%>
<c:forEach items="${list }" var="userbean">
<div >
   <form style="border: 0; width: 1000px">
   <table style="width: 1000px" border="0">
			<tr>
			
				<td rowspan="4" style="width:30%;border: 1px solid #f1f2f6;">
					<img alt="" src="img/bei.jpg" style="width:280px;height:200px"/>
				</td>
					<td align="left" height="50" width="70%"><font class="must" size="5">*<%=${userbean.title3 }%></font></td>
				</tr>
				<tr>
						<td align="left" height="50" width="70%" ><font class="must">*</font><%=content %></td>
							<td></td>
						</tr>
					
	</table>
   <table style="width: 1000px" border="0">
     
			<tr>
				<td align="left" height="50" width="14%"><font class="must">*</font><%=itemName[0] %>：</td>
				<td width="36%"><%=itemValue[0] %></td>
				<td align="left" ><font class="must">*</font><%=itemName[1] %>：</td>
				<td ><%=itemValue[1] %></td>
			</tr>
			<tr>
				<td align="left" height="50" ><font class="must">*</font><%=itemName[2] %>：</td>
				<td ><%=itemValue[2] %></td>
				<td align="left" ><font class="must">*</font><%=itemName[3] %>：</td>
				<td ><%=itemValue[3] %></td>
			</tr>
			
	
   </table>
   
   </form>
</div>
<%
String url1 = "https://so.csdn.net/so/search/s.do?q=云计算";
document = Jsoup.connect(url1).get();
Elements ele = document.getElementsByClass("limit_width");

%>
<br>
<br>
<div >
   <form style="border: 0; width: 1000px">
   
   <table style="width: 1000px" border="0">
     
			<tr>
				<td align="left" height="50" width="14%"><font color="blue" size="6">|</font><font class="must" size="4">相关文章</font></td>
				
			</tr>
			<%
Dao ws=new Dao();
List<model> ms=new ArrayList<model>();
ms=ws.select(biaoti);
// 第二步：解析页面
int k=1;
for(model m:ms){
	

/** String regexStr = "[abdh]e";
        String targetStr = "hello world";
        //获取Pattern对象
        Pattern pattern = Pattern.compile(regexStr);
        // 定义一个matcher用来做匹配
        Matcher matcher = pattern.matcher(targetStr);
        if (matcher.find()) {
            System.out.println(matcher.group());
        }
**/
System.out.print(m.getName());
%>
   	
			<tr>
				<td align="left" height="50" width="14%"><font class="must" ><%=k++ %>.&nbsp;&nbsp;<input type="button"  style="border:4px" value=<%=m.getTitle() %><%=m.getContent() %> onclick="window.location.href ='<%=m.getName() %>'   "></font></td>
			
			</tr>
			<%} %>
	
   </table>
   
   </form>
</div>
</c:forEach>
 <!-- container section start -->

    <!-- javascripts -->
    <script src="js/jquery.js"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts scripts -->
    <script src="assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="js/owl.carousel.js" ></script>
    <!-- jQuery full calendar -->
    <script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
    <!--script for this page only-->
    <script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>
    <!-- custom select -->
    <script src="js/jquery.customSelect.min.js" ></script>
	<script src="assets/chart-master/Chart.js"></script>
   
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>
    <!-- custom script for this page-->
    <script src="js/sparkline-chart.js"></script>
    <script src="js/easy-pie-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>	
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>	
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
  <script>
</body>
</html>