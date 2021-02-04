package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.ReviewService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import cn.edu.hdu.service.impl.ReviewServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/adreviewServlet")
public class AdreviewServlet extends HttpServlet {//添加评论
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Object user = request.getSession().getAttribute("user");
        if(user==null){
            request.setAttribute("error", "请先登录！");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }else{
            //封装对象
            Map<String, String[]> map = request.getParameterMap();
            Review_User review = new Review_User();
            try {
                BeanUtils.populate(review,map);//使用工具包
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            //调用Service保存
            ReviewService service = new ReviewServiceImpl();
            service.addReview(review);
            //跳转回登录页面
            response.sendRedirect(request.getContextPath()+"/ArticleServlet?article_id="+review.getArticle_id());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
