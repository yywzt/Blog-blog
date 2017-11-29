package com.blog.util;

import com.jfinal.core.Controller;

public class CaptchaController extends Controller {

	public void index(){
		renderJsp("captcha.jsp");
	}
	
	public void img(){
		render(new MyCaptchRenderController());
	}
	
	public void validator(){
		boolean istrue = validateCaptcha("number");
		if(istrue){
			setAttr("success", "true");
			setAttr("msg", "验证成功");
		}
		renderJson();
	}
}
