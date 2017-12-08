package com.blog.webSrc.controller;

import com.blog.common.annotation.NeedLogin;
import com.jfinal.core.Controller;

@NeedLogin
public class MessageCenterController extends Controller {

	public void index(){
		renderFreeMarker("messagecenter.html");
	}
}
