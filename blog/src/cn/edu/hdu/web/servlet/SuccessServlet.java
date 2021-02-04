package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/successServlet")
public class SuccessServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getAttribute("User");
        if(user!=null){
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("登陆成功");
        }
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("登陆成功");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
