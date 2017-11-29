package com.blog.webSrc.services;

import com.blog.common.model.BlogUser;

public class BlogUserServices {
	public static final BlogUserServices me = new BlogUserServices();
	private static final BlogUser dao = new BlogUser().dao();
	
	public BlogUser findbyUserName(String username){
		String sql = "SELECT * FROM blog_user where user_name = ? ";
		return dao.findFirst(sql, username);
	}
}
