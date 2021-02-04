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
    <script>
        function deleteUser(id) {
            if(confirm("您确定要删除该用户吗？该用户的所有信息都会被删除！")){
                location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }


        }
    </script>
    <style>

        .backbtn{
            float: right;
        }
    </style>
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
        <h3 style="text-align: center">用户信息列表</h3>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>编号</th>
                <th>昵称</th>
                <th>邮箱</th>
                <th>真实姓名</th>
                <th>电话</th>
                <th>性别</th>
                <th>生日</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pb.list}" var="user" varStatus="s" >
                <div class="row">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.user_email}</td>
                        <td>${user.user_realname}</td>
                        <td>${user.user_phone}</td>
                        <td>${user.user_sex}</td>
                        <td>${user.user_bir}</td>
                        <td>&nbsp;<a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id}); ">删除</a></td>
                    </tr>
                </div>
            </c:forEach>




        </table>
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
                        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage-1}&rows=10" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pb.totalPage}" var="i">
                        <c:if test="${pb.currentPage == i}">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=10">${i} <span class="sr-only">(current)</span></a>
                            </li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=10">${i} <span class="sr-only">(current)</span></a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pb.currentPage == pb.totalPage}"><%--判断是否禁用上一页--%>
                    <li class="disabled">
                        </c:if>

                        <c:if test="${pb.currentPage != pb.totalPage}"><%--判断是否禁用上一页--%>
                    <li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage+1}&rows=10" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <span style="margin-left:5px">共${pb.totalCount}条记录，共${pb.totalPage}页</span>
        </div>
    </div>
</body>
</html>
