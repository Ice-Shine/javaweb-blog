package cn.edu.hdu.domain;

public class Review {
    private int id;
    private int article_id;
    private int user_id;
    private String review_context;
    private String review_date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getReview_context() {
        return review_context;
    }

    public void setReview_context(String review_context) {
        this.review_context = review_context;
    }

    public String getReview_date() {
        return review_date;
    }

    public void setReview_date(String review_date) {
        this.review_date = review_date;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", article_id=" + article_id +
                ", user_id=" + user_id +
                ", review_context='" + review_context + '\'' +
                ", review_date='" + review_date + '\'' +
                '}';
    }
}
