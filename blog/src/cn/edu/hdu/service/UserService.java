package cn.edu.hdu.service;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.PageBean;
import cn.edu.hdu.domain.User;

import java.util.List;

public interface UserService {
    //保存User对象
    void addUser(User user);
    //通过文章id找作者名
    User findUserByArticleId(String article_id);

    PageBean<User> findUser(String currentPage, String rows);

    /*根据id删除User*/
    void delUser(String id);
    /*修改用户数据*/
    void updateUser(User user);
    //找到userid，供添加文章使用
    List<Integer> findUserId();
}
