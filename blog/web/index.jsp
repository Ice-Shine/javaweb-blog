<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/9/23
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>skd的博客-首页</title>
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
    <!-- 个人介绍部分-->
    <div class="row">
      <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img src="/img/touxiang.jpg" alt="头像">
          <div class="caption">
            <h3>iceshine</h3>
            <p>杭州电子科技大学学生</p>
            <p><a href="https://space.bilibili.com/21595529" class="btn btn-primary" role="button">Bilibili</a></p>
          </div>
        </div>
      </div>
      <%--轮播图--%>
      <div id="carousel-example-generic" class="carousel slide col-md-8" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>

        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="/img/lunbo1.png" alt="...">
            <div class="carousel-caption">

            </div>
          </div>
          <div class="item">
            <img src="/img/lubbo2.png" alt="...">
            <div class="carousel-caption">

            </div>
          </div>

        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <p>这是skd的个人博客，目前已经建设完成</p>
      <p>本博客采用javaweb实现，前端使用jsp+JavaScript，后端采用servlet,数据库使用mysql，连接池使用druid</p>
      <p> 本人初学Javaweb，欢迎大家批评指正</p>
      <p>   完成时间：2020.12.20</p>
      <p>   相关代码将会上传csdn</p>

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
