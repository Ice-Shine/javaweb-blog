package cn.edu.hdu.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
* 管理员登录验证过滤器
* */
@WebFilter("*")
public class AdloginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String uri = request.getRequestURI();
     /*   if(uri.contains("/login.jsp")||uri.contains("/VerifyCodeServlet")||uri.contains("/LoginServlet3")){
            chain.doFilter(req, resp);
        }else{
            Object user = request.getSession().getAttribute("user");
            if(user != null){
                chain.doFilter(req, resp);
            }else{
                request.setAttribute("error","请先登录");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        }
*/      if(uri.contains("/adArticleServlet")||uri.contains("/Del")||uri.contains("/del")||uri.contains("/ad/")||uri.contains("/FindAd")||uri.contains("/FindUserByPageServlet")||uri.contains("/findReviewByPageServlet")){
            Object user = request.getSession().getAttribute("user");
            if(user != null){
                chain.doFilter(req, resp);
            }else{
                request.setAttribute("error","请先登录");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
        }else {
            chain.doFilter(req, resp);
        }



    }

    public void init(FilterConfig config) throws ServletException {

    }

}
