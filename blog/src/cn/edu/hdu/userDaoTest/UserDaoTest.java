package cn.edu.hdu.userDaoTest;


import cn.edu.hdu.dao.ArticleDao;
import cn.edu.hdu.dao.ReviewDao;
import cn.edu.hdu.dao.UserDao;
import cn.edu.hdu.dao.impl.ArticleDaoImpl;
import cn.edu.hdu.dao.impl.ReviewDaoImpl;
import cn.edu.hdu.domain.*;
import cn.edu.hdu.service.ArticleListService;
import cn.edu.hdu.service.impl.ArticleListImpl;
import org.junit.Test;

import java.util.List;

public class UserDaoTest {
    @Test
    public void TestLogin(){
        /*User loginuser = new User();
        loginuser.setUsername("123");
        loginuser.setPassword("111");*/
        UserDao dao = new UserDao();
        //User user = dao.login(loginuser);
        List<Integer> userId = dao.findUserId();
        System.out.println(userId);
    }
    @Test
    public void TestArticle(){
        ReviewDao dao = new ReviewDaoImpl();
        List<Review_User> reviewByArticleId = dao.findReviewByArticleId("8");
        System.out.println(reviewByArticleId);
    }
}
