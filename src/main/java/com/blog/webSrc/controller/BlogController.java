package com.blog.webSrc.controller;

import com.blog.common.model.BlogUser;
import com.blog.webSrc.common.SessionConstants;
import com.blog.webSrc.services.BlogUserServices;
import com.jfinal.core.Controller;

public class BlogController extends Controller {

	static BlogUserServices services = BlogUserServices.me;
	public void index(){
		Object user_id = getSession().getAttribute(SessionConstants.USER_ID);
		BlogUser user = services.findById(user_id);
		setAttr("user", user);
		render("blog.html");
	}
	
	
}
