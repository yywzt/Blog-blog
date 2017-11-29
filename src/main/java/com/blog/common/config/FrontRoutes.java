package com.blog.common.config;

import com.blog.webSrc.controller.BlogController;
import com.blog.webSrc.controller.CommunityController;
import com.blog.webSrc.controller.IndexController;
import com.blog.webSrc.controller.LoginController;
import com.blog.webSrc.controller.MarkdownController;
import com.jfinal.config.Routes;

public class FrontRoutes extends Routes {

	@Override
	public void config() {
		setBaseViewPath("/WEB-INF/Front");
		//登录注册
		add("/", LoginController.class);
		//首页
		add("/index", IndexController.class);
		//社区
		add("/community", CommunityController.class);
		//博客
		add("/blog", BlogController.class);
		//编辑器
		add("/markdown", MarkdownController.class);
	}

}
