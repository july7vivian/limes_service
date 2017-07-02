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
            <a href="#" class="current">Examples</a>
        </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">


                    <div class="page-wrapper" tabindex="-1" role="main">
                        <div class="page-inner">

                            <div id="book-search-results">
                                <div class="search-noresults">

                                    <section class="normal markdown-section">

                                        <h1 id="configuration-file-examples">Configuration File Examples</h1>
                                        <p>The following shows the whole configuration file for LIMES explicated in the sections above.</p>
                                        <pre><code class="lang-xml"><span class="php"><span class="hljs-meta">&lt;?</span>xml version=<span class="hljs-string">"1.0"</span> encoding=<span class="hljs-string">"UTF-8"</span> standalone=<span class="hljs-string">"no"</span><span class="hljs-meta">?&gt;</span></span>
<span class="hljs-meta">&lt;!DOCTYPE LIMES SYSTEM "limes.dtd"&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">LIMES</span>&gt;</span>
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

    <span class="hljs-tag">&lt;<span class="hljs-name">EXECUTION</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">REWRITER</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-name">REWRITER</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PLANNER</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-name">PLANNER</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ENGINE</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-name">ENGINE</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">EXECUTION</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">OUTPUT</span>&gt;</span>TAB<span class="hljs-tag">&lt;/<span class="hljs-name">OUTPUT</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">LIMES</span>&gt;</span>
</code></pre>
                                        <p>LIMES can be also configured using a RDF configuration file, the next
                                            listing represent the same LIMES configuration used in the previous XML
                                            file.</p>
                                        <pre><code class="lang-turtle">@prefix geos:    &lt;http://www.opengis.net/ont/geosparql#&gt; .
@prefix lgdo:    &lt;http://linkedgeodata.org/ontology/&gt; .
@prefix rdfs:    &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix geom:    &lt;http://geovocab.org/geometry#&gt; .
@prefix limes:   &lt;http://limes.sf.net/ontology/&gt; .

limes:linkedgeodataTOlinkedgeodataTarget
      a       limes:TargetDataset ;
      rdfs:label "linkedgeodata" ;
      limes:endPoint "http://linkedgeodata.org/sparql" ;
      limes:pageSize "2000" ;
      limes:property "geom:geometry/geos:asWKT" ;
      limes:restriction "?y a lgdo:RelayBox" ;
      limes:variable "?y" .

limes:linkedgeodataTOlinkedgeodata
      a       limes:LimesSpecs ;
      limes:hasExecutionParameters limes:executionParameters ;
      limes:granularity "2" ;
      limes:hasAcceptance limes:linkedgeodataTOlinkedgeodataAcceptance ;
      limes:hasMetric limes:linkedgeodataTOlinkedgeodataMetric ;
      limes:hasReview limes:linkedgeodataTOlinkedgeodataReview ;
      limes:hasSource limes:linkedgeodataTOlinkedgeodataSource ;
      limes:hasTarget limes:linkedgeodataTOlinkedgeodataTarget ;
      limes:outputFormat "TAB" .

limes:executionParameters
      a limes:ExecutionParameters ;
      limes:executionPlanner "default" ;
      limes:executionRewriter "default" ;
      limes:executionEngine "default" .


limes:linkedgeodataTOlinkedgeodataReview
      a       limes:Review ;
      limes:file "lgd_relaybox_near.nt" ;
      limes:relation "lgdo:near" ;
      limes:threshold "0.5" .

limes:linkedgeodataTOlinkedgeodataMetric
      a       limes:Metric ;
      limes:expression "geo_hausdorff(x.polygon, y.polygon)" .

limes:linkedgeodataTOlinkedgeodataAcceptance
      a       limes:Acceptance ;
      limes:file "lgd_relaybox_verynear.nt" ;
      limes:relation "lgdo:near" ;
      limes:threshold "0.9" .

limes:linkedgeodataTOlinkedgeodataSource
      a       limes:SourceDataset ;
      rdfs:label "linkedgeodata" ;
      limes:endPoint "http://linkedgeodata.org/sparql" ;
      limes:pageSize "2000" ;
      limes:property "geom:geometry/geos:asWKT" ;
      limes:restriction "?x a lgdo:RelayBox" ;
      limes:variable "?x" .
</code></pre>
                                        <p>The following configuration file uses the machine learning algorithm of the Wombat simple to find the metric expression for the same example:</p>
                                        <pre><code class="lang-xml"><span class="php"><span class="hljs-meta">&lt;?</span>xml version=<span class="hljs-string">"1.0"</span> encoding=<span class="hljs-string">"UTF-8"</span> standalone=<span class="hljs-string">"no"</span><span class="hljs-meta">?&gt;</span></span>
<span class="hljs-meta">&lt;!DOCTYPE LIMES SYSTEM "limes.dtd"&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">LIMES</span>&gt;</span>
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

    <span class="hljs-tag">&lt;<span class="hljs-name">EXECUTION</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">REWRITER</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-name">REWRITER</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">PLANNER</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-name">PLANNER</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">ENGINE</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-name">ENGINE</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">EXECUTION</span>&gt;</span>

    <span class="hljs-tag">&lt;<span class="hljs-name">OUTPUT</span>&gt;</span>TAB<span class="hljs-tag">&lt;/<span class="hljs-name">OUTPUT</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">LIMES</span>&gt;</span>
</code></pre>
                                        <p>Finally, the last XML configuration file in TTL format will look like:</p>
                                        <pre><code class="lang-turtle">@prefix geos:    &lt;http://www.opengis.net/ont/geosparql#&gt; .
@prefix lgdo:    &lt;http://linkedgeodata.org/ontology/&gt; .
@prefix rdfs:    &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix geom:    &lt;http://geovocab.org/geometry#&gt; .
@prefix limes:   &lt;http://limes.sf.net/ontology/&gt; .

limes:linkedgeodataTOlinkedgeodataTarget
      a       limes:TargetDataset ;
      rdfs:label "linkedgeodata" ;
      limes:endPoint "http://linkedgeodata.org/sparql" ;
      limes:pageSize "2000" ;
      limes:property "geom:geometry/geos:asWKT" ;
      limes:restriction "?y a lgdo:RelayBox" ;
      limes:variable "?y" .

limes:linkedgeodataTOlinkedgeodata
      a       limes:LimesSpecs ;
      limes:hasExecutionParameters limes:executionParameters ;
      limes:granularity "2" ;
      limes:hasAcceptance limes:linkedgeodataTOlinkedgeodataAcceptance ;
      limes:hasMetric limes:linkedgeodataTOlinkedgeodataMetric ;
      limes:hasReview limes:linkedgeodataTOlinkedgeodataReview ;
      limes:hasSource limes:linkedgeodataTOlinkedgeodataSource ;
      limes:hasTarget limes:linkedgeodataTOlinkedgeodataTarget ;
      limes:outputFormat "TAB" .

limes:executionParameters
      a limes:ExecutionParameters ;
      limes:executionPlanner "default" ;
      limes:executionRewriter "default" ;
      limes:executionEngine "default" .


limes:linkedgeodataTOlinkedgeodataReview
      a       limes:Review ;
      limes:file "lgd_relaybox_near.nt" ;
      limes:relation "lgdo:near" ;
      limes:threshold "0.5" .

limes:linkedgeodataTOlinkedgeodataMetric
      a       limes:Metric ;
      limes:expression "geo_hausdorff(x.polygon, y.polygon)" .

limes:linkedgeodataTOlinkedgeodataAcceptance
      a       limes:Acceptance ;
      limes:file "lgd_relaybox_verynear.nt" ;
      limes:relation "lgdo:near" ;
      limes:threshold "0.9" .

limes:linkedgeodataTOlinkedgeodataSource
      a       limes:SourceDataset ;
      rdfs:label "linkedgeodata" ;
      limes:endPoint "http://linkedgeodata.org/sparql" ;
      limes:pageSize "2000" ;
      limes:property "geom:geometry/geos:asWKT" ;
      limes:restriction "?x a lgdo:RelayBox" ;
      limes:variable "?x" .
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
