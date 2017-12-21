package com.blog.webSrc.controller;

import com.blog.common.annotation.NeedLogin;
import com.blog.common.model.BlogUser;
import com.blog.util.CodeGeneratorUtils;
import com.blog.util.StringUtils;
import com.blog.webSrc.common.SessionConstants;
import com.blog.webSrc.services.BlogUserServices;
import com.jfinal.core.Controller;

public class BlogController extends Controller {

	static BlogUserServices services = BlogUserServices.me;

	@NeedLogin
	public void index(){
		Object user_id = getSession().getAttribute(SessionConstants.USER_ID);
		BlogUser user = services.findById(user_id);
		setAttr("user", user);
		render("blog.html");
	}
	
	@NeedLogin
	public void resetPas(){
		render("resetPas.html");
	}
	
	@NeedLogin
	public void doResetPas(){
		String errmsg;
		boolean boo;
		try {
			Object user_name = getSession().getAttribute(SessionConstants.USER_NAME);
			String oldPass = getPara("inputPassword1");
			String newPass = getPara("inputPassword2");
			String newPass2 = getPara("inputPassword3");

			errmsg = null;boo = false;
			if(StringUtils.isEmpty(oldPass)||StringUtils.isEmpty(newPass)||StringUtils.isEmpty(newPass2)){
				boo = false;
				errmsg = "密码不能为空,请重新输入";
			}else if(!newPass.equals(newPass2)){
				boo = false;
				errmsg = "新密码不一致,请重新输入";
			}else if(!CodeGeneratorUtils.generalPasw(oldPass).equals(services.findbyUserName(user_name.toString()).getUserPwd())){
				boo = false;
				errmsg = "原密码错误,请重新输入";
			}else if(oldPass.equals(newPass)){
				boo = false;
				errmsg = "新旧密码一致,请重新输入";
			}else{
				if(services.updatePwd(user_name,CodeGeneratorUtils.generalPasw(newPass))){
					boo = true;
					setSessionAttr("user_id", null);
					setSessionAttr("user_name", null);
					setSessionAttr(SessionConstants.USER_IMAGE_URL,null);
				}else{
					boo = false;
					errmsg = "错误，请重试";
				}
			}
		} catch (Exception e) {
			boo = false;
			errmsg = "错误，请重试";
			e.printStackTrace();
		}
		setAttr("success",boo);
		setAttr("errmsg",errmsg); 
		renderJson();
	}
}
