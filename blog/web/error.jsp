<%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/12/9
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true"%>
<html>
<head>
    <title>出错啦！</title>
</head>
<body>
出错了，原因：<%=exception.getMessage() %>
<%
    exception.printStackTrace();
%>
</body>
</html>