package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.impl.ArticleListImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
//访问文章列表的Servlet
@WebServlet("/articleListServlet")
public class ArticleListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用Service
        ArticleListService service = new ArticleListImpl();
        List<Article> articles = service.findAll();
        //将list存入request域
        request.setAttribute("articles",articles);
        //转发
        request.getRequestDispatcher("/articleList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
