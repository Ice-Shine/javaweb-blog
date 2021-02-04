<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/13
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>skd的博客-注册界面</title>
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

        .login1{

            text-align: center;



        }
        .ideinput{
            width: 60px;
            height: 27px;
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
                        <li><a href="${pageContext.request.contextPath}/findArticleByPageServlet">文章列表 <span class="sr-only">(current)</span></a></li>


                    </ul>


                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

    </div>
    <!--修改用户名表单-->
    <div class="row login1">
        <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
            <%--隐藏域--%>
            <input type="hidden" name="id" value="${user.id}">
            <table  width="500" >
                <tr>

                    <td><label for="username">用户名</label></td>
                    <td><input type="text" name="username" placeholder="请输入用户名" id="username" value="${username}"></td>

                </tr>
                <tr>
                    <td><label for="password">密码</label></td>
                    <td><input type="password" name="password" placeholder="请输入密码" id="password" ></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input type="email" name="user_email"  id="email" placeholder="请输入email" value="${user.user_email}"></td>
                </tr>

                <tr>
                    <td><label for="name">姓名</label></td>
                    <td><input type="text" name="user_realname" placeholder="请输入真实姓名" id="name" value="${user.user_realname}"></td>
                </tr>
                <tr>
                    <td><label for="phone">手机号</label></td>
                    <td><input type="text" name="user_phone" placeholder="请输入您的手机号" id="phone" value="${user.user_phone}"></td>
                </tr>
                <tr>
                    <td><label>性别</label></td>
                    <td>
                        <c:if test="${user.user_sex == 'male'}">
                            <input type="radio" name="user_sex" value="male" checked>男
                            <input type="radio" name="user_sex" value="female">女
                        </c:if>
                        <c:if test="${user.user_sex == 'female'}">
                            <input type="radio" name="user_sex" value="male" >男
                            <input type="radio" name="user_sex" value="female" checked>女
                        </c:if>

                    </td>

                </tr>
                <tr>
                    <td><label>出生日期</label></td>
                    <td><input type="date" name="user_bir" value="${user.user_bir}"></td>
                </tr>
                <tr>
                    <td><label for="ide">验证码</label></td>
                    <td>
                        <%--<input type="text" name="yanzheng" placeholder="请输入验证码" id="yanzheng" >--%>
                        <div class="row">
                            <div class="col-md-2"><input class="ideinput" type="text" name="image"  id="ide"></div>
                            <div class="col-md-2"><img id="img" src="${pageContext.request.contextPath}/VerifyCodeServlet"></div>
                            <div class="col-md-4"><input type="button" value="看不清? 换一张." id="btn"></div>

                            <div class="col-md-4 "><font color="red">${requestScope.imageMess}</font></div>
                        </div>


                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="修改"></td>

                </tr>
            </table>
        </form>
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
<script type="text/javascript">

    document.getElementById("btn").onclick = function () {
        // 获取img元素
        // 为了让浏览器发送请求到servlet, 所以一定要改变src
        document.getElementsByTagName("img")[0].src =
            "${pageContext.request.contextPath}/VerifyCodeServlet?time=" + new Date().getTime();
    };
    document.getElementById("img").onclick = function () {
        this.src="${pageContext.request.contextPath}/VerifyCodeServlet?time"+new Date().getTime();
    };
</script>
</body>
</html>
