package com.blog.webSrc.controller;

import java.io.File;
import java.util.List;

import com.blog.common.annotation.NeedLogin;
import com.blog.common.model.ArticleSort;
import com.blog.common.model.ContentInfo;
import com.blog.util.DateUtils;
import com.blog.util.StringUtils;
import com.blog.webSrc.common.SessionConstants;
import com.blog.webSrc.services.ArticleSortServices;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

@NeedLogin
public class MarkdownController extends Controller {

	static ArticleSortServices services = ArticleSortServices.me;
	
	public void index(){
		render("markdown.html");
	}
	
	/**查询所有的文章类型*/
	public void articleType(){
		List<ArticleSort> typelist = services.findAll();
		setAttr("typelist", typelist);
		renderJson();
	}
	
	/**发布文章*/
	public void publishArticles(){
		try {
			String title=getPara("title");
			String type=getPara("type");
			String content=getPara("content");
			Object user_id = getSession().getAttribute(SessionConstants.USER_ID);
			if(StringUtils.isNotEmpty(title)&&StringUtils.isNotEmpty(type)){
				ContentInfo contentInfo = new ContentInfo();
				contentInfo.setUserId(Integer.parseInt(user_id.toString()));
				contentInfo.setTitle(title);
				contentInfo.setTypeId(services.findIdBySearch(type));
				contentInfo.setContent(content);
				contentInfo.setCreateDt(DateUtils.getCurDateTime());
				boolean issave = contentInfo.save();
				if(issave){
					setAttr("msg", "发布成功");
					setAttr("success", true);
				}else{
					setAttr("msg", "发布失败");
					setAttr("success", false);
				}
			}else{
				setAttr("msg", "数据为空,保存错误,请重新发布");
				setAttr("success", false);
			}
		} catch (Exception e) {
			setAttr("msg", "错误,请重新发布");
			setAttr("success", false);
			e.printStackTrace();
		}
		renderJson();
	}
	
	/**markdown发布文章时添加图片*/
	public void uploadImg(){
		try {
			UploadFile uploadFile = getFile("editormd-image-file", "/articlesImgs/"+DateUtils.getCurDayStr(), 10*1024*1024, "UTF-8");
			File file = uploadFile.getFile();
			if(file!=null){
				String uploadPath = file.getPath();
				String url = uploadPath.substring(uploadPath.lastIndexOf("upload"));
				setAttr("success", 1);
				setAttr("message", "上传成功");
				setAttr("url",url);
			}
		} catch (Exception e) {
			setAttr("success", 0);
			setAttr("message", "上传失败");
			e.printStackTrace();
		}
		renderJson();
	}
	
}
