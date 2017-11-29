package com.blog.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Model;

/**
 * @author : luyong@xinfushe.com
 * @version : V1.0
 * @date : 2017/6/19 17:32
 */
public class ToHashMap {


    /**
     * List 异步输出
     *
     * @param list
     * @param keys
     * @return
     */
    public static List<Map> toJsonList(List list, String keys) {
        List<Map> resList = new ArrayList<Map>();
        Map<String, Object> temp;
        Model obj;
        if (list == null || list.size() == 0) {
            return null;
        }
        for (Object b : list) {
            if ((b instanceof Model)) {
                obj = (Model) b;
                temp = toMap(obj, keys);
                if (temp != null) {
                    resList.add(temp);
                }
            }

        }
        if(resList.size() == 0){
            return null;
        }
        return resList;

    }


    /**
     * obj  异步输出
     *
     * @param keys 需要转化的字段 使用英文逗号隔开 如果为空则输出全部字段
     * @return
     */
    public static Map<String, Object> toMap(Object b, String keys) {
        Map<String, Object> param = new HashMap<String, Object>();
        Model obj = null;
        if(b == null){
            return  null ;
        }
        if (b instanceof Model)
            obj = (Model) b;
        String[] initkKeys = null;
        if(StringUtils.isEmpty(keys)){
            initkKeys= obj._getAttrNames();
        }else {
            initkKeys = keys.split(",");
        }
        for (String s : initkKeys) {
            param.put(s, obj.get(s));
        }
        return param;
    }

}
