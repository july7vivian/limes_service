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
            <a href="#" class="current">Data Sources</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">


                    <div class="page-wrapper" tabindex="-1" role="main">
                        <div class="page-inner">

                            <div id="book-search-results">
                                <div class="search-noresults">

                                    <section class="normal markdown-section">

                                        <h1 id="data-sources">Data Sources 数据源</h1>
                                        <p>平台提供算法，对两个知识图谱的实体进项融合。源数据集(SOURCE)和目标数据集(TARGET)采用相同的配置格式，示例如下：</p>
                                        <pre><code>&lt;SOURCE&gt;
    &lt;ID&gt;mesh&lt;/ID&gt;
    &lt;ENDPOINT&gt;http://mesh.bio2rdf.org/sparql&lt;/ENDPOINT&gt;
    &lt;VAR&gt;?y&lt;/VAR&gt;
    &lt;PAGESIZE&gt;5000&lt;/PAGESIZE&gt;
    &lt;RESTRICTION&gt;?y rdf:type meshr:Concept&lt;/RESTRICTION&gt;
    &lt;PROPERTY&gt;dc:title&lt;/PROPERTY&gt;
    &lt;TYPE&gt;sparql&lt;/TYPE&gt;
&lt;/SOURCE&gt;
&lt;TARGET&gt;
    &lt;ID&gt;linkedct&lt;/ID&gt;
    &lt;ENDPOINT&gt;http://data.linkedct.org/sparql&lt;/ENDPOINT&gt;
    &lt;VAR&gt;?x&lt;/VAR&gt;
    &lt;PAGESIZE&gt;5000&lt;/PAGESIZE&gt;
    &lt;RESTRICTION&gt;?x rdf:type linkedct:condition&lt;/RESTRICTION&gt;
    &lt;PROPERTY&gt;linkedct:condition_name&lt;/PROPERTY&gt;
&lt;/TARGET&gt;
</code></pre><p>一共需要配置5个选项：</p>
                                        <ul>
                                            <li>每个数据源需要通过<code>ID</code>标签指定一个名称。</li>
                                            <li><code>ENDPOINT</code>标签指定知识图谱文件的地址。</li>
                                            <li><code>VAR</code>标签表示与<code>ENDPOINT</code>相关联的变量，该变量用于从知识图谱中检索数据。</li>
                                            <li>约束条件通过<code>RESTRICTION</code>标签设置，该项表示检索三元组的限制条件。例如，上面的SOURCE项抽取的实体必须是MESH concept的实例。 </li>
                                            <li><code>PROPERTY</code>标签用于数据预处理。例如，<code>rdfs:label AS nolang</code>可以确保在融合计算执行之前除去<code>rdfs:label</code>属性的语言标记。预处理函数可以通过<code>-&gt;</code>符号串联使用。例如，<code>rdfs:label AS nolang-&gt;lowercase</code>等价于<code>lowercase(nolang(rdfs:label))</code>。</li>
                                        </ul>
                                        <h2 id="pre-processing-functions">Pre-processing Functions 预处理函数</h2>
                                        <p>目前, 平台支持以下预处理函数:</p>
                                        <ul>
                                            <li><code>nolang</code>表示去除语言标记。</li>
                                            <li><code>lowercase</code>转换为小写字母。</li>
                                            <li><code>uppercase</code>转换为大写字母。</li>
                                            <li><code>number</code>只保留数字、 "." 和 ","参与运算。</li>
                                            <li><code>replace(String a,String b)</code>用字符串<code>b</code>代替<code>a</code>。</li>
                                            <li><code>regexreplace(String x,String b)</code>用字符串<code>b</code>代替符合正则式<code>x</code>的字符串。</li>
                                            <li><code>cleaniri</code>移除IRIs中的所有前缀。</li>
                                            <li><code>celsius</code>将华氏温度转换为摄氏温度。</li>
                                            <li><code>fahrenheit</code>将摄氏温度转换为华氏温度。</li>
                                            <li><code>removebraces</code>移除括号。</li>
                                            <li><code>regularAlphabet</code>移除非字母的字符。</li>
                                            <li><code>uriasstring</code>返回URI的最后一部分以字符串的形式返回，并将<code>_</code>替换为空格。</li>
                                        </ul>
                                        <p>有时，生成一个融合表达式需要合并多个属性值，或者分割属性值。<code>RENAME</code>操作符可以简单地将预处理后的属性值重命名为一个新的字段，举例如下：</p>
                                        <pre><code>&lt;SOURCE&gt;
    &lt;ID&gt;mesh&lt;/ID&gt;
    &lt;ENDPOINT&gt;http://mesh.bio2rdf.org/sparql&lt;/ENDPOINT&gt;
    &lt;VAR&gt;?y&lt;/VAR&gt;
    &lt;PAGESIZE&gt;5000&lt;/PAGESIZE&gt;
    &lt;RESTRICTION&gt;?y rdf:type meshr:Concept&lt;/RESTRICTION&gt;
    &lt;PROPERTY&gt;dc:title AS lowercase RENAME name&lt;/PROPERTY&gt;
    &lt;PROPERTY&gt;foaf:name AS lowercase RENAME name&lt;/PROPERTY&gt;
    &lt;TYPE&gt;sparql&lt;/TYPE&gt;
&lt;/SOURCE&gt;
</code></pre><p>如下所示，, <code>foaf:homepage</code>属性被分割为<code>name</code>和<code>homepage</code>。</p>
                                        <pre><code>&lt;SOURCE&gt;
    &lt;ID&gt;mesh&lt;/ID&gt;
    &lt;ENDPOINT&gt;http://mesh.bio2rdf.org/sparql&lt;/ENDPOINT&gt;
    &lt;VAR&gt;?y&lt;/VAR&gt;
    &lt;PAGESIZE&gt;5000&lt;/PAGESIZE&gt;
    &lt;RESTRICTION&gt;?y rdf:type meshr:Concept&lt;/RESTRICTION&gt;
    &lt;PROPERTY&gt;foaf:homepage AS lowercase RENAME homepage&lt;/PROPERTY&gt;
    &lt;PROPERTY&gt;foaf:homepage AS cleaniri-&gt;lowercase RENAME name&lt;/PROPERTY&gt;
    &lt;TYPE&gt;sparql&lt;/TYPE&gt;
&lt;/SOURCE&gt;
</code></pre><p>最后，数据源的格式可由<code>TYPE</code>设置，支持以下格式：</p>
                                        <ul>
                                            <li><code>CSV</code>:Character-separated 文件，默认分隔符为<code>TAB</code>。 </li>
                                            <li><code>N3</code> :同<code>NT</code> 文件。</li>
                                            <li><code>N-TRIPLE</code> 读取<a href="http://www.w3.org/TR/rdf-testcases/\#ntriples" target="_blank">N-Triples 格式</a>文件。</li>
                                            <li><code>TURTLE</code>读取<code>Turtle</code> <a href="http://www.w3.org/TR/turtle/" target="_blank">语法</a>文件。</li>
                                        </ul>

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


                <a href="/tutorial/prefix" class="navigation navigation-prev " aria-label="Previous page: Prefix">
                    <i class="fa fa-angle-left"></i>
                </a>


                <a href="/tutorial/metric" class="navigation navigation-next " aria-label="Next page: Metric" style="margin-right: 0px;">
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
