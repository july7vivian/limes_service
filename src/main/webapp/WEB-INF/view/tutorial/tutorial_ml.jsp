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
            <a href="#" class="current">Machine Learning</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">


                    <div class="page-wrapper" tabindex="-1" role="main">
                        <div class="page-inner">

                            <div id="book-search-results">
                                <div class="search-noresults">

                                    <section class="normal markdown-section">

                                        <h1 id="machine-learning">Machine Learning</h1>
                                        <p>In most cases, finding a good metric expression (i.s. one that achieve high F-Measure) is not a trivial task. Therefore, in LIMES we implemented a number of machine learning algorithm for auto-generation of metric (also called Link Specification). For using a machine learning algorithm in your configuration file use the <code>MLALGORITHM</code> tag instead of the <code>METRIC</code> tag. For example:</p>
                                        <pre><code>&lt;MLALGORITHM&gt;
    &lt;NAME&gt;wombat simple&lt;/NAME&gt;
    &lt;TYPE&gt;supervised batch&lt;/TYPE&gt;
    &lt;TRAINING&gt;trainingData.nt&lt;/TRAINING&gt;
    &lt;PARAMETER&gt;
        &lt;NAME&gt;max execution time in minutes&lt;/NAME&gt;
        &lt;VALUE&gt;60&lt;/VALUE&gt;
    &lt;/PARAMETER&gt;
&lt;/MLALGORITHM&gt;
</code></pre><p>In particular:</p>
                                        <ul>
                                            <li>The the tag <code>NAME</code> contains the name of the machine learning algorithm. Currently, we implemented the folowing algorithms:<ul>
                                                <li>womabt simple</li>
                                                <li>wombat complete</li>
                                                <li>eagle</li>
                                            </ul>
                                            </li>
                                            <li>The the tag <code>TYPE</code> contains the type of the machine learning algorithm, which could tak one of the values:<ul>
                                                <li>supervised batch</li>
                                                <li>supervised active</li>
                                                <li>unsupervised</li>
                                            </ul>
                                            </li>
                                            <li>The the tag <code>TRAINING</code> contains the full path to the training data file. Note that this tag is not required in case of the supervised active and unsupervised learning algorithms</li>
                                            <li>The the tag <code>PARAMETER</code> contains the the name (using the sub-tag <code>NAME</code>) and the value (using the sub-tag <code>VALUE</code>) of the used machine learning algorithm parameter. User can use as many <code>PARAMETER</code> tags as it is required. Note that LIMES uses the default values of all unspecified parameters. </li>
                                        </ul>
                                        <p>The following table contains a list of implemented algorithms together with supported implementations and parameters.</p>
                                        <p><style type="text/css">
                                            .tg  {border-collapse:collapse;border-spacing:0;}
                                            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
                                            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
                                            .tg .tg-baqh{text-align:center;vertical-align:top}
                                            .tg .tg-yw4l{vertical-align:top}
                                        </style></p>
                                        <table class="tg">
                                            <tbody><tr>
                                                <th class="tg-yw4l">ML Algorithm<br></th>
                                                <th class="tg-yw4l">Supported types<br></th>
                                                <th class="tg-yw4l">Parameter</th>
                                                <th class="tg-yw4l">Default Value<br></th>
                                                <th class="tg-yw4l">Note</th>
                                            </tr>
                                            <tr>
                                                <td class="tg-baqh" rowspan="13">WOMBAT Simple<br></td>
                                                <td class="tg-yw4l" rowspan="13">supervised batch, supervised active and unsupervised</td>
                                                <td class="tg-yw4l">max refinement tree size</td>
                                                <td class="tg-yw4l">2000</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max iterations number</td>
                                                <td class="tg-yw4l">3</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max iteration time in minutes</td>
                                                <td class="tg-yw4l">20</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max execution time in minutes</td>
                                                <td class="tg-yw4l">600</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max fitness threshold</td>
                                                <td class="tg-yw4l">1</td>
                                                <td class="tg-yw4l">Range 0 to 1</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">minimum property coverage</td>
                                                <td class="tg-yw4l">0.4</td>
                                                <td class="tg-yw4l">Range 0 to 1</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">property learning rate</td>
                                                <td class="tg-yw4l">0.9</td>
                                                <td class="tg-yw4l">Range 0 to 1</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">overall penalty weight</td>
                                                <td class="tg-yw4l">0.5<br></td>
                                                <td class="tg-yw4l">Range 0 to 1<br></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">children penalty weight</td>
                                                <td class="tg-yw4l">1</td>
                                                <td class="tg-yw4l">Range 0 to 1</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">complexity penalty weight</td>
                                                <td class="tg-yw4l">1</td>
                                                <td class="tg-yw4l">Range 0 to 1</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">verbose</td>
                                                <td class="tg-yw4l">false</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">atomic measures</td>
                                                <td class="tg-yw4l">jaccard, trigrams, cosine, qgrams</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">save mapping</td>
                                                <td class="tg-yw4l">true</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">WOMBAT Complete<br></td>
                                                <td class="tg-yw4l">supervised batch, supervised active and unsupervised</td>
                                                <td class="tg-yw4l" colspan="3">Same as WOMBAT Simple<br></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l" rowspan="13">EAGLE</td>
                                                <td class="tg-yw4l" rowspan="13">supervised batch, supervised active and unsupervised</td>
                                                <td class="tg-yw4l">generations</td>
                                                <td class="tg-yw4l">10</td>
                                                <td class="tg-yw4l">Integer</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">preserve_fittest</td>
                                                <td class="tg-yw4l">true</td>
                                                <td class="tg-yw4l"></td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max_duration</td>
                                                <td class="tg-yw4l">60</td>
                                                <td class="tg-yw4l">[1,Inf)</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">inquiry_size</td>
                                                <td class="tg-yw4l">10</td>
                                                <td class="tg-yw4l">[1,Inf)</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max_iterations</td>
                                                <td class="tg-yw4l">500</td>
                                                <td class="tg-yw4l">[1,Inf)</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">max_quality</td>
                                                <td class="tg-yw4l">0.5</td>
                                                <td class="tg-yw4l">[0.0,1.0]</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">termination_criteria</td>
                                                <td class="tg-yw4l">iteration</td>
                                                <td class="tg-yw4l">enum</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">termination_criteria_value</td>
                                                <td class="tg-yw4l">0.0</td>
                                                <td class="tg-yw4l">[0.0,Inf)</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">beta</td>
                                                <td class="tg-yw4l">1.0</td>
                                                <td class="tg-yw4l">[0.0,1.0]</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">population</td>
                                                <td class="tg-yw4l">20</td>
                                                <td class="tg-yw4l">[1,Inf)</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">mutation_rate</td>
                                                <td class="tg-yw4l">0.4</td>
                                                <td class="tg-yw4l">[0.0,1.0]</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">reproduction_rate</td>
                                                <td class="tg-yw4l">0.4</td>
                                                <td class="tg-yw4l">[0.0,1.0]</td>
                                            </tr>
                                            <tr>
                                                <td class="tg-yw4l">crossover_rate</td>
                                                <td class="tg-yw4l">0.3</td>
                                                <td class="tg-yw4l">[0.0,1.0]</td>
                                            </tr>
                                            </tbody></table>


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


                <a href="/tutorial/metric" class="navigation navigation-prev " aria-label="Previous page: Congifuration">
                    <i class="fa fa-angle-left"></i>
                </a>


                <a href="/tutorial/accept" class="navigation navigation-next " aria-label="Next page: Prefix" style="margin-right: 0px;">
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
