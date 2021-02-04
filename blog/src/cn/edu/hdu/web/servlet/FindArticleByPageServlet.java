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
/*前端查找文章*/
@WebServlet("/findArticleByPageServlet")
public class FindArticleByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//显示每页条数

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(rows==null||"".equals(rows)){
            rows="10";
        }
        String words = request.getParameter("words");
        //System.out.println(words);
        //调用service查询
        ArticleListService service = new ArticleListImpl();
        PageBean<Article> pb = service.findArticleByPage(currentPage,rows,words);
        if(pb.getTotalCount()==0) request.setAttribute("blank","没有查询到文章");
        //将pagebean存入request
        request.setAttribute("pb",pb);
        //request.getRequestDispatcher("/adArticle.jsp").forward(request,response);
        request.getRequestDispatcher("/articleList.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
