package com.blog.webSrc.controller;

import java.util.HashMap;
import java.util.Map;

import com.blog.common.config.GlobalConstants;
import com.blog.common.model.ContentInfo;
import com.blog.webSrc.common.SessionConstants;
import com.blog.webSrc.services.ContentInfoServices;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

//文章管理
public class ArticleManagementController extends Controller {

	static ContentInfoServices services = ContentInfoServices.me;
	
	public void index(){
		render("articlemanagement.html");
	}
	
	public void AllContentInfo(){
		Object user_id = getSession().getAttribute(SessionConstants.USER_ID);
		Integer pageNumber = getParaToInt("page");
		Integer pageSize = getParaToInt("limit");
		if(pageNumber==null)
			pageNumber = 1;
		if(pageSize == null)
			pageSize = GlobalConstants.getPageSize();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		Page<ContentInfo> pagelist = services.findAll(pageNumber, pageSize, map);
		setAttr("data", pagelist.getList());
		setAttr("count", pagelist.getTotalRow());
		setAttr("code", 0);
		setAttr("msg", null);
//		setAttr("pagelist", pagelist.getPageNumber());
		renderJson();
	}
}
