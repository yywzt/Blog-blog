package com.blog.common.config;

import com.blog.webSrc.controller.ArticleManagementController;
import com.blog.webSrc.controller.BlogController;
import com.blog.webSrc.controller.FriendListController;
import com.blog.webSrc.controller.MarkdownController;
import com.blog.webSrc.controller.MessageCenterController;
import com.jfinal.config.Routes;

public class blogRoutes extends Routes {

	@Override
	public void config() {
		setBaseViewPath("/WEB-INF/Front");
		//博客
		add("/blog", BlogController.class);
		/**个人中心*/
		//编辑器
		add("/blog/markdown", MarkdownController.class);
		//文章管理
		add("/blog/myartman", ArticleManagementController.class);
		//消息中心
		add("/blog/mescen", MessageCenterController.class);
		//好友列表
		add("/blog/friend", FriendListController.class);
	}

}
