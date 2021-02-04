package cn.edu.hdu.dao;

import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.User;
import cn.edu.hdu.utill.JDBCUtills;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtills.getDataSource());

    public User login(User loginUser){

        try {
            String sql = "select * from user where username = ? and password = ? ";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),loginUser.getUsername(),loginUser.getPassword());
            return user;

        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    //添加，注册操作
    public void add(User user) {
        //定义sql
        String sql = "Insert into user values(null,?,?,?,?,?,?,?,?) ";
        template.update(sql,user.getUsername(),user.getPassword(),user.getUser_email(),user.getUser_realname(),user.getUser_phone(),user.getUser_sex(),user.getUser_bir(),0);
    }
    //通过文章id找作者名
    public User findUserByArticleId(String article_id) {
        String sql= "SELECT id,username,PASSWORD,user_email,user_realname,user_phone,user_sex,user_bir FROM USER,ARTICLE WHERE USER.`id`=ARTICLE.`user_id`AND ARTICLE.`article_id`=?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), article_id);
        return user;
    }

    public int findTotalCount() {
        String sql = "SELECT count(*) FROM USER";
        return template.queryForObject(sql,Integer.class);

    }

    public List<User> findByPage(int start, int rows) {
        String sql = "SELECT * FROM user LIMIT ? , ?";
        List<User> list = template.query(sql, new BeanPropertyRowMapper<User>(User.class),start,rows);
        return list;
    }

    /*根据ID删除User*/
    public void delUser(int i) {
        String sql = "DELETE FROM user where id = ?";
        template.update(sql,i);
    }
    /*
    * 修改用户数据
    * */
    public void update(User user) {
        String sql = "update user set username = ? ,password = ? ,user_email = ? , user_realname = ? ,user_phone = ? ,user_sex = ? ,user_bir = ? where id = ? ";
        template.update(sql,user.getUsername(),user.getPassword(),user.getUser_email(),user.getUser_realname(),user.getUser_phone(),user.getUser_sex(),user.getUser_bir(),user.getId());
    }

    public User findUserByUsername(String username){
        try {
            String sql = "select * from user where username = ? ";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),username);
            return user;

        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }
    //找到user_id
    public List<Integer> findUserId() {
        String sql = "SELECT id FROM USER ";
        List<Integer> list = template.queryForList(sql,Integer.class);
        return list;
    }
}
