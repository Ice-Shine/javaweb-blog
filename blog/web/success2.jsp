<%@ page import="cn.edu.hdu.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: skd
  Date: 2020/10/5
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>成功登录</title>
</head>
<body>
<%
    // 获取用户信息
    String username = (String) session.getAttribute("username");
    User user = (User) session.getAttribute("User");
    System.out.println(user);
    if (username == null) {
        request.setAttribute("message", "请登录!");

        // 转发到登录页面
        request.getRequestDispatcher("/blog/login.jsp").forward(request, response);
    }else{
        request.setAttribute("user",user);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
%>

</body>
</html>