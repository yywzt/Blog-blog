package com.blog.webSrc.services;

import java.util.List;
import java.util.Map;

import com.blog.common.config.GlobalConstants;
import com.blog.common.model.ContentInfo;
import com.blog.util.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

public class ContentInfoServices {

	public static final ContentInfoServices me = new ContentInfoServices();
	private static final ContentInfo dao = ContentInfo.dao;
	
	public ContentInfo findById(Object idValues){
		return dao.findById(idValues);
	}
	
	/**分页查询所有文章*/
	public Page<ContentInfo> findAll(int pageNumber,int pageSize,Map<String,Object> paramMap){
		if(pageNumber<=0)
			pageNumber = 1;
		if(pageSize <= 0)
			pageSize = GlobalConstants.getPageSize();
		StringBuffer select = new StringBuffer("SELECT users.user_name,users.user_image_url,content_info.content_id,content_info.user_id,"
				+ "	content_info.type_id,content_info.title,content_info.content,content_info.create_dt,content_info.read_count,"
				+ " content_info.laud_count,content_info.comment_count,content_info.dr,art.type_code,art.type_name "); 
		StringBuffer where = new StringBuffer("FROM content_info content_info "
				+ " INNER JOIN blog_user users ON content_info.user_id=users.user_id"
				+ "	LEFT JOIN article_sort art ON content_info.type_id=art.type_id where 1=1 ");
		if(paramMap!=null){
			Object user_id = paramMap.get("user_id");
			if(StringUtils.isNotEmptyObj(user_id)){
				where.append(" and (content_info.user_id = '"+user_id.toString()+"')");
			}
			//类型
			Object type_name = paramMap.get("type_name");
			if(StringUtils.isNotEmptyObj(type_name)){
				where.append(" and (art.type_name = '"+type_name.toString()+"')");
			}
			//是否有效
			Object dr = paramMap.get("dr");
			if(StringUtils.isNotEmptyObj(dr)){
				where.append(" and (content_info.dr = '"+dr.toString()+"')");
			}
//			Object objSearchKey = paramMap.get("searchKey");
//			if(StringUtils.isNotEmptyObj(objSearchKey)){
//				String searchKey = objSearchKey.toString();
//				if(StringUtils.isNotEmpty(searchKey)){
//					searchKey = searchKey.trim();
//					whereSql.append(" and (corp.corpname like concat('%',?,'%') or CONCAT_WS('-',dept2.deptname,dept.deptname) like concat('%',?,'%') or post.postname like concat('%',?,'%') or u.usercode like concat('%',?,'%') or u.username like concat('%',?,'%'))");
//					lsParas.add(searchKey);
//					lsParas.add(searchKey);
//					lsParas.add(searchKey);
//					lsParas.add(searchKey);
//					lsParas.add(searchKey);
//				}
//			}
		}
		StringBuffer orderby =  new StringBuffer(" ORDER BY content_info.create_dt DESC ");
		where.append(orderby);
		return dao.paginate(pageNumber, pageSize, select.toString(), where.toString());
	}
	
	/**根据文章id查询详情*/
	public ContentInfo findDetailsById(String contentid){
		String sql = "SELECT users.user_name,users.user_image_url,users.user_description,content_info.content_id,content_info.user_id,"
				+ "	content_info.type_id,content_info.title,content_info.content,content_info.create_dt,content_info.read_count,"
				+ " content_info.laud_count,content_info.comment_count,content_info.dr,art.type_code,art.type_name"
				+ " FROM content_info content_info INNER JOIN blog_user users ON content_info.user_id=users.user_id"
				+ "	LEFT JOIN article_sort art ON content_info.type_id=art.type_id where content_id = " + contentid;
		return dao.findFirst(sql);
	}
	/**热门阅读(阅读量前十)*/
	public List<ContentInfo> findHotRead(String count){
		String sql = "SELECT content_id,title,read_count,comment_count from content_info ORDER BY ? DESC LIMIT 0,10;";
		return dao.find(sql,count);
	}
	
	/**修改某个字段的值*/
	public int updaterow(String id,String filed,String value){
		String sql = "UPDATE content_info set "+filed+" = ? where content_id = ? ";
		return Db.update(sql,value,id);
	}
}
