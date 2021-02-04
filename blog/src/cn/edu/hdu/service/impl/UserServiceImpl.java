package cn.edu.hdu.service.impl;

import cn.edu.hdu.dao.UserDao;
import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.PageBean;
import cn.edu.hdu.domain.User;
import cn.edu.hdu.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDao();

    @Override
    public void addUser(User user) {
        User user1 = dao.findUserByUsername(user.getUsername());
        if(user1!=null){
            return;
        }else {
            dao.add(user);
        }



    }

    @Override
    public User findUserByArticleId(String article_id) {
        return dao.findUserByArticleId(article_id);
    }

    @Override
    public PageBean<User> findUser(String _currentPage, String _rows) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage <= 0){
            currentPage = 1;
        }
        //调用dao查询总记录数
        int totalCount = dao.findTotalCount();
        int totalPage = totalCount % rows == 0 ? totalCount/rows : totalCount/rows + 1;//计算总页码
        if(currentPage > totalPage){
            currentPage = totalPage;
        }

        PageBean<User> pb = new PageBean<User>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        pb.setTotalPage(totalPage);
        pb.setTotalCount(totalCount);
        //调用dao查询list集合
        int start = (currentPage - 1) * rows;//计算本页开始的索引
        List<User> list = dao.findByPage(start,rows);
        pb.setList(list);


        return  pb;
    }

    @Override
    public void delUser(String id) {
        dao.delUser(Integer.parseInt(id));
    }

    @Override
    public void updateUser(User user) {
        dao.update(user);
    }

    @Override
    public List<Integer> findUserId() {
        return dao.findUserId();
    }
}
