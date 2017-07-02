<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Limes 平台</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.jscrollpane.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.css" />
  <!--[if lt IE 9]>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
  <![endif]-->
</head>
<body data-color="grey" class="flat">
<div id="wrapper">

  <%@ include file="header.html"%>
  <%--<%@ include file="switcher.html"%>--%>
  <%@ include file="sidebar.html"%>
  <div id="content">
    <div id="content-header" class="mini">
      <h1>Dashboard</h1>
      <ul class="mini-stats box-3">
        <li>
          <div class="left sparkline_bar_good"><span>2,4,9,7,12,10,12</span>+10%</div>
          <div class="right">
            <strong>36094</strong>
            Visits
          </div>
        </li>
        <li>
          <div class="left sparkline_bar_neutral"><span>20,15,18,14,10,9,9,9</span>0%</div>
          <div class="right">
            <strong>1433</strong>
            Users
          </div>
        </li>
        <li>
          <div class="left sparkline_bar_bad"><span>3,5,9,7,12,20,10</span>+50%</div>
          <div class="right">
            <strong>8650</strong>
            Orders
          </div>
        </li>
      </ul>
    </div>
    <div id="breadcrumb">
      <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
      <a href="#" class="current">Dashboard</a>
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12 center" style="text-align: center;">
          <ul class="quick-actions">
            <li>
              <a href="#">
                <i class="icon-cal"></i>
                Manage Events
              </a>
            </li>
            <li>
              <a href="#">
                <i class="icon-shopping-bag"></i>
                Manage Orders
              </a>
            </li>
            <li>
              <a href="#">
                <i class="icon-database"></i>
                Manage DB
              </a>
            </li>
            <li>
              <a href="#">
                <i class="icon-people"></i>
                Manage Users
              </a>
            </li>
            <li>
              <a href="#">
                <i class="icon-lock"></i>
                Security
              </a>
            </li>
            <li>
              <a href="#">
                <i class="icon-piechart"></i>
                Statistics
              </a>
            </li>
          </ul>
        </div>
      </div>
      <br />
      <div class="row">
        <div class="col-xs-12">
          <div class="alert alert-info">
            Welcome in the <strong>Unicorn Admin Theme</strong>. Don't forget to check all the pages!
            <a href="#" data-dismiss="alert" class="close">脳</a>
          </div>
          <div class="widget-box">
            <div class="widget-title">
              <span class="icon"><i class="fa fa-signal"></i></span>
              <h5>Site Statistics</h5>
              <div class="buttons">
                <a href="#" class="btn"><i class="fa fa-refresh"></i> <span class="text">Update stats</span></a>
              </div>
            </div>
            <div class="widget-content">
              <div class="row">
                <div class="col-xs-12 col-sm-4">
                  <ul class="site-stats">
                    <li><div class="cc"><i class="fa fa-user"></i> <strong>1433</strong> <small>Total Users</small></div></li>
                    <li><div class="cc"><i class="fa fa-arrow-right"></i> <strong>16</strong> <small>New Users (last week)</small></div></li>
                    <li class="divider"></li>
                    <li><div class="cc"><i class="fa fa-shopping-cart"></i> <strong>259</strong> <small>Total Shop Items</small></div></li>
                    <li><div class="cc"><i class="fa fa-tag"></i> <strong>8650</strong> <small>Total Orders</small></div></li>
                    <li><div class="cc"><i class="fa fa-repeat"></i> <strong>29</strong> <small>Pending Orders</small></div></li>
                  </ul>
                </div>
                <div class="col-xs-12 col-sm-8">
                  <div class="chart"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-6">
          <div class="widget-box">
            <div class="widget-title"><span class="icon"><i class="fa fa-file"></i></span><h5>Recent Posts</h5><span title="54 total posts" class="label label-info tip-left">54</span></div>
            <div class="widget-content nopadding">
              <ul class="recent-posts">
                <li>
                  <div class="user-thumb">
                    <img width="40" height="40" alt="User" src="img/demo/av2.jpg">
                  </div>
                  <div class="article-post">
                    <span class="user-info"> By: neytiri on 2 Aug 2012, 09:27 AM, IP: 186.56.45.7 </span>
                    <p>
                      <a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
                    </p>
                    <a href="#" class="btn btn-primary btn-xs">Edit</a> <a href="#" class="btn btn-success btn-xs">Publish</a> <a href="#" class="btn btn-danger btn-xs">Delete</a>
                  </div>
                </li>
                <li>
                  <div class="user-thumb">
                    <img width="40" height="40" alt="User" src="img/demo/av3.jpg">
                  </div>
                  <div class="article-post">
                    <span class="user-info"> By: john on on 24 Jun 2012, 04:12 PM, IP: 192.168.24.3 </span>
                    <p>
                      <a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
                    </p>
                    <a href="#" class="btn btn-primary btn-xs">Edit</a> <a href="#" class="btn btn-success btn-xs">Publish</a> <a href="#" class="btn btn-danger btn-xs">Delete</a>
                  </div>
                </li>
                <li>
                  <div class="user-thumb">
                    <img width="40" height="40" alt="User" src="img/demo/av1.jpg">
                  </div>
                  <div class="article-post">
                    <span class="user-info"> By: michelle on 22 Jun 2012, 02:44 PM, IP: 172.10.56.3 </span>
                    <p>
                      <a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
                    </p>
                    <a href="#" class="btn btn-primary btn-xs">Edit</a> <a href="#" class="btn btn-success btn-xs">Publish</a> <a href="#" class="btn btn-danger btn-xs">Delete</a>
                  </div>
                </li>
                <li class="viewall">
                  <a title="View all posts" class="tip-top" href="#"> + View all + </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-6">
          <div class="widget-box">
            <div class="widget-title"><span class="icon"><i class="fa fa-comment"></i></span><h5>Recent Comments</h5><span title="88 total comments" class="label label-info tip-left">88</span></div>
            <div class="widget-content nopadding">
              <ul class="recent-comments">
                <li>
                  <div class="user-thumb">
                    <img width="40" height="40" alt="User" src="img/demo/av1.jpg">
                  </div>
                  <div class="comments">
                    <span class="user-info"> User: michelle on IP: 172.10.56.3 </span>
                    <p>
                      <a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
                    </p>
                    <a href="#" class="btn btn-primary btn-xs">Edit</a> <a href="#" class="btn btn-success btn-xs">Approve</a> <a href="#" class="btn btn-warning btn-xs">Mark as spam</a> <a href="#" class="btn btn-danger btn-xs">Delete</a>
                  </div>
                </li>
                <li>
                  <div class="user-thumb">
                    <img width="40" height="40" alt="User" src="img/demo/av3.jpg">
                  </div>
                  <div class="comments">
                    <span class="user-info"> User: john on IP: 192.168.24.3 </span>
                    <p>
                      <a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
                    </p>
                    <a href="#" class="btn btn-primary btn-xs">Edit</a> <a href="#" class="btn btn-success btn-xs">Approve</a> <a href="#" class="btn btn-warning btn-xs">Mark as spam</a> <a href="#" class="btn btn-danger btn-xs">Delete</a>
                  </div>
                </li>
                <li>
                  <div class="user-thumb">
                    <img width="40" height="40" alt="User" src="img/demo/av2.jpg">
                  </div>
                  <div class="comments">
                    <span class="user-info"> User: neytiri on IP: 186.56.45.7 </span>
                    <p>
                      <a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>
                    </p>
                    <a href="#" class="btn btn-primary btn-xs">Edit</a> <a href="#" class="btn btn-success btn-xs">Approve</a> <a href="#" class="btn btn-warning btn-xs">Mark as spam</a> <a href="#" class="btn btn-danger btn-xs">Delete</a>
                  </div>
                </li>
                <li class="viewall">
                  <a title="View all comments" class="tip-top" href="#"> + View all + </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="widget-box widget-calendar">
            <div class="widget-title"><span class="icon"><i class="fa fa-calendar"></i></span><h5>Calendar</h5></div>
            <div class="widget-content nopadding">
              <div class="calendar"></div>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
  <%@ include file="footer.html"%>
</div>

<script src="js/excanvas.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.flot.min.js"></script>
<script src="js/jquery.flot.resize.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/fullcalendar.min.js"></script>

<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.dashboard.js"></script>
</body>
</html>
