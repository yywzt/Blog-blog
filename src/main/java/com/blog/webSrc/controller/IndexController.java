package com.blog.webSrc.controller;

import com.blog.common.config.GlobalConstants;
import com.blog.common.model.ContentInfo;
import com.blog.webSrc.services.ContentInfoServices;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class IndexController extends Controller {

	static ContentInfoServices services = ContentInfoServices.me;
	public void index(){
		Integer pageNumber=getParaToInt("pageNumber");
		Integer pageSize=getParaToInt("pageSize");
		if(pageNumber==null)
			pageNumber = 1;
		if(pageSize == null)
			pageSize = GlobalConstants.getPageSize();
		Page<ContentInfo> pageContent = services.findAll(pageNumber, pageSize);
		setAttr("pagelist", pageContent.getList());
		setAttr("totalPage", pageContent.getTotalPage());
		setAttr("curPage", pageNumber);
		setAttr("pageSize", pageSize);
		render("index.html");
	}
}
