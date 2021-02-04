package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

//将文章修改内容添加到数据库中
@WebServlet("/upadArticleServlet")
public class UpadArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 编码
        request.setCharacterEncoding("utf-8");
        // 获取请求参数

        //封装对象
        Map<String, String[]> map = request.getParameterMap();
        Article article = new Article();
        try {
            BeanUtils.populate(article,map);//使用工具包
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //调用Service保存
        ArticleListService service = new ArticleListImpl();
        service.updateArticle(article);
        //跳转回登录页面
        response.sendRedirect(request.getContextPath()+"/findAdarticleByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
