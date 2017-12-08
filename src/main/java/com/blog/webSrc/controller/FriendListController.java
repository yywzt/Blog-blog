package com.blog.webSrc.controller;

import com.blog.common.annotation.NeedLogin;
import com.jfinal.core.Controller;

@NeedLogin
public class FriendListController extends Controller {

	public void index(){
		renderFreeMarker("index.html");
	}
}
