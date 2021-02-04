package cn.edu.hdu.service;

import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;

import java.util.List;

public interface ReviewService {
    List<Review_User> findReviewByArticleId(String article_id);

    void addReview(Review_User review);
    //通过评论id删除评论
    void delReview(String review_id);
    //通过article_id删除评论
    void delReviewByArticleId(String article_id);
    //通过user_id删除评论
    void delReviewByUserId(String id);
}
