package com.blog.webSrc.controller;

import java.util.List;

import com.blog.common.model.ContentInfo;
import com.blog.webSrc.services.ContentInfoServices;
import com.jfinal.core.Controller;

public class ArticleController extends Controller {

	static ContentInfoServices services = ContentInfoServices.me;

	public void index(){
		String contentid = getPara("content");
		if(contentid!=null){
			ContentInfo contentInfo = services.findDetailsById(contentid);
			List<ContentInfo> contentInfos = services.findHotRead("read_count");//热门阅读
			List<ContentInfo> commentlist = services.findHotRead("comment_count");//评论排行

			setAttr("contentInfo",contentInfo);
			setAttr("contentInfos",contentInfos);
			setAttr("commentlist",commentlist);
		}
		render("articledetail.html");
	}
}
