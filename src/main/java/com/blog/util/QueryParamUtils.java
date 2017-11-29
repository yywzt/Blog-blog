package com.blog.util;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.json.FastJson;
import com.jfinal.kit.JsonKit;

/**
 * 查询参数转换工具
 * @author hanyt
 *
 */
public class QueryParamUtils {
	
	/**
	 * 将JSON参数转换成MAP<KEY,VALUE>的集合
	 * @param jsonString
	 * @return
	 */
	public static Map<String,Object> transQueryParam(String jsonString){
//		Map<String,String>[] paramsMap = JsonKit.parse(jsonString, Map[].class);
//		Map<String,Object> queryParam = new HashMap<String,Object>();
//		if(paramsMap!=null){
//			for(int i=0;i<paramsMap.length;i++){
//				String key = paramsMap[i].get("name");
//				if(StringUtils.isNotEmpty(key)){
//					queryParam.put(key, paramsMap[i].get("value"));
//				}
//			}
//		}
//		return queryParam;
		return FastJson.getJson().parse(jsonString,Map.class);
	}

}
