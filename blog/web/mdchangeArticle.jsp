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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap_button.css">
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
        .selectuser{
            width: 950px;
        }
        .title{
            font-size: 30px;
        }
        body{
            background-color: #fdfcf8;
        }

        .ranktitle{
            font-size: 15px;
        }

        .search_button{
            border: 2px solid #ffc900;
            float: left;
            background-color:#ffc900 ;
            height: 35px;
            width: 60px;
            text-align: center;
            line-height: 35px;
            margin-top: 20px;


        }
        .search_input{
            float: left;
            border: 2px solid #ffc900;
            width: 200px;
            height: 35px;
            padding-left: 5px;
            padding-top: 5px;
            margin-top: 20px;
        }
        .footer{
            text-align: center;
            height: 40px;
            line-height: 40px;
            font-size: 10px;
        }
        hr{
            width: 700px;
            float: left;
        }
        .login_button{
            float: left;
            margin-top: 20px;
        }
        .register_button{
            float: left;
            margin-top: 20px;
        }
        .login{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header class="container">
<!--第一行登录标题-->
    <div class="row padd-top">
    <div class="col-md-4">
        <h2>skd的博客</h2>
    </div>
    <div class="col-md-3">
        <form action="${pageContext.request.contextPath}/findArticleByPageServlet" method="post">
            <input class="search_input" type="text" name="words"  placeholder="请输入要查询的文章标题">
            <input class="search_button" type="submit" value="搜索">
        </form>
    </div>
    <c:if test= "${username==null}" >
        <div class="col-md-1 login">
            <p>未登录</p>
        </div>
        <div class="col-md-3">
            <a class="login_button" href="${pageContext.request.contextPath}/login.jsp">登录</a>
            <a class="register_button" href="${pageContext.request.contextPath}/register.jsp"> |注册</a>
        </div>
    </c:if>
    <c:if test= "${username!=null}" >
        <div class="col-md-2 login">
            欢迎您：${username}
        </div>
        <div class="col-md-1">
            <a class="login_button" href="${pageContext.request.contextPath}/upuser.jsp">账号管理 </a>

        </div>
        <div class="col-md-1">
            <a class="login_button" href="${pageContext.request.contextPath}/mdchangeArticle.jsp">添加文章 </a>

        </div>
        <div class="col-md-1">

            <a class="login_button" href="${pageContext.request.contextPath}/logoutServlet">退出登录</a>
        </div>
    </c:if>

</div>
<!--选项标签-->
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
                <a class="navbar-brand active" href="${pageContext.request.contextPath}/index.jsp">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/findArticleByPageServlet">文章列表 <span class="sr-only">(current)</span></a></li>


                </ul>


            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

</div>

    <div class="row">

        <div class="container" style="width: 1000px;" >
            <form action="${pageContext.request.contextPath}/mdAdArticleServlet" method="post">


                <div class="form-group">
                    <label for="article_title">文章标题</label>
                    <input type="text" name="article_title" class="form-control" id="article_title" placeholder="请输入文章标题" value=""/>
                </div>

                <div class="form-group">
                    <label for="article_ind">文章简介</label>
                    <input type="text" name="article_ind" class="form-control" placeholder="请输入文章简介" id="article_ind" >
                </div>
                <div>
                    <label >文章内容</label>
                    <div id="layout">
                        <div id="my-editormd" >
                            <textarea id="my-editormd-markdown-doc" name="article_context1"></textarea>
                            <!-- 注意：name属性的值-->
                            <textarea id="article_context" name="article_context" style="display:none;"></textarea>
                        </div>


                    </div>

                </div>

                <br/>
                <div class="form-group" style="text-align: center;">
                    <input class="btn" type="submit" value="添加">
                </div>
            </form>
            <!--页脚-->
            <div class="row">
                <footer class="footer">created by skd</footer>
            </div>

        </div>
    </div>
</header>
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
            imageUploadURL : "${pageContext.request.contextPath}/imageUploadServlet",
        });
    });

</script>

</body>
</html>
