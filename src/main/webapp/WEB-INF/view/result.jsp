<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <script type="text/javascript">
    function deleteData (taskId) {
      var formId = "#deleteForm" + taskId;
      $.ajax({
        type: "POST",
        url: "/admin/delete",
        data: $(formId).serialize(),
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
        <a href="/admin/query">刷新</a>
      </div>

    </div>
      <table border="1px">
        <tbody>
        <tr>
          <th>id</th>
          <th>name</th>
          <th>主题</th>
          <th>类别</th>
          <th>createTime</th>
          <th>updateTime</th>
          <th>操作</th>
          <th>操作</th>
        </tr>
        <c:forEach items="${taskList}" var="tmp" varStatus="index">
          <tr>
              <td>${tmp.id}</td>
              <td>${tmp.name}</td>
              <td>${tmp.task_theme}</td>
              <td>${tmp.task_type}</td>
              <td>${tmp.createTime}</td>
              <td><fmt:formatDate value="${tmp.updateTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
              <td><form id="deleteForm${tmp.id}">
                <input type="hidden" name="id" value="${tmp.id}"/>
                <button type="button" onclick="deleteData(${tmp.id})">删除</button></form>
                </td>
              <td><a href="/admin/queryone?id=${tmp.id}">查看</a> </td>

          </tr>
        </c:forEach>
        </tbody>
      </table>

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
