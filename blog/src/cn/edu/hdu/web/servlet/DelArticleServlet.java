package cn.edu.hdu.web.servlet;

import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.ReviewService;
import cn.edu.hdu.service.UserService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import cn.edu.hdu.service.impl.ReviewServiceImpl;
import cn.edu.hdu.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delArticleServlet")
public class DelArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String article_id = request.getParameter("article_id");
        ReviewService review_service = new ReviewServiceImpl();
        review_service.delReviewByArticleId(article_id);
        ArticleListService service = new ArticleListImpl();
        service.delArticle(article_id);
        response.sendRedirect(request.getContextPath()+"/findAdarticleByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
