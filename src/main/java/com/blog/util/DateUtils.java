package com.blog.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 工具类:
 * 日期格式转换及获取
 * @author hanyt
 * 2017-05-09
 */
public class DateUtils {
	
	 public final static SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
	 public final static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
	 public final static SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 public final static SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
	
	/**
	 * 获取当前服务器具体时间
	 * @return
	 */
	public static String getCurDateTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date());
	}
	
	/**
	 * 获取当前服务器日期
	 * @return
	 */
	public static String getCurDate(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(new Date());
	}


    /**
     * 获取当前服务器日期
     * @return
     */
    public static String getCurDayStr(){
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        return df.format(new Date());
    }
	
	/**
	 * 获取当前年
	 * @return
	 */
	public static String getYear(){
		
		Calendar date =Calendar.getInstance();
		return date.get(Calendar.YEAR)+"";
	}
	
	/**
	 * 获取当前月
	 * @return
	 */
	public static String getMonth(){
		
		Calendar date =Calendar.getInstance();
		return date.get(Calendar.MONTH + 1)+"";
	}
	
	/**
	 * 获取当前年份以及明年的年份
	 * @return
	 */
	public static List<Integer> getYearAndNextYear(){
		
		List<Integer> yearList = new ArrayList<Integer>();
		Calendar date =Calendar.getInstance();
		int nowyear = date.get(Calendar.YEAR);
		yearList.add(nowyear);
		yearList.add(nowyear + 1);
		return yearList;
	}
	
	 public static Date parseDate(String in, String format) {
	     SimpleDateFormat df = new SimpleDateFormat(format);
	        try {
				return df.parse(in);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	     return null;
	 }

	 public static String getDateStr(Date in, String format) {
	     if (in == null) {
	         return "";
	     }
	     SimpleDateFormat df = new SimpleDateFormat(format);
	     return df.format(in);
	 }
}
