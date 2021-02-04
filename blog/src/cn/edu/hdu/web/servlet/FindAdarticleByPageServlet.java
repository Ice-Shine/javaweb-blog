package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.PageBean;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.impl.ArticleListImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*后台管理页面分页查找文章*/
@WebServlet("/findAdarticleByPageServlet")
public class FindAdarticleByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//显示每页条数
        String words="";

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(rows==null||"".equals(rows)){
            rows="10";
        }
        //调用service查询
        ArticleListService service = new ArticleListImpl();
        PageBean<Article> pb = service.findArticleByPage(currentPage,rows,words);
        //将pagebean存入request
        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/ad/adArticle.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
