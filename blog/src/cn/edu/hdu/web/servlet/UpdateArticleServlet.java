package cn.edu.hdu.web.servlet;

import cn.edu.hdu.dao.UserDao;
import cn.edu.hdu.domain.Article;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.UserService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import cn.edu.hdu.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//完成修改文章回显
@WebServlet("/updateArticleServlet")
public class UpdateArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String article_id = request.getParameter("article_id");
        ArticleListService service = new ArticleListImpl();
        Article article = service.findArticle(article_id);
        String article_context = article.getArticle_context();
        //转换换行符
        String s = article_context.replaceAll("<br/>","\n");
        s = s.replaceAll("&lt;","<");
        s = s.replaceAll("&nbsp;"," ");
        //System.out.println(s);
        article.setArticle_context(s);
        UserDao dao = new UserDao();
        UserService service1 = new UserServiceImpl();
        List<Integer> userId = service1.findUserId();
        //将Article存入request域
        request.setAttribute("user_id",userId);
        request.setAttribute("article",article);
        request.getRequestDispatcher("/ad/upArticle.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
