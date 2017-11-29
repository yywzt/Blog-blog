package com.blog.util;

import java.util.HashSet;
import java.util.Set;

public class StringUtils {
	
	public static boolean isNotEmpty(String value){
		if(value == null || value.toString().trim().length() == 0){
			return false;
		}
		return true;
	}
	
	public static boolean isNotEmptyObj(Object obj){
		if(obj != null && obj.toString().trim().length() > 0)
			return true;
		return false;
	}
	
	public static boolean isEmpty(String value){
		if(value == null || value.toString().trim().length() == 0){
			return true;
		}
		return false;
	}
	
	public static boolean isEmptyObj(Object obj){
		if(obj == null || obj.toString().trim().length() == 0)
			return true;
		return false;
	}
	
	public static boolean isDouble(Object obj){
		if(obj == null || obj.toString().trim().length() == 0)
			return false;
        try {
            Double.valueOf(obj.toString());
        }catch (Exception e){
            return false;
        }
		return true;
	}
    //xws add 20170831
	/**
	 * 转换成字符类型对象
	 * @param obj
	 * @return
	 */
	public static String parseToString(Object obj){
		if(obj == null){
			return null;
		}
		if(obj.toString().trim().length() == 0){
			return "";
		}
		return obj.toString();
	}

	public static String toSql(String str) {

		if (str != null && !"".equals(str)) {
			String[] arr = str.split(",");

			if (arr.length == 1) {
				return "'" + arr[0] + "'";
			}
			Set set = new HashSet();
			StringBuffer buf = new StringBuffer();
			for (int i = 0; i < arr.length; i++) {
				if (StringUtils.isEmpty(arr[i]) || set.contains(arr[i]))
					continue;
				if (buf.length() > 0)
					buf.append(",");
				buf.append("'").append(arr[i]).append("'");
				set.add(arr[i]);
			}
			return buf.toString();
		} else {
			return null;
		}

	}



	/**
	 * 乱码处理
	 * @param obj
	 * @return
	 */
	public static String charset(String obj){
		if(obj!=null){
			if(!(java.nio.charset.Charset.forName("GBK").newEncoder().canEncode(obj))){
				try {
					obj=new String(obj.getBytes("iso-8859-1"),"UTF-8");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return obj;
	}

























}
