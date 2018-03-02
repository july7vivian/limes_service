<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>OpenKG Linkage</title>
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

    <%@ include file="../header.html"%>
    <%@ include file="../sidebar.html"%>


    <div id="content">
        <div id="content-header" class="mini">
            <h1>使用指南</h1>
        </div>
        <div id="breadcrumb">
            <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
            <%--<a href="#" title="Go to Home" class="current">Home</a>--%>
            <a href="#" class="current">使用指南</a>
            <a href="#" class="current">配置文件</a>
            <a href="#" class="current">配置示例</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">


                    <div class="page-wrapper" tabindex="-1" role="main">
                        <div class="page-inner">

                            <div id="book-search-results">
                                <div class="search-noresults">

                                    <section class="normal markdown-section">

                                        <h1 id="configuration-file-examples">配置示例</h1>
                                        <p>下面用代码的形式给出使用相似度度量算法的完整的配置，用户只需在网页配置页面填入对应的值即可。</p>
                                        <pre><code class="lang-xml">
    <span class="hljs-tag">&lt;<span class="hljs-name">PREFIX</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAMESPACE</span>&gt;</span>http://geovocab.org/geometry#<span class="hljs-tag">&lt;/<span class="hljs-name">NAMESPACE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">LABEL</span>&gt;</span>geom<span class="hljs-tag">&lt;/<span class="hljs-name">LABEL</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">PREFIX</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">PREFIX</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAMESPACE</span>&gt;</span>http://www.opengis.net/ont/geosparql#<span class="hljs-tag">&lt;/<span class="hljs-name">NAMESPACE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">LABEL</span>&gt;</span>geos<span class="hljs-tag">&lt;/<span class="hljs-name">LABEL</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">PREFIX</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">PREFIX</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAMESPACE</span>&gt;</span>http://linkedgeodata.org/ontology/<span class="hljs-tag">&lt;/<span class="hljs-name">NAMESPACE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">LABEL</span>&gt;</span>lgdo<span class="hljs-tag">&lt;/<span class="hljs-name">LABEL</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">PREFIX</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">SOURCE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ID</span>&gt;</span>linkedgeodata<span class="hljs-tag">&lt;/<span class="hljs-name">ID</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ENDPOINT</span>&gt;</span>http://linkedgeodata.org/sparql<span class="hljs-tag">&lt;/<span class="hljs-name">ENDPOINT</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">VAR</span>&gt;</span>?x<span class="hljs-tag">&lt;/<span class="hljs-name">VAR</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PAGESIZE</span>&gt;</span>2000<span class="hljs-tag">&lt;/<span class="hljs-name">PAGESIZE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RESTRICTION</span>&gt;</span>?x a lgdo:RelayBox<span class="hljs-tag">&lt;/<span class="hljs-name">RESTRICTION</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PROPERTY</span>&gt;</span>geom:geometry/geos:asWKT RENAME polygon<span class="hljs-tag">&lt;/<span class="hljs-name">PROPERTY</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">SOURCE</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">TARGET</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ID</span>&gt;</span>linkedgeodata<span class="hljs-tag">&lt;/<span class="hljs-name">ID</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ENDPOINT</span>&gt;</span>http://linkedgeodata.org/sparql<span class="hljs-tag">&lt;/<span class="hljs-name">ENDPOINT</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">VAR</span>&gt;</span>?y<span class="hljs-tag">&lt;/<span class="hljs-name">VAR</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PAGESIZE</span>&gt;</span>2000<span class="hljs-tag">&lt;/<span class="hljs-name">PAGESIZE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RESTRICTION</span>&gt;</span>?y a lgdo:RelayBox<span class="hljs-tag">&lt;/<span class="hljs-name">RESTRICTION</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PROPERTY</span>&gt;</span>geom:geometry/geos:asWKT RENAME polygon<span class="hljs-tag">&lt;/<span class="hljs-name">PROPERTY</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">TARGET</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">METRIC</span>&gt;</span>geo_hausdorff(x.polygon, y.polygon)<span class="hljs-tag">&lt;/<span class="hljs-name">METRIC</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">ACCEPTANCE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">THRESHOLD</span>&gt;</span>0.9<span class="hljs-tag">&lt;/<span class="hljs-name">THRESHOLD</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">FILE</span>&gt;</span>lgd_relaybox_verynear.nt<span class="hljs-tag">&lt;/<span class="hljs-name">FILE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RELATION</span>&gt;</span>lgdo:near<span class="hljs-tag">&lt;/<span class="hljs-name">RELATION</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">ACCEPTANCE</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">REVIEW</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">THRESHOLD</span>&gt;</span>0.5<span class="hljs-tag">&lt;/<span class="hljs-name">THRESHOLD</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">FILE</span>&gt;</span>lgd_relaybox_near.nt<span class="hljs-tag">&lt;/<span class="hljs-name">FILE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RELATION</span>&gt;</span>lgdo:near<span class="hljs-tag">&lt;/<span class="hljs-name">RELATION</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">REVIEW</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">OUTPUT</span>&gt;</span>TAB<span class="hljs-tag">&lt;/<span class="hljs-name">OUTPUT</span>&gt;</span>
</code></pre>

                                        <p>下面的示例为使用机器学习算法的完整的配置：</p>
                                        <pre><code class="lang-xml">
    <span class="hljs-tag">&lt;<span class="hljs-name">PREFIX</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAMESPACE</span>&gt;</span>http://geovocab.org/geometry#<span class="hljs-tag">&lt;/<span class="hljs-name">NAMESPACE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">LABEL</span>&gt;</span>geom<span class="hljs-tag">&lt;/<span class="hljs-name">LABEL</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">PREFIX</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">PREFIX</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAMESPACE</span>&gt;</span>http://www.opengis.net/ont/geosparql#<span class="hljs-tag">&lt;/<span class="hljs-name">NAMESPACE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">LABEL</span>&gt;</span>geos<span class="hljs-tag">&lt;/<span class="hljs-name">LABEL</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">PREFIX</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">PREFIX</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAMESPACE</span>&gt;</span>http://linkedgeodata.org/ontology/<span class="hljs-tag">&lt;/<span class="hljs-name">NAMESPACE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">LABEL</span>&gt;</span>lgdo<span class="hljs-tag">&lt;/<span class="hljs-name">LABEL</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">PREFIX</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">SOURCE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ID</span>&gt;</span>linkedgeodata<span class="hljs-tag">&lt;/<span class="hljs-name">ID</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ENDPOINT</span>&gt;</span>http://linkedgeodata.org/sparql<span class="hljs-tag">&lt;/<span class="hljs-name">ENDPOINT</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">VAR</span>&gt;</span>?x<span class="hljs-tag">&lt;/<span class="hljs-name">VAR</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PAGESIZE</span>&gt;</span>2000<span class="hljs-tag">&lt;/<span class="hljs-name">PAGESIZE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RESTRICTION</span>&gt;</span>?x a lgdo:RelayBox<span class="hljs-tag">&lt;/<span class="hljs-name">RESTRICTION</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PROPERTY</span>&gt;</span>geom:geometry/geos:asWKT RENAME polygon<span class="hljs-tag">&lt;/<span class="hljs-name">PROPERTY</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">SOURCE</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">TARGET</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ID</span>&gt;</span>linkedgeodata<span class="hljs-tag">&lt;/<span class="hljs-name">ID</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ENDPOINT</span>&gt;</span>http://linkedgeodata.org/sparql<span class="hljs-tag">&lt;/<span class="hljs-name">ENDPOINT</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">VAR</span>&gt;</span>?y<span class="hljs-tag">&lt;/<span class="hljs-name">VAR</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PAGESIZE</span>&gt;</span>2000<span class="hljs-tag">&lt;/<span class="hljs-name">PAGESIZE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RESTRICTION</span>&gt;</span>?y a lgdo:RelayBox<span class="hljs-tag">&lt;/<span class="hljs-name">RESTRICTION</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PROPERTY</span>&gt;</span>geom:geometry/geos:asWKT RENAME polygon<span class="hljs-tag">&lt;/<span class="hljs-name">PROPERTY</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">TARGET</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">MLALGORITHM</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">NAME</span>&gt;</span>wombat simple<span class="hljs-tag">&lt;/<span class="hljs-name">NAME</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">TYPE</span>&gt;</span>supervised batch<span class="hljs-tag">&lt;/<span class="hljs-name">TYPE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">TRAINING</span>&gt;</span>trainingData.nt<span class="hljs-tag">&lt;/<span class="hljs-name">TRAINING</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PARAMETER</span>&gt;</span>
            <span class="hljs-tag">&lt;<span class="hljs-name">NAME</span>&gt;</span>max execution time in minutes<span class="hljs-tag">&lt;/<span class="hljs-name">NAME</span>&gt;</span>
            <span class="hljs-tag">&lt;<span class="hljs-name">VALUE</span>&gt;</span>60<span class="hljs-tag">&lt;/<span class="hljs-name">VALUE</span>&gt;</span>
        <span class="hljs-tag">&lt;/<span class="hljs-name">PARAMETER</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">MLALGORITHM</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">ACCEPTANCE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">THRESHOLD</span>&gt;</span>0.9<span class="hljs-tag">&lt;/<span class="hljs-name">THRESHOLD</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">FILE</span>&gt;</span>lgd_relaybox_verynear.nt<span class="hljs-tag">&lt;/<span class="hljs-name">FILE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RELATION</span>&gt;</span>lgdo:near<span class="hljs-tag">&lt;/<span class="hljs-name">RELATION</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">ACCEPTANCE</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">REVIEW</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">THRESHOLD</span>&gt;</span>0.5<span class="hljs-tag">&lt;/<span class="hljs-name">THRESHOLD</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">FILE</span>&gt;</span>lgd_relaybox_near.nt<span class="hljs-tag">&lt;/<span class="hljs-name">FILE</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">RELATION</span>&gt;</span>lgdo:near<span class="hljs-tag">&lt;/<span class="hljs-name">RELATION</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">REVIEW</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">OUTPUT</span>&gt;</span>TAB<span class="hljs-tag">&lt;/<span class="hljs-name">OUTPUT</span>&gt;</span>
</code></pre>


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


                <a href="/tutorial/review" class="navigation navigation-prev " aria-label="Previous page: Congifuration">
                    <i class="fa fa-angle-left"></i>
                </a>


                <%--<a href="/tutorial/example" class="navigation navigation-next " aria-label="Next page: Prefix" style="margin-right: 0px;">--%>
                    <%--<i class="fa fa-angle-right"></i>--%>
                <%--</a>--%>


            </div>





        </div>
    </div>
    <%@ include file="../footer.html"%>


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
    <script id="unicorn" src="/js/unicorn.js"  data="id=1"></script>
    <script src="/js/unicorn.dashboard.js"></script>



</body>
</html>
