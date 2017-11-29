package com.blog.common.config;

public class GlobalConstants {
	
	//默认系统编码
	public static final String CHARSET_NAME="UTF-8";
	
	//默认系统加密规则
	public static final String GLORITHM = "SHA";
	
	/**
	 * AJAX异常状态码
	 */
	//业务异常
	public static final int AJAX_ERROR_BUSINESS = 100;
	//系统异常
	public static final int AJAX_ERROR_SYSTEM = 101;
	//Cache Name
	public static final String EHCACHE_NAME = "wesCache";
	//默认每页显示条数
	public static int pageSize;
	public static int getPageSize() {
		return pageSize;
	}
	public static void setPageSize(int pageSize) {
		GlobalConstants.pageSize = pageSize;
	}
	
	
}
