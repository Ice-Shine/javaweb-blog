package cn.edu.hdu.web.servlet;

import cn.edu.hdu.service.UserService;
import cn.edu.hdu.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/changeArticleServlet")
public class ChangeArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UserService service = new UserServiceImpl();
        List<Integer> list = service.findUserId();
        request.setAttribute("user",list);
        request.getRequestDispatcher("/ad/mdchangeArticle.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
