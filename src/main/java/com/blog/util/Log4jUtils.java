package com.blog.util;

import com.jfinal.kit.LogKit;

/**
 * 日志工具类
 * @author hanyt
 * 2017-06-21
 */
public class Log4jUtils {
	
	//调试
	public static final int DEBUG = 0;
	//异常
	public static final int ERROR = 1;
	//提示
	public static final int INFO = 2;
	//警告
	public static final int WARN = 3;
	
	/**
	 * 记录日志
	 * @param level 日志级别
	 * @param message 日志信息
	 */
	public static void log(int level,String message){
		toLog(level, message);
	}
	
	/**
	 * 记录日志
	 * @param level 日志级别
	 * @param message 日志信息
	 * @param className 日志触发全路径类名
	 * @param methodName 日志触发方法
	 */
	public static void log(int level,String message,String className,String methodName){
		String logMsg = String.format("调用类:%s\n调用方法:%s\n%s", className, methodName,message);
		toLog(level, logMsg);
	}
	
	/**
	 * 记录日志
	 * @param level 日志级别
	 * @param message 日志信息
	 * @param className 日志触发全路劲类名
	 * @param methodName 日志触发方法
	 * @param paramValues 方法参数
	 */
	public static void log(int level,String message,String className,String methodName,Object...paramValues){
		Class cls = null;
		StringBuffer paramTypes = new StringBuffer("(");
		try {
			cls = Class.forName(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//获取指定类指定方法的参数类型
		if(cls!=null){
			if(paramValues!=null && paramValues.length>0){
				for(int i=0;i<paramValues.length-1;i++){
					paramTypes.append(paramValues[i].getClass().getName()).append(",");
				}
				paramTypes.append(paramValues[paramValues.length-1].getClass().getName()).append(")");
			}
		}
		//入参值
		StringBuffer strValues = new StringBuffer("(");
		if(paramValues!=null && paramValues.length>0){
			for(int i=0;i<paramValues.length-1;i++){
				strValues.append(paramValues[i] == null ? "" : paramValues[i].toString()).append(",");
			}
		}
		strValues.append(paramValues[paramValues.length-1].toString()).append(")");
		String logMsg = String.format("调用类:%s\n调用方法:%s\n关键参数:%s\n参数值:%s\n%s", className, methodName,paramTypes.toString(),strValues.toString(),message);
		toLog(level, logMsg);
	}
	
	private static void toLog(int level,String message){
		switch(level){
			case DEBUG:
				LogKit.debug(message);
				break;
			case ERROR:
				LogKit.error(message);
				break;
			case INFO:
				LogKit.info(message);
				break;
			case WARN:
				LogKit.warn(message);
				break;
			default:
				LogKit.debug(message);
				break;
		}
	}
	
}
