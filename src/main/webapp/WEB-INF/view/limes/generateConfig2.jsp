<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>OpenKG Linkage</title>
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



    <script type="text/javascript">
        //    var count=1;
        var count=2;
        function addItem() {

            var prefix = '<div class="form-group" id = "prefix_'+count+'">' +

                '<label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>' +
                '<div class="col-sm-3 col-md-9 col-lg-10">' +
                '<input type="text" class="form-control input-sm" name="PREFIXs['+count+'].NAMESPACE" placeholder="http://www.w3.org/2000/01/rdf-schema#" />' +
                '</div>' +
                '<label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>' +
                '<div class="col-sm-3 col-md-9 col-lg-10"><input type="text" class="form-control input-sm" name="PREFIXs['+count+'].LABEL" placeholder="w3"/>' +
                '</div>' +
                '<label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">' +
                '<button id="deletePrefix'+count+'" class="btn btn-dark-red" style="float: right;" type="button" onclick="deleteItem()">DELETE</button>' +
                '</label>'+
                '</div>';


//        var form = document.getElementById("insertForm");
            var form = document.getElementById("firstPrefix");
//        form.insertAdjacentHTML("afterBegin",prefix);
            form.insertAdjacentHTML("afterEnd",prefix);
//        $(this).removeClass('current-prefix');
            count++;
        }

        function deleteItem() {

            var id = event.target.id;
            var len = "deletePrefix".length;
            var index = id.substring(len, id.length);
            var prefix = "prefix_"+index;
//        alert(prefix);
            var parent = document.getElementById("insertForm");
            var child = document.getElementById(prefix);
            parent.removeChild(child);

        }

    </script>



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

D
                    <form class="form-horizontal" id="insertForm" action="submitConfig" method="post">

                        <div class="form-group current-prefix" id="firstPrefix">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">PREFIX <button id="addPrefix" class="btn btn-dark-blue" style="float: right;" type="button"; onclick="addItem()">+PREFIX</button></label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="PREFIXs[0].NAMESPACE" value="http://www.w3.org/2000/01/rdf-schema#" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="PREFIXs[0].LABEL" value="w3"/>
                            </div>
                        </div>

                        <div class="form-group current-prefix" id = "prefix_1">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">NAMESPACE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="PREFIXs[1].NAMESPACE" value="http://cndbpedia/ontology/" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">LABEL</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="PREFIXs[1].LABEL" value="cndbo"/>
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">SOURCE</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">ID</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.ID" value="data1" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENDPOINT</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.ENDPOINT" value="/Users/dluo/Desktop/linkage_data/Expression/cndbpedia.nt" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">VAR</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.VAR" value="?x" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">PAGESIZE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.PAGESIZE" value="-1" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">RESTRICTION</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.RESTRICTION" value="?x cndbo:实体名称 ?z1" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">PROPERTY</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.PROPERTY" value="cndbo:实体名称 RENAME label" />
                            </div>

                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">TYPE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="source.TYPE" value="NT" />
                            </div>


                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">TARGET</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">ID</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.ID" value="data2" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENDPOINT</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.ENDPOINT" value="/Users/dluo/Desktop/linkage_data/Expression/zhwiki.nt" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">VAR</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.VAR" value="?y" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">PAGESIZE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.PAGESIZE" value="-1" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">RESTRICTION</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.RESTRICTION" value="?y w3:label ?z2" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">PROPERTY</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.PROPERTY" value="w3:label AS nolang" />
                            </div>

                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">TYPE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="target.TYPE" value="NT" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">METRIC</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label"></label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="METRIC" value="ExactMatch(x.label, y.w3:label) | 0.9" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">ACCEPTANCE</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">THRESHOLD</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="acceptance.THRESHOLD" value="1.0"  />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">FILE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="acceptance.FILE" value="verynear.nt" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">RELATION</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="acceptance.RELATION" value="w3:sameAs" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">REVIEW</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">THRESHOLD</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="review.THRESHOLD" value="0.5" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">FILE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="review.FILE" value="near.nt" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">RELATION</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="review.RELATION" value="w3:near" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">EXECUTION</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">REWRITER</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="execution.REWRITER" value="default" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">PLANNER</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="execution.PLANNER" value="default" />
                            </div>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label">ENGINE</label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="execution.ENGINE" value="default" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label" style="width: 100%;text-align:left">OUTPUT</label>
                            <label class="col-sm-3 col-md-3 col-lg-2 control-label"></label>
                            <div class="col-sm-3 col-md-9 col-lg-10">
                                <input type="text" class="form-control input-sm" name="OUTPUT" value="TAB" />
                            </div>
                        </div>
                        <%--<div >--%>
                        <%--<button class="btn btn-dark-blue" style="float: right;" type="submit" id="insertData">提交</button>--%>
                        <button class="btn btn-dark-blue" style="margin-left: 50%" type="submit" id="insertData">提交</button>
                        <%--</div>--%>
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
