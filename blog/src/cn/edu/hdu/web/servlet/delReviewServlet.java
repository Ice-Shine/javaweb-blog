package cn.edu.hdu.web.servlet;

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
//管理员管理评论
@WebServlet("/delReviewServlet")
public class delReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String review_id = request.getParameter("review_id");
        String article_id = request.getParameter("article_id");
        ReviewService service = new ReviewServiceImpl();
        service.delReview(review_id);
        response.sendRedirect(request.getContextPath()+"/findReviewByPageServlet?article_id="+article_id);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
