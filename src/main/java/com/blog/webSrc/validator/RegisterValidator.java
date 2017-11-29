package com.blog.webSrc.validator;

import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.validate.Validator;

public class RegisterValidator extends Validator {

	@Override
	protected void validate(Controller c) {
		if(StrKit.isBlank(c.getPara("username"))){
			validateRequiredString("username","usernamemsg", "用户名或邮箱不能为空");
		}
		if(StrKit.isBlank(c.getPara("userpwd"))){
			validateEmail("userpwd", "userpwdmsg", "请输入密码");
		}else{
			if(StrKit.isBlank(c.getPara("userpwd_rel"))){
				validateEmail("userpwd_rel", "userpwd_relmsg", "请确入密码");
			}else{
				if(!c.getPara("userpwd").equals(c.getPara("userpwd_rel"))){
					validateEmail("userpwd_rel", "userpwd_relmsg", "密码不一致");
				}
			}
		}
		if(StrKit.isBlank(c.getPara("verificode"))){
			validateEmail("verificode", "verificodemsg", "请输入验证码");
		}else{
			if(!c.validateCaptcha("verificode")){
				validateEmail("verificode", "verificodemsg", "请输入正确的验证码");
			}
		}
	}

	@Override
	protected void handleError(Controller c) {
//		c.keepModel(User.class, "user");
		c.renderJson();
	}

}
