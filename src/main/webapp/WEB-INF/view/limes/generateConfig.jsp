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
      <h1>参数配置</h1>
    </div>
    <div id="breadcrumb">
      <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
      <a href="#" class="current">参数配置</a>
    </div>



    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12">


          <form class="form-horizontal" id="insertForm" action="submitConfig">

            <div class="form-group current-prefix">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">PREFIX <button id="AddPrefix" class="btn btn-dark-blue" style="float: right;" type="button">+PREFIX</button></label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="PREFIXs[0].NAMESPACE" placeholder="http://geovocab.org/geometry#" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="PREFIXs[0].LABEL" placeholder="geom"/>
              </div>
            </div>



            <%--<div class="form-group">--%>
              <%--<label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">PREFIX</label>--%>
              <%--<label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>--%>
              <%--<div class="col-sm-3 col-md-9 col-lg-10">--%>
                <%--<input type="text" class="form-control input-sm" name="PREFIXs[1].NAMESPACE" placeholder="http://www.opengis.net/ont/geosparql#" />--%>
              <%--</div>--%>
              <%--<label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>--%>
              <%--<div class="col-sm-3 col-md-9 col-lg-10">--%>
                <%--<input type="text" class="form-control input-sm" name="PREFIXs[1].LABEL" placeholder="geos" />--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
              <%--<label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">PREFIX</label>--%>
              <%--<label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>--%>
              <%--<div class="col-sm-3 col-md-9 col-lg-10">--%>
                <%--<input type="text" class="form-control input-sm" name="PREFIXs[2].NAMESPACE" placeholder="http://linkedgeodata.org/ontology/" />--%>
              <%--</div>--%>
              <%--<label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>--%>
              <%--<div class="col-sm-3 col-md-9 col-lg-10">--%>
                <%--<input type="text" class="form-control input-sm" name="PREFIXs[2].LABEL" placeholder="lgdo" />--%>
              <%--</div>--%>
            <%--</div>--%>



            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">SOURCE</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ID</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="source.ID" placeholder="linkedgeodata" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENDPOINT</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="source.ENDPOINT" placeholder="username/filename" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">VAR</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="source.VAR" placeholder="?x" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PAGESIZE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="source.PAGESIZE" placeholder="2000" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RESTRICTION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="source.RESTRICTION" placeholder="?x a lgdo:RelayBox" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PROPERTY</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="source.PROPERTY" placeholder="geom:geometry/geos:asWKT RENAME polygon" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">TARGET</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ID</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="target.ID" placeholder="linkedgeodata" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENDPOINT</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="target.ENDPOINT" placeholder="username/filename" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">VAR</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="target.VAR" placeholder="?y" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PAGESIZE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="target.PAGESIZE" placeholder="2000" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RESTRICTION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="target.RESTRICTION" placeholder="?y a lgdo:RelayBox" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PROPERTY</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="target.PROPERTY" placeholder="geom:geometry/geos:asWKT RENAME polygon" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">METRIC</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label"></label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="METRIC" placeholder="geo_hausdorff(x.polygon, y.polygon)" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">ACCEPTANCE</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">THRESHOLD</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="acceptance.THRESHOLD" placeholder="0.9"  />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">FILE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="acceptance.FILE" placeholder="lgd_relaybox_verynear.nt" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RELATION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="acceptance.RELATION" placeholder="lgdo:near" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">REVIEW</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">THRESHOLD</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="review.THRESHOLD" placeholder="0.5" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">FILE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="review.FILE" placeholder="lgd_relaybox_near.nt" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">RELATION</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="review.RELATION" placeholder="lgdo:near" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">EXECUTION</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">REWRITER</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="execution.REWRITER" placeholder="default" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">PLANNER</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="execution.PLANNER" placeholder="default" />
              </div>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENGINE</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="execution.ENGINE" placeholder="default" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">OUTPUT</label>
              <label class="col-sm-3 col-md-3 col-lg-2 control-label"></label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="OUTPUT" placeholder="TAB" />
              </div>
            </div>
            <button class="btn btn-dark-blue" style="float: right;" type="submit" id="insertData">提交</button>
          </form>
          <%--<br/>--%>
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
