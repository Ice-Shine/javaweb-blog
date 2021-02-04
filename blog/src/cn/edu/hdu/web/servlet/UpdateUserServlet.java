package cn.edu.hdu.web.servlet;

import cn.edu.hdu.domain.User;
import cn.edu.hdu.service.UserService;
import cn.edu.hdu.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {
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

        if (text == null || !text.equalsIgnoreCase(imageText)) {
            request.setAttribute("imageMess", "验证码输入错误!");
            request.getRequestDispatcher("/upuser.jsp").forward(request, response);
        }else{
            //封装对象
            Map<String, String[]> map = request.getParameterMap();
            User user = new User();
            try {
                BeanUtils.populate(user,map);//使用工具包
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            //调用Service保存
            UserService service = new UserServiceImpl();
            service.updateUser(user);
            request.getSession().setAttribute("user",user);
            //跳转回登录页面\
            request.setAttribute("imageMess", "修改成功！");
            //response.sendRedirect(request.getContextPath()+"/upuser.jsp");
            request.getRequestDispatcher("/upuser.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
