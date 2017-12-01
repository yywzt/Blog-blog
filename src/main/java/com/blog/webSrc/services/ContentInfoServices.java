package com.blog.webSrc.services;

import com.blog.common.config.GlobalConstants;
import com.blog.common.model.ContentInfo;
import com.jfinal.plugin.activerecord.Page;

public class ContentInfoServices {

	public static final ContentInfoServices me = new ContentInfoServices();
	private static final ContentInfo dao = ContentInfo.dao;
	
	/**分页查询所有文章*/
	public Page<ContentInfo> findAll(int pageNumber,int pageSize){
		if(pageNumber<=0)
			pageNumber = 1;
		if(pageSize <= 0)
			pageSize = GlobalConstants.getPageSize();
		StringBuffer select = new StringBuffer("SELECT users.user_name,users.user_image_url,content_info.content_id,content_info.user_id,"
				+ "	content_info.type_id,content_info.title,content_info.content,content_info.create_dt,content_info.read_count,"
				+ " content_info.laud_count,content_info.comment_count,content_info.dr,art.type_code,art.type_name "); 
		StringBuffer where = new StringBuffer("FROM content_info content_info "
				+ " INNER JOIN blog_user users ON content_info.user_id=users.user_id"
				+ "	LEFT JOIN article_sort art ON content_info.type_id=art.type_id ");
		StringBuffer orderby =  new StringBuffer(" ORDER BY content_info.create_dt DESC ");
		where.append(orderby);
		return dao.paginate(pageNumber, pageSize, select.toString(), where.toString());
	}
}
