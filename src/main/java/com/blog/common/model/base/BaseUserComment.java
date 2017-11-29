package com.blog.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUserComment<M extends BaseUserComment<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setContentId(java.lang.Integer contentId) {
		set("content_id", contentId);
	}

	public java.lang.Integer getContentId() {
		return get("content_id");
	}

	public void setCommitUserId(java.lang.Integer commitUserId) {
		set("commit_user_id", commitUserId);
	}

	public java.lang.Integer getCommitUserId() {
		return get("commit_user_id");
	}

	public void setCommitContent(java.lang.String commitContent) {
		set("commit_content", commitContent);
	}

	public java.lang.String getCommitContent() {
		return get("commit_content");
	}

	public void setCommitDt(java.util.Date commitDt) {
		set("commit_dt", commitDt);
	}

	public java.util.Date getCommitDt() {
		return get("commit_dt");
	}

	public void setDr(java.lang.Integer dr) {
		set("dr", dr);
	}

	public java.lang.Integer getDr() {
		return get("dr");
	}

}
