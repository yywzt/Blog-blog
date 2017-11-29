package com.blog.webSrc.validator;

import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.validate.Validator;

public class LoginValidator extends Validator {

	@Override
	protected void validate(Controller c) {
		if(StrKit.isBlank(c.getPara("username"))){
			validateRequiredString("username","usernamemsg", "用户名或邮箱不能为空");
		}
		if(StrKit.isBlank(c.getPara("userpwd"))){
			validateRequiredString("userpwd", "userpwdmsg", "密码不能为空");
		}
	}

	@Override
	protected void handleError(Controller c) {
//		c.keepModel(User.class, "user");
		c.renderJson();
	}

}
