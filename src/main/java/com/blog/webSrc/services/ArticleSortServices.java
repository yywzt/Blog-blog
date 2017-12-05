package com.blog.webSrc.services;

import java.util.List;

import com.blog.common.model.ArticleSort;
import com.jfinal.plugin.activerecord.Db;

public class ArticleSortServices {

	public static final ArticleSortServices me = new ArticleSortServices();
	private static final ArticleSort dao = new ArticleSort().dao();
	
	public List<ArticleSort>  findAll(){
		return dao.find("select * from article_sort where dr = 0 ");
	}
	
	public String findIdBySearch(String search){
		return Db.queryStr("select type_id from article_sort where type_name = ? or type_code = ? ",search,search);
	}
	
	//专题列表排行前n
	public List<ArticleSort> findThematicRankings(int n){
		return dao.find("select ats.* from content_info ci LEFT JOIN article_sort ats ON ci.type_id=ats.type_id GROUP BY ci.type_id ORDER BY COUNT(*) DESC limit 0,?",n);
	}
	
}
