<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/11/15
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <title>添加文章</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap_button.css">\
    <script src="${pageContext.request.contextPath}/static/src/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/src/editormd.js"></script>
    <style>
        #submit_button{
            display:block;
            margin-left: 42%;
            margin-top: 2em;
            margin-bottom: 2em;
        }
        .input{
            display: block;
            margin-left: 20%;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-8" align="left">
        <h2>后台管理页面</h2>
    </div>
    <div class="col-md-4 " align="right">
        <a class="btn btn-default backbtn" href="${pageContext.request.contextPath}/index.jsp" role="button">回到首页</a>
    </div>
</div>
<%--选项标签--%>
<div class="row">
    <nav class="navbar navbar-default navbar">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/findUserByPageServlet">用户名管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/findAdarticleByPageServlet">文章管理 <span class="sr-only">(current)</span></a></li>

                </ul>


            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

</div>

<div class="row">

    <div class="container" style="width: 1000px;" >
        <form action="${pageContext.request.contextPath}/upadArticleServlet?article_id=${article.article_id}" method="post">
            <div class="form-group">
                <label >用户名id</label>
                <select name="user_id">
                    <c:forEach items="${user_id}" var="id" varStatus="s">
                        <c:if test="${id==article.user_id}">
                        <option value="${id}" selected>${id}</option>
                        </c:if>
                        <c:if test="${id!=article.user_id}">
                            <option value="${id}" >${id}</option>
                        </c:if>
                    </c:forEach>

                </select>
                <%--<input type="text" name="user_id" class="form-control" id="user_id" placeholder="请输入用户名ID" value="${article.user_id}"/>--%>
            </div>

            <div class="form-group">
                <label for="article_title">文章标题</label>
                <input type="text" name="article_title" class="form-control" id="article_title" placeholder="请输入文章标题" value="${article.article_title}"/>
            </div>

            <div class="form-group">
                <label for="article_ind">文章简介</label>
                <input type="text" name="article_ind" class="form-control" placeholder="请输入文章简介" id="article_ind" value="${article.article_ind}">
            </div>
            <div>
                <label >文章内容</label>
                <div id="layout">
                    <div id="my-editormd" >
                        <textarea id="my-editormd-markdown-doc" name="article_context1">${article.article_context}</textarea>
                        <!-- 注意：name属性的值-->
                        <textarea id="article_context" name="article_context" style="display:none;"></textarea>
                    </div>


                </div>

            </div>

            <hr/>
            <div class="form-group" style="text-align: center;">
                <input class="btn" type="submit" value="修改">
            </div>
        </form>


    </div>
</div>
<script src="${pageContext.request.contextPath}/static/src/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/src/editormd.js"></script>
<script type="text/javascript">
    <!--为了让editor.md编辑器完整的显示出来-->
    var testEditor;
    $(function() {
        testEditor = editormd("my-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            path    : "${pageContext.request.contextPath}/static/lib/",//指向markdown的路径
            saveHTMLToTextarea : true,
            toolbarAutoFixed:true,//工具栏自动固定定位的开启与禁用
            imageUpload : false,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${pageContext.request.contextPath}/imageUpload",
        });
    });

</script>

</body>
</html>
