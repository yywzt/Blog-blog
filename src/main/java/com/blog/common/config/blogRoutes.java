package com.blog.common.config;

import com.blog.webSrc.controller.ArticleManagementController;
import com.blog.webSrc.controller.BlogController;
import com.blog.webSrc.controller.MarkdownController;
import com.jfinal.config.Routes;

public class blogRoutes extends Routes {

	@Override
	public void config() {
		setBaseViewPath("/WEB-INF/Front");
		//博客
		add("/blog", BlogController.class);
		//编辑器
		add("/blog/markdown", MarkdownController.class);
		//文章管理
		add("blog/myartman", ArticleManagementController.class);
	}

}
