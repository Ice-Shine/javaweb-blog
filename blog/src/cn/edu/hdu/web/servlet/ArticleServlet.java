package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;
import cn.edu.hdu.domain.User;
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
import java.util.List;

//进行文章内容的查询
@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String article_id = request.getParameter("article_id");
        //调用ArticleService
        ArticleListService service = new ArticleListImpl();
        Article article = service.findArticle(article_id);
        //将Article存入request域
        request.setAttribute("article",article);
        //调用UserService
        UserService user_service = new UserServiceImpl();
        User user = user_service.findUserByArticleId(article_id);
        request.setAttribute("user",user);
        //调用ReviewService
        ReviewService review_service = new ReviewServiceImpl();
        List<Review_User> review = review_service.findReviewByArticleId(article_id);
        request.setAttribute("review",review);
        //转发
        request.getRequestDispatcher("/article.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
