<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Magic Center</title>
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
  <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
  <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
      alert(UE.getEditor('editor').isFocus());
      UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
      UE.getEditor('editor').blur();
      UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
      var value = prompt('插入html代码', '');
      UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
      enableBtn();
      UE.getEditor('editor');
    }
    function getAllHtml() {
      alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
      var arr = [];
      arr.push("使用editor.getContent()方法可以获得编辑器的内容");
      arr.push("内容为：");
      arr.push(UE.getEditor('editor').getContent());
      alert(arr.join("\n"));
    }
    function getPlainTxt() {
      var arr = [];
      arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
      arr.push("内容为：");
      arr.push(UE.getEditor('editor').getPlainTxt());
      alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
      var arr = [];
      arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
      UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
      alert(arr.join("\n"));
    }
    function setDisabled() {
      UE.getEditor('editor').setDisabled('fullscreen');
      disableBtn("enable");
    }

    function setEnabled() {
      UE.getEditor('editor').setEnabled();
      enableBtn();
    }

    function getText() {
      //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
      var range = UE.getEditor('editor').selection.getRange();
      range.select();
      var txt = UE.getEditor('editor').selection.getText();
      alert(txt)
    }

    function getContentTxt() {
      var arr = [];
      arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
      arr.push("编辑器的纯文本内容为：");
      arr.push(UE.getEditor('editor').getContentTxt());
      alert(arr.join("\n"));
    }
    function hasContent() {
      var arr = [];
      arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
      arr.push("判断结果为：");
      arr.push(UE.getEditor('editor').hasContents());
      alert(arr.join("\n"));
    }
    function setFocus() {
      UE.getEditor('editor').focus();
    }
    function deleteEditor() {
      disableBtn();
      UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
      var div = document.getElementById('btns');
      var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
      for (var i = 0, btn; btn = btns[i++];) {
        if (btn.id == str) {
          UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        } else {
          btn.setAttribute("disabled", "true");
        }
      }
    }
    function enableBtn() {
      var div = document.getElementById('btns');
      var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
      for (var i = 0, btn; btn = btns[i++];) {
        UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
      }
    }

    function getLocalData () {
      alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
      UE.getEditor('editor').execCommand( "clearlocaldata" );
      alert("已清空草稿箱")
    }
  </script>

  <script type="text/javascript">
    function updateData () {
      $.ajax({
        type: "POST",
        url: "/admin/update",
        data: $("#updateForm").serialize(),
        dataType:"json",
        success: function (data) {
          if (data.code == 400) {
            alert(data.message)
          } else {
            alert(data.message);
            window.location.href = '/admin/query';
          }
        },
        error:function(){
          alert("system error");
        }
      });
    }
  </script>
  <script type="text/javascript">
    $(function () {
      $("#updateData").click(function(){
        updateData();
      })
    })
  </script>
</head>
<body data-color="grey" class="flat">
<div id="wrapper">

  <%@ include file="header.html"%>
  <%@ include file="switcher.html"%>
  <%@ include file="sidebar.html"%>
  <div id="content">
    <div id="content-header" class="mini">
      <h1>插入数据库样例</h1>
    </div>
    <div id="breadcrumb">
      <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
      <a href="#" class="current">插入数据库样例</a>
    </div>



    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12">


          <form method="post" class="form-horizontal" id="updateForm">

                <input type="hidden" value="${task.id}" name="id">
                <input type="hidden" value="${task.name}" name="name">
                <input type="hidden" value="${task.createTime}" name="createTime">
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">主题</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="task_theme" value="${task.task_theme}" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 col-md-3 col-lg-2 control-label">类别</label>
              <div class="col-sm-3 col-md-9 col-lg-10">
                <input type="text" class="form-control input-sm" name="task_type" value="${task.task_type}" />
              </div>
            </div>
            <div>
              <script id="editor" name="task_con" type="text/plain" style="width:1100px;height:500px;">
               ${task.task_con}
              </script>
            </div>
            <button class="btn btn-dark-blue" type="button" id="updateData">更新</button>
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
