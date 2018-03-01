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
            <a href="#" class="current">Metric Operations</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">


                    <div class="page-wrapper" tabindex="-1" role="main">
                        <div class="page-inner">

                            <div id="book-search-results">
                                <div class="search-noresults">

                                    <section class="normal markdown-section">

                                        <h1 id="metric-operations">Metric operations  Metric 操作</h1>
                                        <p>Metric操作符可结合多个度量函数，包括<code>MIN</code>, <code>MAX</code>和<code>ADD</code>举例如下:</p>
                                        <pre><code>MAX(trigrams(x.rdfs:label,y.dc:title)|0.3,euclidean(x.lat|long, y.latitude|longitude)|0.5).
</code></pre><p>该表达式计算两个子表达式的最大值：</p>
                                        <ol>
                                            <li>数据源x的<code>rdfs:label</code>属性值与数据源y的<code>dc:title</code>属性值的trigram相似性，其值大于等于0.3。</li>
                                            <li>数据源<code>x</code>的<code>lat</code>、<code>long</code>属性值与数据源<code>y</code>的<code>latitude</code>、<code>longitude</code>属性值的二维欧几里得距离，即， <span class="katex"><span class="katex-mathml"><math><semantics><mrow><msqrt><mrow><mo>(</mo><mo>(</mo><mi>x</mi><mi mathvariant="normal">.</mi><mi>l</mi><mi>a</mi><mi>t</mi><mo>−</mo><mi>y</mi><mi mathvariant="normal">.</mi><mi>l</mi><mi>a</mi><mi>t</mi><mi>i</mi><mi>t</mi><mi>u</mi><mi>d</mi><mi>e</mi><msup><mo>)</mo><mn>2</mn></msup><mo>+</mo><mo>(</mo><mi>x</mi><mi mathvariant="normal">.</mi><mi>l</mi><mi>o</mi><mi>n</mi><mi>g</mi><mo>−</mo><mi>y</mi><mi mathvariant="normal">.</mi><mi>l</mi><mi>o</mi><mi>n</mi><mi>g</mi><mi>i</mi><mi>t</mi><mi>u</mi><mi>d</mi><mi>e</mi><msup><mo>)</mo><mn>2</mn></msup><mo>)</mo></mrow></msqrt></mrow><annotation encoding="application/x-tex"> \sqrt{((x.lat- y.latitude)^2 + (x.long - y.longitude)^2)} </annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="strut" style="height:0.9350050000000001em;"></span><span class="strut bottom" style="height:1.24001em;vertical-align:-0.3050049999999999em;"></span><span class="base textstyle uncramped"><span class="mord sqrt"><span class="sqrt-sign" style="top:-0.04500500000000007em;"><span class="style-wrap reset-textstyle textstyle uncramped"><span class="delimsizing size1">√</span></span></span><span class="vlist"><span style="top:0em;"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:1em;">​</span></span><span class="mord textstyle cramped"><span class="mopen">(</span><span class="mopen">(</span><span class="mord mathit">x</span><span class="mord mathrm">.</span><span class="mord mathit" style="margin-right:0.01968em;">l</span><span class="mord mathit">a</span><span class="mord mathit">t</span><span class="mbin">−</span><span class="mord mathit" style="margin-right:0.03588em;">y</span><span class="mord mathrm">.</span><span class="mord mathit" style="margin-right:0.01968em;">l</span><span class="mord mathit">a</span><span class="mord mathit">t</span><span class="mord mathit">i</span><span class="mord mathit">t</span><span class="mord mathit">u</span><span class="mord mathit">d</span><span class="mord mathit">e</span><span class="mclose"><span class="mclose">)</span><span class="msupsub"><span class="vlist"><span style="top:-0.289em;margin-right:0.05em;"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:0em;">​</span></span><span class="reset-textstyle scriptstyle cramped mtight"><span class="mord mathrm mtight">2</span></span></span><span class="baseline-fix"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:0em;">​</span></span>​</span></span></span></span><span class="mbin">+</span><span class="mopen">(</span><span class="mord mathit">x</span><span class="mord mathrm">.</span><span class="mord mathit" style="margin-right:0.01968em;">l</span><span class="mord mathit">o</span><span class="mord mathit">n</span><span class="mord mathit" style="margin-right:0.03588em;">g</span><span class="mbin">−</span><span class="mord mathit" style="margin-right:0.03588em;">y</span><span class="mord mathrm">.</span><span class="mord mathit" style="margin-right:0.01968em;">l</span><span class="mord mathit">o</span><span class="mord mathit">n</span><span class="mord mathit" style="margin-right:0.03588em;">g</span><span class="mord mathit">i</span><span class="mord mathit">t</span><span class="mord mathit">u</span><span class="mord mathit">d</span><span class="mord mathit">e</span><span class="mclose"><span class="mclose">)</span><span class="msupsub"><span class="vlist"><span style="top:-0.289em;margin-right:0.05em;"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:0em;">​</span></span><span class="reset-textstyle scriptstyle cramped mtight"><span class="mord mathrm mtight">2</span></span></span><span class="baseline-fix"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:0em;">​</span></span>​</span></span></span></span><span class="mclose">)</span></span></span><span style="top:-0.855005em;"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:1em;">​</span></span><span class="reset-textstyle textstyle uncramped sqrt-line"></span></span><span class="baseline-fix"><span class="fontsize-ensurer reset-size5 size5"><span style="font-size:1em;">​</span></span>​</span></span></span></span></span></span>，其值大于等于0.5。</li>
                                        </ol>
                                        <p>其中，欧几里得距离可计算任意维度向量之间的距离。 并且<code>ADD</code>操作符允许定义权重值，例如:<code>ADD(0.3*trigrams(x.rdfs:label,y.dc:title)|0.3, 0.7*euclidean(x.lat|x.long,y.latitude|y.longitude)|0.5)</code></p>
                                        <p>表达式<code>trigrams(x.rdfs:label,y.dc:title)|0.3</code>可以称作左子表达式，<code>euclidean(x.lat|long, y.latitude|longitude)|0.5</code>则为右子表达式。该例中，子表达式都是原子的，通过Metric操作符组成了复合表达式。每个操作符有且仅有<strong>2</strong>个子表达式。子表达式必须包含阈值。</p>


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


                <a href="/tutorial/metric" class="navigation navigation-prev " aria-label="Previous page: Metric">
                    <i class="fa fa-angle-left"></i>
                </a>


                <a href="/tutorial/metric/bool" class="navigation navigation-next " aria-label="Next page: Bool operations" style="margin-right: 0px;">
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
