<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/15
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>skd的博客-文章列表</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <style>
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
            float: left;
            background-color:#ffc900 ;
            border: 2px solid #ffc900;
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
        <div class="col-md-4">
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="${pageContext.request.contextPath}/findArticleByPageServlet">文章列表 <span class="sr-only">(current)</span></a></li>


                    </ul>


                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

    </div>
    <!--文章列表-->
    <div class="row">
        <div class="col-md-8">
            <c:forEach items="${pb.list}" var="article" varStatus="s" >
            <div class="row">
                <a class="title" href="${pageContext.request.contextPath}/ArticleServlet?article_id=${article.article_id}">${article.article_title}</a>
                <p>${article.article_ind}</p>
                <hr/>
            </div>
            </c:forEach>
            <div class="row"><font color="black">${requestScope.blank}</font></div>
        </div>
        <div class="col-md-4">
            <div class="row"><h3>推荐文章</h3></div>
            <div class="row"> <a class="ranktitle" href="${pageContext.request.contextPath}/ArticleServlet?article_id=4">C语言矩阵转置</a></div>
            <div class="row"> <a class="ranktitle" href="${pageContext.request.contextPath}/ArticleServlet?article_id=5">C语言线性表</a></div>
        </div>

    </div>
    <!--页码条-->
    <div class="row">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage == 1}"><%--判断是否禁用上一页--%>
                    <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage != 1}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/findArticleByPageServlet?currentPage=${pb.currentPage-1}&rows=10" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <c:if test="${pb.currentPage == i}">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/findArticleByPageServlet?currentPage=${i}&rows=10">${i} <span class="sr-only">(current)</span></a>
                        </li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li>
                            <a href="${pageContext.request.contextPath}/findArticleByPageServlet?currentPage=${i}&rows=10">${i} <span class="sr-only">(current)</span></a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${pb.currentPage == pb.totalPage}"><%--判断是否禁用上一页--%>
                    <li class="disabled">
                </c:if>

                <c:if test="${pb.currentPage != pb.totalPage}"><%--判断是否禁用上一页--%>
                    <li>
                 </c:if>
                    <a href="${pageContext.request.contextPath}/findArticleByPageServlet?currentPage=${pb.currentPage+1}&rows=10" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        <span style="margin-left:5px">共${pb.totalCount}条记录，共${pb.totalPage}页</span>
    </div>
    <!--页脚-->
    <div class="row">
        <footer class="footer">created by skd</footer>
    </div>

</header>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
