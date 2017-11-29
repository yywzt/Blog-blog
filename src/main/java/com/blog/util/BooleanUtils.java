package com.blog.util;

/**
 * 工具类:
 * 将字符Y/N或y/n或1(true)/0(false)转换为布尔型数值
 * @author hanyt
 * 2017-05-09
 */
public class BooleanUtils {
	
	public static String STR_TRUE = "Y";
	public static String STR_FALSE = "N";
	
	/**
	 * 将字符转换为布尔
	 * @param str 待转换值，取首字母
	 * @return
	 */
	public static boolean getBooleanByStr(String str){
		boolean bool = false;
		if(str == null || str.trim().length() == 0)
			return bool;
		str = str.trim().substring(0,1);
		if("y".equals(str) || "Y".equals(str) || "1".equals(str))
			bool = true;
		else
			bool = false;
		return bool;
	}
	
	public static String getStringByBool(boolean bool){
		if(bool)
			return BooleanUtils.STR_TRUE;
		else
			return BooleanUtils.STR_FALSE;
	}
}
