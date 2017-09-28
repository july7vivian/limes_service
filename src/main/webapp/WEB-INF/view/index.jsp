<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Limes 平台</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />



  <link rel="stylesheet" href="/css/gitbook/style.css">
  <link rel="stylesheet" href="/css/gitbook/gitbook-plugin-katex/katex.min.css">
  <link rel="stylesheet" href="/css/gitbook/gitbook-plugin-highlight/website.css">
  <link rel="stylesheet" href="/css/gitbook/gitbook-plugin-search/search.css">
  <link rel="stylesheet" href="/css/gitbook/gitbook-plugin-fontsettings/website.css">



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
  <%--<%@ include file="switcher.html"%>--%>
  <%@ include file="sidebar.html"%>
  <div id="content">
    <div id="content-header" class="mini" >
      <h1>欢迎使用OpenKG Linkage</h1>
    </div>
    <div id="breadcrumb">
      <%--<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>--%>
      <a href="#" ></a>
    </div>



    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12">


          <div class="page-wrapper" tabindex="-1" role="main">
            <div class="page-inner">

              <div id="book-search-results">
                <div class="search-noresults">

                  <section class="normal markdown-section">

                    <h1 id="metadata">OpenKG Linkage</h1>
                    <p>是一个在线实体连接工具，可提供数据集间sameAs关系的连接。</p>

                  </section>

                </div>
                <div class="search-results">
                  <div class="has-results">

                    <h1 class="search-results-title"><span class="search-results-count"></span> results matching "<span class="search-query"></span>"</h1>
                    <ul class="search-results-list"></ul>

                  </div>
                  <div class="no-results">

                    <h1 class="search-results-title">No results matching "<span class="search-query"></span>"</h1>

                  </div>
                </div>
              </div>

            </div>
          </div>


        </div>


        <%--<a href="/tutorial/config" class="navigation navigation-prev " aria-label="Previous page: Congifuration">--%>
          <%--<i class="fa fa-angle-left"></i>--%>
        <%--</a>--%>


        <%--<a href="/tutorial/prefix" class="navigation navigation-next " aria-label="Next page: Prefix" style="margin-right: 0px;">--%>
          <%--<i class="fa fa-angle-right"></i>--%>
        <%--</a>--%>


      </div>





    </div>

  </div>
  <%@ include file="footer.html"%>
</div>

  <script src="/js/gitbook/gitbook.js"></script>
  <script src="/js/gitbook/theme.js"></script>
  <script src="/js/gitbook/gitbook-plugin-search/search-engine.js"></script>
  <script src="/js/gitbook/gitbook-plugin-search/search.js"></script>
  <script src="/js/gitbook/gitbook-plugin-lunr/lunr.min.js"></script>
  <script src="/js/gitbook/gitbook-plugin-lunr/search-lunr.js"></script>
  <script src="/js/gitbook/gitbook-plugin-sharing/buttons.js"></script>
  <script src="/js/gitbook/gitbook-plugin-fontsettings/fontsettings.js"></script>

  <script src="/js/excanvas.min.js"></script>
  <script src="/js/jquery-ui.custom.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/jquery.flot.min.js"></script>
  <script src="/js/jquery.flot.resize.min.js"></script>
  <script src="/js/jquery.sparkline.min.js"></script>
  <script src="/js/fullcalendar.min.js"></script>

  <script src="/js/jquery.nicescroll.min.js"></script>
  <script id="unicorn" src="/js/unicorn.js"></script>
  <script src="/js/unicorn.dashboard.js"></script>
</body>
</html>
