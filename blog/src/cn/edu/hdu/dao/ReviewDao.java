package cn.edu.hdu.dao;

import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;

import java.util.List;

public interface ReviewDao {
    //用文章id找到带username的review
    List<Review_User> findReviewByArticleId(String article_id);
    /*添加评论*/
    void addReview(Review_User review);
    /*删除评论*/
    void delReview(int review_id);
    //用文章id删除评论
    void delReviewByArticleId(int parseInt);
    //用user_id删除评论
    void delReviewByUserId(int user_id);
}
