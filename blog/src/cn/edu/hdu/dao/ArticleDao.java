package cn.edu.hdu.dao;

import cn.edu.hdu.domain.Article;

import java.util.List;

public interface ArticleDao {
    public List<Article> findAll();
    /*
    查询总记录数
     */
    int findTotalCount(String words);
    /*
    * 分页查询每页记录
    * */
    List<Article> findByPage(int start, int rows, String words);

    Article findArticle(String article_id);
    /*数据库用article_id删除文章*/
    void delArticle(int article_id);
    /*数据库添加文章*/
    void addArticle(Article article);
    /*数据库修改文章*/
    void updateArticle(Article article);
    //数据库用user_id删除文章
    void delArticleByUserId(int user_id);
}
