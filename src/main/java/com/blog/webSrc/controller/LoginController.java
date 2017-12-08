package com.blog.webSrc.controller;

import com.blog.common.model.BlogUser;
import com.blog.util.CodeGeneratorUtils;
import com.blog.util.DateUtils;
import com.blog.util.MyCaptchRenderController;
import com.blog.util.StringUtils;
import com.blog.webSrc.common.SessionConstants;
import com.blog.webSrc.services.BlogUserServices;
import com.blog.webSrc.validator.LoginValidator;
import com.blog.webSrc.validator.RegisterValidator;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;


public class LoginController extends Controller {

	static BlogUserServices services = BlogUserServices.me;
	public void login(){
		render("login.html");
	}
	
	/**登录*/
	@Before({LoginValidator.class})
	public void doLogin(){
		String username = getPara("username").trim();
		String userpwd = getPara("userpwd");
		try {
			if(validate(username, userpwd)){
				BlogUser user = services.findbyUserName(username);
				afterLoginSucess(user);
				setAttr("success", true);
				String referer = this.getRequest().getHeader("referer");
				setAttr("url", referer);
			}
		} catch (Exception e) {
			setAttr("success", false);
			setAttr("errmsg", "登录出错!");
			e.printStackTrace();
		}
//		redirect("/index");
		renderJson();
	}
	
	public void logOut(){
		//清空session
		setSessionAttr("user_id", null);
		setSessionAttr("user_name", null);
		redirect("/index");
	}
	
	private boolean validate(String username,String userpwd){
		String error = "";
		String matchPass = null;
		if(StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(userpwd)){
			BlogUser user = null;
			user = services.findbyUserName(username);
			if(user == null){
				error = "用户名或密码错误";
			}else{
				matchPass = user.getUserPwd();
				if(!matchPasw(userpwd,matchPass)){
					error = "用户名或密码错误";
				}
			}
		}else{
			error = "用户名或密码不能为空!";
		}
		//没有错误信息，即登录成功
		if(StringUtils.isEmpty(error)){
			return true;
		}
		setAttr("errmsg", error);
		return false;
	}
	
	private boolean matchPasw(String userpwd, String matchPass) {
		return CodeGeneratorUtils.generalPasw(userpwd).equals(matchPass);
	}

	private void afterLoginSucess(BlogUser user){
		//缓存用户信息及用户权限至Session
		setSessionAttr(SessionConstants.USER_ID, user.getInt("user_id"));
		setSessionAttr(SessionConstants.USER_NAME, user.getStr("user_name"));
		setSessionAttr(SessionConstants.USER_IMAGE_URL, user.getStr("user_image_url"));
		user.setUserLastLoginDt(DateUtils.getCurDateTime());
		user.update();
		/*Role[] myRole = server.findUserRole(user);
		//用户菜单列表
		Module[][] modules = server.findUserModule(user);
		//角色授权
		setSessionAttr(SessionConstants.ROLE_LIST,JsonKit.toJson(myRole));
		//用户授权--菜单及功能
		if(modules!=null && modules.length>1){
			setSessionAttr(SessionConstants.MENU_LIST_WEB, modules[0]);
			setSessionAttr(SessionConstants.MENU_LIST_MGR, modules[1]);
		}*/
	}
	
	public void img(){
		render(new MyCaptchRenderController());
	}
	
	/*public void validator(String code){
		boolean istrue = validateCaptcha(code);
		if(istrue){
			setAttr("success", "true");
			setAttr("msg", "验证成功");
		}
		renderJson();
	}*/
	
	/**注册页面*/
	public void register(){
		render("register.html");
	}
	
	/**注册*/
	@Before(RegisterValidator.class)
	public void doRegister(){
		try {
			String username = getPara("username");
			String userpwd = getPara("userpwd");
			if(services.findbyUserName(username.trim())!=null){
				setAttr("errmsg", "此用户名已被占用");
				setAttr("success", false);
				renderJson();
				return;
			}
			BlogUser user = new BlogUser();
			user.setUserName(username.trim());
			user.setUserPwd(CodeGeneratorUtils.generalPasw(userpwd));
			user.setUserRegisterTime(DateUtils.getCurDateTime());
			user.setUserEnabled(0);
			setAttr("success", user.save());
		} catch (Exception e) {
			setAttr("errmsg", "注册失败");
			setAttr("success", false);
			e.printStackTrace();
		}
		renderJson();
	}
	
}
