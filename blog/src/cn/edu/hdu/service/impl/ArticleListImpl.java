package cn.edu.hdu.service.impl;

import cn.edu.hdu.dao.ArticleDao;
import cn.edu.hdu.dao.impl.ArticleDaoImpl;
import cn.edu.hdu.domain.Article;
import cn.edu.hdu.domain.PageBean;
import cn.edu.hdu.service.ArticleListService;

import java.util.List;

public class ArticleListImpl implements ArticleListService {
    private ArticleDao dao = new ArticleDaoImpl();

    @Override
    public List<Article> findAll() {
        //调用dao完成查询
        return dao.findAll();


    }

    @Override
    public PageBean<Article> findArticleByPage(String _currentPage, String _rows,String words) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage <= 0){
            currentPage = 1;
        }
        //调用dao查询总记录数
        int totalCount = dao.findTotalCount(words);
        //计算总页码,如果总记录数为0则直接返回1，否则currentPage将会是负数从而报错
        int totalPage = (totalCount % rows == 0&&totalCount!=0) ? totalCount/rows : totalCount/rows + 1;
        if(currentPage > totalPage){
            currentPage = totalPage;
        }

        PageBean<Article> pb = new PageBean<Article>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        pb.setTotalPage(totalPage);
        pb.setTotalCount(totalCount);
        //调用dao查询list集合
        int start = (currentPage - 1) * rows;//计算本页开始的索引
        List<Article> list = dao.findByPage(start,rows,words);
        pb.setList(list);


        return  pb;
    }

    @Override
    public Article findArticle(String article_id) {
        Article article = dao.findArticle(article_id);
        /*String article_context = article.getArticle_context();
        //转换换行符
        String s = article_context.replaceAll(">","&gt;");
        s = s.replaceAll("<","&lt;");
        s =s.replaceAll("\r\n", "<br/>");
        s = s.replaceAll(" ","&nbsp;");
        s = s.replaceAll("\n","<br/>");
        //System.out.println(s);
        article.setArticle_context(s);*/
        return article;

    }

    @Override
    public void delArticle(String article_id) {
        dao.delArticle(Integer.parseInt(article_id));
    }

    @Override
    public void addArticle(Article article) {
        dao.addArticle(article);
    }

    @Override
    public void updateArticle(Article article) {
        dao.updateArticle(article);
    }

    @Override
    public void delArticleByUserId(String id) {
        dao.delArticleByUserId(Integer.parseInt(id));
    }
}
