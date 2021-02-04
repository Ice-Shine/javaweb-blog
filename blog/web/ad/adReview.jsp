<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/27
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <title>管理员首页</title>
    <style>

        .backbtn{
            float: right;
        }
    </style>
    <script>
        function deleteReview(id,article_id) {
            if(confirm("您确定要删除该评论吗？")){
                location.href="${pageContext.request.contextPath}/delReviewServlet?review_id="+id+"&article_id="+article_id;
            }
        }
    </script>
</head>
<body>
    <div class="row">
        <div class="col-md-8">
            <h2>后台管理页面</h2>
        </div>
        <div class="col-md-4 ">
            <a class="btn btn-default backbtn" href="..${pageContext.request.contextPath}/index.jsp" role="button">回到首页</a>
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
    <%--各类列表--%>
    <div class="container">
        <h3 style="text-align: center">评论信息列表</h3>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>评论编号</th>
                <th>文章编号</th>
                <th>评论者昵称</th>
                <th>评论内容</th>
                <th>评论时间日期</th>
                <th>操作</th>

            </tr>
            <c:forEach items="${review}" var="review" varStatus="s" >
                <div class="row">
                    <tr>
                        <td>${review.id}</td>
                        <td>${review.article_id}</td>
                        <td>${review.username}</td>
                        <td>${review.review_context}</td>
                        <td>${review.review_date}</td>
                        <td><a class="btn btn-default btn-sm" href="javascript:deleteReview(${review.id},${review.article_id});">删除</a></td>
                    </tr>
                </div>

            </c:forEach>


        </table>
        <div align="center"><font color="red">${requestScope.mess}</font></div>

    </div>
</body>
</html>
