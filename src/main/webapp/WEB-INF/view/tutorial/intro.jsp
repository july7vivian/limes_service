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
            <a href="#" class="current">简介</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">

                        <div class="page-wrapper" tabindex="-1" role="main">
                            <div class="page-inner">

                                <div id="book-search-results">
                                    <div class="search-noresults">

                                        <section class="normal markdown-section">

                                            <h1 id="user-manual-version-100">User Manual (Version 1.0.0)</h1>
                                            <p>LIMES, the <strong>Li</strong>nk Discovery Framework for <strong>Me</strong>tric <strong>S</strong>paces, is a
                                                framework for discovering links between entities contained in Linked
                                                Data sources. LIMES is a hybrid framework that combines the mathematical
                                                characteristics of metric spaces as well prefix-, suffix- and position
                                                filtering to compute pessimistic approximations of the similarity of
                                                instances. These approximations are then used to filter out a large
                                                amount of those instance pairs that do not suffice the mapping
                                                conditions. By these means, LIMES can reduce the number of comparisons
                                                needed during the mapping process by several orders of magnitude and
                                                complexity without loosing a single link.</p>
                                            <p><img src="/img/tutorial/uml.png" alt="LIMES workflow" title="fig:"></p>
                                            <p>The LIMES framework consists of eight main modules of which each can be extended to accommodate new or improved functionality. The central modules of LIMES is the <strong>controller</strong> module, which coordinates the matching process. The matching process is carried out as follows: First, the <strong>controller</strong> calls the <strong>configuration</strong> module, which reads the configuration file and extracts all the information necessary to carry out the comparison of instances, including the URL of the SPARQL-endpoints of source (S) and the target (T) knowledge bases, the restrictions on the instances to map (e.g., their type), the expression of the metric to be used and the threshold to be used. </p>
                                            <p>Given that the configuration file is valid w.r.t. the LIMES Specification Language (LSL), the <strong>query</strong> module is called. This module uses the configuration for the target and source knowledge bases to retrieve instances and properties from the SPARQL-endpoints of the source and target knowledge bases that adhere to the restrictions specified in the configuration file. The query module writes its output into a file by invoking the <strong>cache</strong> module. Once all instances have been stored in the cache, the controller chooses between performing Link Discovery or Machine Learning. For Link Discovery, LIMES will re-write, plan and execute the Link Specification (LS) included in the configuration file, by calling the <strong>rewriter</strong>, <strong>planner</strong> and <strong>engine</strong> modules resp. The main goal of LD is to identify the set of links (mapping) that satisfy the conditions opposed by the input LS. For Machine Learning, LIMES calls the <strong>machine learning</strong> algorithm included in the configuration file, to identify an appropriate LS to link S and T. Then it proceeds in executing the LS. For both taks, the mapping will be stored in the output file choosen by the user in the configuration file. The results are finally stored into a RDF or a XML file.</p>
                                            <p>The advantages of LIMES’ approach are manifold. First, it implements
                                                <strong>highly time-optimized</strong> mappers, making it a complexity class faster
                                                than other Link Discovery Frameworks. Thus, the larger the problem, the
                                                faster LIMES is w.r.t. other Link Discovery Frameworks. Secondly, LIMES
                                                supports a large set of string, numeric, topological and temporal similarity metrics,
                                                that provide the user with the opportunity to perform various comparisons between resources.
                                                In addition, <strong>LIMES is guaranteed to lead to exactly the same matching as a brute
                                                    force approach while at the same time reducing significantly the number
                                                    of comparisons</strong>. In addition, LIMES supports a <strong>large number of input
                                                    and output formats</strong> and can be extended very easily to fit new
                                                algorithms , new datatypes, new preprocessing functions and others thank
                                                to its modular architecture.</p>
                                            <p>In general, LIMES can be used to set links between two data sources,
                                                e.g., a novel data source created by a data publisher and existing data
                                                source such as DBpedia. This functionality can also be used to
                                                detect duplicates within one data source for knowledge curation. The
                                                only requirement to carry out these tasks is a simple XML-based or TURTLE-based
                                                configuration file. The purpose of this manual is to explicate the LIMES
                                                Configuration Language (LCL) that underlies these configuration files,
                                                so as allow users to generate their own configurations. An online
                                                version of LIMES is available online at
                                                <a href="http://limes.aksw.org" target="_blank">http://limes.aksw.org</a>.</p>


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


                <%--<a href="/tutorial" class="navigation navigation-prev " aria-label="Previous page: Metric Operations">--%>
                    <%--<i class="fa fa-angle-left"></i>--%>
                <%--</a>--%>


                <a href="/tutorial/config" class="navigation navigation-next " aria-label="Next page: Configuration" style="margin-right: 0px;">
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
