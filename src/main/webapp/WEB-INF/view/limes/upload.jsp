<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Limes 平台</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="/css/bootstrap.min.css" />
  <link rel="stylesheet" href="/css/font-awesome.css" />
  <link rel="stylesheet" href="/css/fullcalendar.css" />
  <link rel="stylesheet" href="/css/jquery.jscrollpane.css" />
  <script src="/js/jquery.min.js"></script>
  <link rel="stylesheet" href="/css/unicorn.css" />
  <!--[if lt IE 9]>
  <script type="text/javascript" src="/js/respond.min.js"></script>
  <![endif]-->
</head>
<body data-color="grey" class="flat">
<div id="wrapper">

  <%@ include file="../header.html"%>
  <%--<%@ include file="switcher.html"%>--%>
  <%@ include file="../sidebar.html"%>
  <div id="content">
    <div id="content-header" class="mini">
      <h1>联系邮箱</h1>
    </div>
    <div id="breadcrumb">
      <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
      <a href="#" class="current">联系邮箱</a>
    </div>



    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12">


          <form class="form-horizontal"  action="uploadEmail" >

            <%--<div class="form-group">--%>
              <%--<div class="col-sm-3 col-md-9 col-lg-10">--%>
              <%--<input type="file" name="fieldName" style="margin-left: 50%"/>--%>

              <%--<input type="file" name="fieldName" style="text-align: center"/>--%>


              <label class="col-sm-3 col-md-3 col-lg-2 control-label">邮箱</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="email" placeholder="example@mail.com" />
              </div>


              <br>
              <br>
              <%--</div>--%>
            <%--</div>--%>
            <%--<button class="btn btn-dark-blue" style="float: right;" type="submit" id="insertData">上传</button>--%>
              <button class="btn btn-dark-blue" style="margin-left: 50%;" type="submit" id="insertData">提交</button>

          </form>

        </div>
      </div>
    </div>

  </div>
  <%@ include file="../footer.html"%>
</div>

<script src="/js/excanvas.min.js"></script>
<script src="/js/jquery-ui.custom.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.flot.min.js"></script>
<script src="/js/jquery.flot.resize.min.js"></script>
<script src="/js/jquery.sparkline.min.js"></script>
<script src="/js/fullcalendar.min.js"></script>

<script src="/js/jquery.nicescroll.min.js"></script>
<script id="unicorn" src="/js/unicorn.js"  data="id=2"></script>
<script src="/js/unicorn.dashboard.js"></script>
</body>
</html>
