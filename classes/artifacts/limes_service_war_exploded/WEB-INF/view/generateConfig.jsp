<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>limes 平台</title>
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

  <%@ include file="header.html"%>
  <%@ include file="switcher.html"%>
  <%@ include file="sidebar.html"%>
  <div id="content">
    <div id="content-header" class="mini">
      <h1>生成config</h1>
    </div>
    <div id="breadcrumb">
      <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
      <a href="#" class="current">生成config</a>
    </div>



    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12">


          <form class="form-horizontal" id="insertForm" action="submitConfig">

            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">PREFIX <button class="btn btn-dark-blue" style="float: right;" type="button">+PREFIX</button></label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="PREFIX_NAMESPACE" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="PREFIX_LABEL" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">PREFIX</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="PREFIX_NAMESPACE" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="PREFIX_LABEL" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">SOURCE</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ID</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="SOURCE_ID" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENDPOINT</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="SOURCE_ENDPOINT" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">VAR</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="SOURCE_VAR" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PAGESIZE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="SOURCE_PAGESIZE" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RESTRICTION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="SOURCE_RESTRICTION" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PROPERTY</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="SOURCE_PROPERTY" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">TARGET</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ID</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="TARGET_ID" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENDPOINT</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="TARGET_ENDPOINT" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">VAR</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="TARGET_VAR" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PAGESIZE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="TARGET_PAGESIZE" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RESTRICTION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="TARGET_RESTRICTION" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PROPERTY</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="TARGET_PROPERTY" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">METRIC</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label"></label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="METRIC" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">ACCEPTANCE</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">THRESHOLD</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="ACCEPTANCE_THRESHOLD" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">FILE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="ACCEPTANCE_FILE" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RELATION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="ACCEPTANCE_RELATION" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">REVIEW</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">THRESHOLD</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="REVIEW_THRESHOLD" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">FILE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="REVIEW_FILE" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RELATION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="REVIEW_RELATION" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">EXECUTION</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">REWRITER</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="EXECUTION_REWRITER" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PLANNER</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="EXECUTION_PLANNER" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENGINE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="EXECUTION_ENGINE" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">OUTPUT</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label"></label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="OUTPUT" />
              </div>
            </div>
            <button class="btn btn-dark-blue" style="float: right;" type="submit" id="insertData">提交</button>
          </form>
          <br/>
        </div>
      </div>
    </div>

  </div>
  <%@ include file="footer.html"%>
</div>

<script src="/js/excanvas.min.js"></script>
<script src="/js/jquery-ui.custom.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.flot.min.js"></script>
<script src="/js/jquery.flot.resize.min.js"></script>
<script src="/js/jquery.sparkline.min.js"></script>
<script src="/js/fullcalendar.min.js"></script>

<script src="/js/jquery.nicescroll.min.js"></script>
<script src="/js/unicorn.js"></script>
<script src="/js/unicorn.dashboard.js"></script>
</body>
</html>
