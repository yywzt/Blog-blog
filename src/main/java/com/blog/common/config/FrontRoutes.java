package com.blog.common.config;

import com.blog.webSrc.controller.CommunityController;
import com.blog.webSrc.controller.IndexController;
import com.blog.webSrc.controller.LoginController;
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
		//我的博客
		add(new blogRoutes());
	}

}
