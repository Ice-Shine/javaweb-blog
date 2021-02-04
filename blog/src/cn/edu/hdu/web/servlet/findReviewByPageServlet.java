package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.PageBean;
import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.ReviewService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import cn.edu.hdu.service.impl.ReviewServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findReviewByPageServlet")
public class findReviewByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String article_id = request.getParameter("article_id");


        //调用service查询
        ReviewService service = new ReviewServiceImpl();
        List<Review_User> review = service.findReviewByArticleId(article_id);
        request.setAttribute("review",review);
        if(review.isEmpty()==true){
            request.setAttribute("mess", "该文章下没有评论!");
        }
        request.getRequestDispatcher("/ad/adReview.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
