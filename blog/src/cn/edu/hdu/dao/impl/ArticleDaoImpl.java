package cn.edu.hdu.dao.impl;

import cn.edu.hdu.dao.ArticleDao;
import cn.edu.hdu.domain.Article;
import cn.edu.hdu.utill.JDBCUtills;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ArticleDaoImpl implements ArticleDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtills.getDataSource());

    @Override
    public List<Article> findAll() {
        //使用JDBC操作数据库
        String sql = "SELECT * FROM article";
        List<Article> articles = template.query(sql, new BeanPropertyRowMapper<Article>(Article.class));
        return articles;
    }

    @Override
    public int findTotalCount(String words) {
        String sql = "SELECT count(*) FROM article where 1=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if(words!=null&&!"".equals(words)){
            sb.append(" and article_title like ?");
            words="%"+words+"%";
            return template.queryForObject(sb.toString(),Integer.class,words);
        }else {
            return template.queryForObject(sb.toString(),Integer.class);
        }

    }

    @Override
    public List<Article> findByPage(int start, int rows, String words) {
        String sql = "SELECT * FROM article where 1=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if(words!=null&&!"".equals(words)){
            sb.append(" and article_title like ? ");
        }
        sb.append(" LIMIT ? , ? ");
        List<Article> list;
        if(words!=null&&!"".equals(words)){
            words="%"+words+"%";
            list = template.query(sb.toString(), new BeanPropertyRowMapper<Article>(Article.class),words,start,rows);

        }else {
            list = template.query(sb.toString(), new BeanPropertyRowMapper<Article>(Article.class),start,rows);

        }
        return list;
    }
/*
* 查找id对应的文章
* */
    @Override
    public Article findArticle(String article_id) {
        String sql = "SELECT * FROM article WHERE article_id = ?";
        Article article = template.queryForObject(sql, new BeanPropertyRowMapper<Article>(Article.class),article_id);
        return article;
    }

    @Override
    public void delArticle(int article_id) {
        String sql = "DELETE FROM article where article_id = ?";
        template.update(sql,article_id);
    }

    @Override
    public void addArticle(Article article) {
        //定义sql
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "INSERT INTO article (user_id,article_title,article_context,article_date,article_ind)VALUES (?,?,?,?,?)";
        template.update(sql,article.getUser_id(),article.getArticle_title(),article.getArticle_context(),sdf.format(date),article.getArticle_ind());
    }

    @Override
    public void updateArticle(Article article) {
        String sql = "update article set user_id = ? ,article_title = ? ,article_context = ? ,article_ind = ? where article_id = ? ";
        template.update(sql,article.getUser_id(),article.getArticle_title(),article.getArticle_context(),article.getArticle_ind(),article.getArticle_id());
    }

    @Override
    public void delArticleByUserId(int user_id) {
        String sql = "DELETE FROM article where user_id = ?";
        template.update(sql,user_id);
    }
}
