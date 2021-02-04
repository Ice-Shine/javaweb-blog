package cn.edu.hdu.dao.impl;

import cn.edu.hdu.dao.ReviewDao;
import cn.edu.hdu.dao.UserDao;
import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;
import cn.edu.hdu.domain.User;
import cn.edu.hdu.utill.JDBCUtills;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ReviewDaoImpl implements ReviewDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtills.getDataSource());


    @Override
    public List<Review_User> findReviewByArticleId(String article_id) {
        String sql= "SELECT review.id,article_id,user_id,review_context,review_date,username FROM REVIEW,USER WHERE review.article_id =? AND user.`id`=review.`user_id` ";
        List<Review_User> review = template.query(sql, new BeanPropertyRowMapper<Review_User>(Review_User.class), article_id);
        return review;


    }

    @Override
    public void addReview(Review_User review) {
            //定义sql
            Date date = new Date();
            //记录当前时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            //找到User_id
            UserDao userDao = new UserDao();
            User user = userDao.findUserByUsername(review.getUsername());
            String sql = "INSERT INTO review (article_id,user_id,review_context,review_date)VALUES (?,?,?,?) ";
            template.update(sql,review.getArticle_id(),user.getId(),review.getReview_context(),sdf.format(date));


    }

    @Override
    public void delReview(int review_id) {
        String sql = "DELETE FROM review where id = ? ";
        template.update(sql,review_id);
    }

    @Override
    public void delReviewByArticleId(int article_id) {
        String sql = "DELETE FROM review where article_id = ? ";
        template.update(sql, article_id);
    }

    @Override
    public void delReviewByUserId(int user_id) {
        String sql = "DELETE FROM review where user_id = ? ";
        template.update(sql, user_id);
    }
}
