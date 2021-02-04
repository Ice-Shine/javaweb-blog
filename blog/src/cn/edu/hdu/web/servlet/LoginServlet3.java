package cn.edu.hdu.web.servlet;

import cn.edu.hdu.dao.UserDao;
import cn.edu.hdu.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//有验证码的登录验证
@WebServlet(name = "LoginServlet3", value = "/LoginServlet3")
public class LoginServlet3 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 编码
        request.setCharacterEncoding("utf-8");
        // 获取请求参数
        /*
            拿到页面传过来的手动输入的验证码, 该验证码要和生成图片上的
            文本验证码比较, 如果相同, 验证码输入成功!
         */
        String imageText = request.getParameter("image");
        // 图片的验证码
        HttpSession session = request.getSession();
        String text = (String) session.getAttribute("text");
        session.removeAttribute("text");//让验证码一次性

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (text ==null || !text.equalsIgnoreCase(imageText)) {
            request.setAttribute("imageMess", "验证码输入错误!");
            request.setAttribute("username",username);
            request.setAttribute("password",password);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        // 获取用户名和密码

        User loginuser = new User();
        loginuser.setUsername(username);
        loginuser.setPassword(password);
        UserDao userDao = new UserDao();
        User user = userDao.login(loginuser);
        String admin = request.getParameter("admin");
        if(admin==null) admin="false";
        if (user!=null&&"false".equals(admin)) {
            // 将用户信息保存到session中
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("user",user);
            // 使用cookie实现回写用户名
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(60 * 60);
            // 通过响应头发送cookie
            response.addCookie(cookie);
            // 重定向登录成功界面
            response.sendRedirect(request.getContextPath() + "/success2.jsp");
        }else if(user!=null&&user.getAdmin()==1&&"true".equals(admin)){
            // 将用户信息保存到session中
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("user", user);

            // 使用cookie实现回写用户名
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(60 * 60);
            // 通过响应头发送cookie
            response.addCookie(cookie);
            // 重定向登录成功界面
            response.sendRedirect(request.getContextPath() + "/findUserByPageServlet");
        } else if(user!=null&&user.getAdmin()==0&&"true".equals(admin)){
            request.setAttribute("error", "您不是管理员!");

            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }else{
            request.setAttribute("error", "用户名或密码错误!");

            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }

}