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

                                        <h1 id="data-sources">Data Sources</h1>
                                        <p>LIMES computes links between items contained in two Linked Data sources dubbed source and target. Both source and target need to be configured using the same tags. An example of a configuration for both data sources is shown below.</p>
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
</code></pre><p>Six properties need to be set. </p>
                                        <ul>
                                            <li>Each data source must be given an ID via the tag <code>ID</code>.</li>
                                            <li>The endpoint of the data source needs to be explicated via the <code>ENDPOINT</code> tag. <ul>
                                                <li>If the data is to be queried from a SPARQL end point, the <code>ENDPOINT</code> tag must be set to the corresponding SPARQL endpoint URI.</li>
                                                <li>In case the data is stored in a local file (CSV, N3, TURTLE, etc.), <code>ENDPOINT</code> tag must be set to the absolute path of the file containing the data.</li>
                                            </ul>
                                            </li>
                                            <li>The <code>VAR</code> tag describes the variable associated with the aformentioned endpoint. This variable is also used later, when specifying the metric used to link the entities retrieved from the source and target endpoints.</li>
                                            <li>The fourth property is set via the <code>PAGESIZE</code> tag. This property must be set to the maximal number of triples returned by the SPARQL endpoint. For example, the <a href="http://dbpedia.org/sparql" target="_blank">DBpedia endpoint</a> returns a maximum of 1000 triples for each query. LIMES' SPARQL module can still retrieve all relevant instances for the mapping even the value is set. If the SPARQL endpoint does not limit the number of triples it returns or if the input is a file, the value of <code>PAGESIZE</code> should be set to -1. </li>
                                            <li>The restrictions on the queried data can be set via the <code>RESTRICTION</code> tag. This tag allows to constrain the entries that are retrieved the LIMES' query module. In this particular example, we only instances of MESH concepts. </li>
                                            <li>The <code>PROPERTY</code> tag allows to specify the properties that will be used during the linking. It is important to note that the property tag can also be used to specify the preprocessing on the input data. For example, setting <code>rdfs:label AS nolang</code>, one can ensure that the language tags get removed from each <code>rdfs:label</code> before it is written in the cache. Pre-processing functions can be piped into one another by using <code>-&gt;</code>. For example, <code>rdfs:label AS nolang-&gt;lowercase</code> will compute <code>lowercase(nolang(rdfs:label))</code>.</li>
                                        </ul>
                                        <h2 id="pre-processing-functions">Pre-processing Functions</h2>
                                        <p>Currently, LIMES supports the following set of pre-processing functions:</p>
                                        <ul>
                                            <li><code>nolang</code> for removing language tags</li>
                                            <li><code>lowercase</code> for converting the input string into lower case</li>
                                            <li><code>uppercase</code> for converting the input string into upper case </li>
                                            <li><code>number</code> for ensuring that only the numeric characters, "." and "," are contained in the input string</li>
                                            <li><code>replace(String a,String b)</code> for replacing each occurrence of <code>a</code> with <code>b</code></li>
                                            <li><code>regexreplace(String x,String b)</code> for replacing each occurrence the regular excepression <code>x</code> with <code>b</code></li>
                                            <li><code>cleaniri</code> for removing all the prefixes from IRIs</li>
                                            <li><code>celsius</code> for converting Fahrenheit to Celsius</li>
                                            <li><code>fahrenheit</code> for converting Celsius to Fahrenheit</li>
                                            <li><code>removebraces</code> for removing the braces</li>
                                            <li><code>regularAlphabet</code> for removing nun-alphanumeric characters</li>
                                            <li><code>uriasstring</code> returns the last part of an URI as a String. Additional parsing <code>_</code> as space</li>
                                        </ul>
                                        <p>Sometimes, generating the right link specification might either require merging property values (for example, the <code>dc:title</code> and <code>foaf:name</code> of MESH concepts) or splitting property values (for example, comparing the label and <code>foaf:homepage</code> of source instances and the <code>foaf:homepage</code> of target instances as well as <code>foaf:homepage AS cleaniri</code> of the target instances with the <code>rdfs:label</code> of target instances. To enable this, LIMES provides the <code>RENAME</code> operator which simply store either the values of a property or the results of a preprocessing into a different property field. For example, <code>foaf:homepage AS cleaniri RENAME label</code> would stored the homepage of a object without all the prefixes in the name property. The user could then access this value during the specification of the similarity measure for comparing sources and target instances. Note that the same property value can be used several times. Thus, the following specification fragment is valid and leads to the the <code>dc:title</code> and <code>foaf:name</code> of individuals)  of MESH concepts being first cast down to the lowercase and then merged to a single property.</p>
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
</code></pre><p>In addition, the following allows splitting the values of <code>foaf:homepage</code> into the property values <code>name</code> and <code>homepage</code>.</p>
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
</code></pre><p>In addition, a source type can be set via <code>TYPE</code>. The default type is set to <code>SPARQL</code> (for a SPARQL endpoint) but LIMES also supports reading files directly from the hard-drive. The supported data formats are</p>
                                        <ul>
                                            <li><code>CSV</code>: Character-separated file can be loaded directly into LIMES. Note that the separation character is set to <code>TAB</code> as a default. The user can alter this setting programmatically. </li>
                                            <li><code>N3</code> (which also reads <code>NT</code> files) reads files in the <code>N3</code> language.</li>
                                            <li><code>N-TRIPLE</code> reads files in W3C's core <a href="http://www.w3.org/TR/rdf-testcases/\#ntriples" target="_blank">N-Triples format</a></li>
                                            <li><code>TURTLE</code> allows reading files in the <code>Turtle</code> <a href="http://www.w3.org/TR/turtle/" target="_blank">syntax</a>.</li>
                                        </ul>
                                        <p>Moreover, if you want to download data from a SPARQL endpoint, there is no need to set the <code>&lt;TYPE&gt;</code> tag.
                                            Instead, if you want to read the source (or target) data from a file, you should fill <code>&lt;ENDPOINT&gt;</code> tag with the absolute path of the input file, e.g. <code>&lt;ENDPOINT&gt;C:/Files/dbpedia.nt&lt;/ENDPOINT&gt;</code>, and you should also set the <code>&lt;TYPE&gt;</code> tag  with the type of the input data, for example <code>&lt;TYPE&gt;NT&lt;/TYPE&gt;</code>.</p>


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
