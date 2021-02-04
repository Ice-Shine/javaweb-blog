<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/5
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>skd的博客-登录界面</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <style>
        .title{
            font-size: 30px;
        }
        body{
            background-color: #fdfcf8;
        }

        .login1{

            text-align: center;



        }

        .search_button{
            float: left;
            border: 2px solid #ffc900;
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
        .ideinput{
            width: 100px;
            height: 27px;
        }
        .logintext
        {
            float: left;
        }


    </style>
</head>
<body>
    <%

        // 获取浏览器发送过来的cookie, 获取用户信息
        Cookie[] cookies = request.getCookies();
        String username = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    username = cookie.getValue();
                }
            }
        }
    %>
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
            <div class="col-md-1 login">
                <p>未登录</p>
            </div>
            <div class="col-md-3">

                <a class="login_button" href="${pageContext.request.contextPath}/login.jsp">登录</a>
                <a class="register_button" href="${pageContext.request.contextPath}/register.jsp"> |注册</a>
            </div>
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
                            <li><a href="${pageContext.request.contextPath}/findArticleByPageServlet">文章列表 <span class="sr-only">(current)</span></a></li>

                        </ul>


                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>

        </div>
        <!--登录表单-->
        <div class="row login1">
            <font color="red">${requestScope.message}</font>
            <form action="${pageContext.request.contextPath}/LoginServlet3" method="post">
                <div class="row">
                    <div class="col-md-4 logintext"><label for="username">用户名</label></div>
                    <div class="col-md-2 logininput"><input type="text" name="username" placeholder="请输入用户名" id="username" value="${username}"></div>
                    <div class="col-md-2"><font color="red">${requestScope.error}</font></div>
                </div>
                <div class="row">
                    <div class="col-md-4 logintext"><label for="password">密码</label></div>
                    <div class="col-md-2 logininput"><input type="password" name="password" placeholder="请输入密码" id="password" value="${password}"></div>
                </div>
                <div class="row">
                    <div class="col-md-4 logintext"><label for="ide">验证码</label></div>
                    <div class="col-md-1"><input class="ideinput" type="text" name="image" placeholder="请输入验证码" id="ide"></div>
                    <div class="col-md-2"><img id="img" src="${pageContext.request.contextPath}/VerifyCodeServlet"></div>
                    <div class="col-md-1"><input type="button" value="看不清? 换一张." id="btn"></div>

                    <div class="col-md-2 "><font color="red">${requestScope.imageMess}</font></div>
                </div>
                <div class="row">
                        <input type="submit" value="登录">
                </div>
                <div class="row">
                    <input type="checkbox" name="admin" value="true">管理员
                </div>

            </form>
        </div>
        <!--页脚-->
        <div class="row">
            <footer class="footer">created by skd</footer>
        </div>

    </header>



    <script type="text/javascript">

        document.getElementById("btn").onclick = function () {
            // 获取img元素
            // 为了让浏览器发送请求到servlet, 所以一定要改变src
            document.getElementsByTagName("img")[0].src =
                "/blog/VerifyCodeServlet?time=" + new Date().getTime();
        };
        document.getElementById("img").onclick = function () {
            this.src="/blog/VerifyCodeServlet?time"+new Date().getTime();
        };
    </script>
</body>
</html>
