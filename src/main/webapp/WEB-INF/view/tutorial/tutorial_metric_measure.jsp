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
            <a href="#" class="current">使用指南</a>
            <a href="#" class="current">配置文件</a>
            <a href="#" class="current">Metric</a>
            <a href="#" class="current">Measures</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">


                    <div class="page-wrapper" tabindex="-1" role="main">
                        <div class="page-inner">

                            <div id="book-search-results">
                                <div class="search-noresults">

                                    <section class="normal markdown-section">

                                        <h1 id="measure-packages">Measure Packages  度量函数包</h1>
                                        <p>平台提供多种度量函数，分别位于不同的工具包中。</p>
                                        <p>主要包括以下几种：</p>
                                        <ul>
                                            <li>string</li>
                                            <li>vector space</li>
                                            <li>pointset</li>
                                            <li>topological</li>
                                            <li>temporal</li>
                                            <li>resource set</li>
                                        </ul>

                                    </section>
                                    <br>
                                    <br>
                                    <section class="normal markdown-section">

                                        <h1 id="string-measures">String Measures 字符串度量函数</h1>
                                        <p>字符串函数包包括以下函数：</p>
                                        <ul>
                                            <li><code>Cosine</code></li>
                                            <li><code>ExactMatch</code></li>
                                            <li><code>Jaccard</code>  </li>
                                            <li><code>Jaro</code></li>
                                            <li><code>JaroWinkler</code> </li>
                                            <li><code>Levenshtein</code></li>
                                            <li><code>MongeElkan</code> </li>
                                            <li><code>Overlap</code></li>
                                            <li><code>Qgrams</code> </li>
                                            <li><code>RatcliffObershelp</code></li>
                                            <li><code>Soundex</code></li>
                                            <li><code>Trigram</code></li>
                                        </ul>
                                        <p>一个包含度量函数，阈值的表达式如下所示：</code>:</p>
                                        <p><code>trigram(x.label, y.title) | 0.8</code></p>
                                        <p>其中，<code>label</code>和<code>title</code> 分别为源数据集和目标数据集的属性，类型都为字符串。</p>


                                    </section>
                                    <br>
                                    <br>
                                    <section class="normal markdown-section">

                                        <h1 id="vector-space-measures">Vector Space Measures 向量空间度量函数</h1>
                                        <p>主要包括以下函数：</p>
                                        <ul>
                                            <li><code>Euclidean</code> 相似度 <ul>
                                                <li>e.g. <code>euclidean(a.wgs84:lat|wgs84:long,b.wgs84:lat|wgs84:long)</code></li>
                                            </ul>
                                            </li>
                                            <li><code>Geo_Orthodromic</code> 距离 </li>
                                            <li><code>Geo_Great_Elliptic</code> 距离</li>
                                        </ul>


                                    </section>
                                    <br>
                                    <br>
                                    <section class="normal markdown-section">

                                        <h1 id="point-set-measures">Point-Set Measures 点集度量函数</h1>
                                        <p>主要包括以下函数：</p>
                                        <ul>
                                            <li><code>Geo_Centroid_Indexed_Hausdorff</code> </li>
                                            <li><code>Geo_Fast_Hausdorff</code> </li>
                                            <li><code>Geo_Hausdorff</code> </li>
                                            <li><code>Geo_Indexed_Hausdorff</code> </li>
                                            <li><code>Geo_Naive_Hausdorff</code></li>
                                            <li><code>Geo_Scan_Indexed_Hausdorff</code></li>
                                            <li><code>Geo_Symmetric_Hausdorff</code></li>
                                            <li><code>Geo_Max</code></li>
                                            <li><code>Geo_Min</code></li>
                                            <li><code>Geo_Mean</code></li>
                                            <li><code>Geo_Avg</code></li>
                                            <li><code>Geo_Frechet</code></li>
                                            <li><code>Geo_Link</code></li>
                                            <li><code>Geo_Sum_Of_Min</code></li>
                                            <li><code>Geo_Naive_Surjection</code></li>
                                            <li><code>Geo_Fair_Surjection</code></li>
                                        </ul>


                                    </section>
                                    <br>
                                    <br>
                                    <section class="normal markdown-section">

                                        <h1 id="topological-measures">Topological Measures 地理空间度量函数</h1>
                                        <p>主要包括以下函数：</p>
                                        <ul>
                                            <li><code>Top_Contains</code></li>
                                            <li><code>Top_Covered_By</code></li>
                                            <li><code>Top_Crosses</code></li>
                                            <li><code>Top_Disjoint</code></li>
                                            <li><code>Top_Equals</code></li>
                                            <li><code>Top_Intersects</code></li>
                                            <li><code>Top_Overlaps</code></li>
                                            <li><code>Top_Touches</code></li>
                                            <li><code>Top_Within</code></li>
                                        </ul>


                                    </section>
                                    <br>
                                    <br>
                                    <section class="normal markdown-section">

                                        <h1 id="temporal-measures">Temporal Measures  时序空间度量函数</h1>
                                        <p>主要包括以下函数：</p>
                                        <ul>
                                            <li><code>Tmp_Concurrent</code>: 源数据集和目标数据集中具有相同开始时间，并由同一machine产生的事件。 例如，Tmp_Concurrent(x.beginDate1|machine1,y.beginDate2|machine2)|1.0。</li>
                                            <li><code>Tmp_Predecessor</code>: 目标数据集中的事件比源数据集中事件先发生。例如，Tmp_Predecessor(x.beginDate1,y.beginDate2)|1.0。
                                            <li><code>Tmp_Successor</code>:目标数据集中的事件比源数据集中事件后发生。例如，Tmp_Successor(x.beginDate1,y.beginDate2)|1.0。</li>
                                        </ul>
                                        <p>Allen时序关系 (<a href="https://en.wikipedia.org/wiki/Allen's_interval_algebra" target="_blank">https://en.wikipedia.org/wiki/Allen's_interval_algebra</a>):</p>
                                        <ul>
                                            <li><code>Tmp_After</code></li>
                                            <li><code>Tmp_Before</code></li>
                                            <li><code>Tmp_During</code></li>
                                            <li><code>Tmp_During_Reverse</code></li>
                                            <li><code>Tmp_Equals</code></li>
                                            <li><code>Tmp_Finishes</code></li>
                                            <li><code>Tmp_Finishes</code></li>
                                            <li><code>Tmp_Is_Finished_By</code></li>
                                            <li><code>Tmp_Is_Met_By</code></li>
                                            <li><code>Tmp_Is_Overlapped_By</code></li>
                                            <li><code>Tmp_Is_Started_By</code></li>
                                            <li><code>Tmp_Meets</code></li>
                                            <li><code>Tmp_Overlaps</code></li>
                                            <li><code>Tmp_Starts</code></li>
                                        </ul>
                                        <p>一个包含时序空间度量函数<code>Tmp_Finishes</code>和阈值<code>theta = 1.0</code>的示例如下：</p>
                                        <p><code>Tmp_Finishes(x.beginDate1|endDate1, y.beginDate2|endDate2) | 0.8</code></p>
                                        <p>其中，<code>beginDate1</code>和<code>beginDate2</code>表示事件的开始时间。<code>endDate1</code>和<code>endDate2</code>表示事件的结束时间。时间格式为：<code>2015-04-22T11:29:51+02:00</code>。</p>


                                    </section>
                                    <%--<br>--%>
                                    <%--<br>--%>
                                    <%--<section class="normal markdown-section">--%>

                                        <%--<h1 id="resource-set-measures">Resource-Set Measures</h1>--%>
                                        <%--<p>To compare sets of resources (e.g. in rdf containers), use the following relations:</p>--%>
                                        <%--<ul>--%>
                                            <%--<li><code>Set_Jaccard</code></li>--%>
                                        <%--</ul>--%>
                                        <%--<p>Please note that rdf collections are not supported yet.</p>--%>


                                    <%--</section>--%>




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


                <a href="/tutorial/metric/bool" class="navigation navigation-prev " aria-label="Previous page: Metric">
                    <i class="fa fa-angle-left"></i>
                </a>


                <a href="/tutorial/machine_learning" class="navigation navigation-next " aria-label="Next page: Bool operations" style="margin-right: 0px;">
                    <i class="fa fa-angle-right"></i>
                </a>


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
