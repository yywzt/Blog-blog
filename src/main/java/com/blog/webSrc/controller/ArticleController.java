package com.blog.webSrc.controller;

import java.util.List;

import com.blog.common.model.ContentInfo;
import com.blog.webSrc.services.ContentInfoServices;
import com.jfinal.core.Controller;

public class ArticleController extends Controller {

	static ContentInfoServices services = ContentInfoServices.me;

	/**文章详情*/
	public void index(){
		String contentid = getPara("content");
		if(contentid!=null){
			ContentInfo contentInfo = services.findDetailsById(contentid);
			//最近文章
			List<ContentInfo> latelyContentInfos = services.findLatelyContentInfo(contentInfo.getUserId());
			List<ContentInfo> contentInfos = services.findHotRead("read_count");//热门阅读
			List<ContentInfo> commentlist = services.findHotRead("comment_count");//评论排行

			setAttr("latelyContentInfos",latelyContentInfos);
			setAttr("contentInfo",contentInfo);
			setAttr("contentInfos",contentInfos);
			setAttr("commentlist",commentlist);
		}
		render("articledetail.html");
	}
	
	/**点赞*/
	public void Fabulous(){
		String content_id = getPara("content_id");
		ContentInfo contentInfo = services.findById(content_id);
		contentInfo.setLaudCount(contentInfo.getLaudCount()+1);
		setAttr("success", contentInfo.update());
		renderJson();
	}
}
