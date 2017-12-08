package comblog.common.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import com.blog.common.annotation.NeedLogin;
import com.blog.util.StringUtils;
import com.blog.webSrc.common.SessionConstants;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;

public class AuthInterceptor implements Interceptor {

	/**
	 * 判断当前请求是ajax请求
	 * @return
	 */
	public boolean isAjax(Controller controller){
		  HttpServletRequest request=controller.getRequest();
		  String requestedWith=request.getHeader("x-requested-with");
		  return StrKit.notBlank(requestedWith)&&requestedWith.equals("XMLHttpRequest");
	}
	
	public void intercept(Invocation inv) {
		Controller c = inv.getController();
		Method mothod = inv.getMethod();
		if(mothod.isAnnotationPresent(NeedLogin.class) || c.getClass().isAnnotationPresent(NeedLogin.class)){//是否需要登录
			Object obj = c.getSessionAttr(SessionConstants.USER_ID);
			if(StringUtils.isEmptyObj(obj)){
				//未登录状态
				if(isAjax(c)){
					c.setAttr("success", false);
					c.setAttr("errormsg", "请先登录");
					c.renderJson();
				}else{
					c.render("/WEB-INF/Front/login.html");
				}
				return;
			}
		}
		
		inv.invoke();
	}

	
}
