package cn.edu.hdu.service.impl;

import cn.edu.hdu.dao.ReviewDao;
import cn.edu.hdu.dao.impl.ReviewDaoImpl;
import cn.edu.hdu.domain.Review;
import cn.edu.hdu.domain.Review_User;
import cn.edu.hdu.service.ReviewService;

import java.util.List;

public class ReviewServiceImpl implements ReviewService {
    private ReviewDao dao = new ReviewDaoImpl();

    @Override
    public List<Review_User> findReviewByArticleId(String article_id) {
        return dao.findReviewByArticleId(article_id);
    }

    @Override
    public void addReview(Review_User review) {
        dao.addReview(review);
    }

    @Override
    public void delReview(String review_id) {
        dao.delReview(Integer.parseInt(review_id));
    }

    @Override
    public void delReviewByArticleId(String article_id) {
        dao.delReviewByArticleId(Integer.parseInt(article_id));
    }

    @Override
    public void delReviewByUserId(String id) {
        dao.delReviewByUserId(Integer.parseInt(id));
    }
}
