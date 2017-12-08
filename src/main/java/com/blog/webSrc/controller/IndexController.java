package com.blog.webSrc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blog.common.config.GlobalConstants;
import com.blog.common.model.ArticleSort;
import com.blog.common.model.ContentInfo;
import com.blog.webSrc.services.ArticleSortServices;
import com.blog.webSrc.services.ContentInfoServices;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class IndexController extends Controller {

	static ContentInfoServices services = ContentInfoServices.me;
	static ArticleSortServices asservices = ArticleSortServices.me;
	
	public void index(){
		Integer pageNumber=getParaToInt("pageNumber");
		Integer pageSize=getParaToInt("pageSize");
		if(pageNumber==null)
			pageNumber = 1;
		if(pageSize == null)
			pageSize = GlobalConstants.getPageSize();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("dr", 0);
		Page<ContentInfo> pageContent = services.findAll(pageNumber, pageSize,map);//最新文章
		List<ArticleSort> articleSorts = asservices.findThematicRankings(4);//专题介绍
		List<ContentInfo> contentInfos = services.findHotRead("read_count");//热门阅读
		List<ContentInfo> commentlist = services.findHotRead("comment_count");//评论排行
		setAttr("articleSorts", articleSorts);
		setAttr("contentInfos", contentInfos);
		setAttr("commentlist", commentlist);
		setAttr("pagelist", pageContent.getList());
		setAttr("totalPage", pageContent.getTotalPage());
		setAttr("totalRow", pageContent.getTotalRow());
		setAttr("curPage", pageNumber);
		setAttr("pageSize", pageSize);
		render("index.html");
	}
}
