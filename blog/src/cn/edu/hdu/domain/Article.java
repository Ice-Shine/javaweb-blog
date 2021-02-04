package cn.edu.hdu.domain;

public class Article {
    private int article_id;
    private int user_id;
    private String article_title;
    private String article_context;
    private String article_date;
    private String article_ind;

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

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public String getArticle_context() {
        return article_context;
    }

    public void setArticle_context(String article_context) {
        this.article_context = article_context;
    }

    public String getArticle_date() {
        return article_date;
    }

    public void setArticle_date(String article_date) {
        this.article_date = article_date;
    }

    public String getArticle_ind() {
        return article_ind;
    }

    public void setArticle_ind(String article_ind) {
        this.article_ind = article_ind;
    }

    @Override
    public String toString() {
        return "Article{" +
                "article_id=" + article_id +
                ", user_id=" + user_id +
                ", article_title='" + article_title + '\'' +
                ", article_context='" + article_context + '\'' +
                ", article_date='" + article_date + '\'' +
                ", article_ind='" + article_ind + '\'' +
                '}';
    }
}
