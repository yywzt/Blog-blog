package com.blog.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseSystemMessage<M extends BaseSystemMessage<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setReceiveId(java.lang.Integer receiveId) {
		set("receive_id", receiveId);
	}

	public java.lang.Integer getReceiveId() {
		return get("receive_id");
	}

	public void setSendDefault(java.lang.Integer sendDefault) {
		set("send_default", sendDefault);
	}

	public java.lang.Integer getSendDefault() {
		return get("send_default");
	}

	public void setSystemTopics(java.lang.String systemTopics) {
		set("system_topics", systemTopics);
	}

	public java.lang.String getSystemTopics() {
		return get("system_topics");
	}

	public void setSystemContent(java.lang.String systemContent) {
		set("system_content", systemContent);
	}

	public java.lang.String getSystemContent() {
		return get("system_content");
	}

	public void setCreateDt(java.util.Date createDt) {
		set("create_dt", createDt);
	}

	public java.util.Date getCreateDt() {
		return get("create_dt");
	}

	public void setType(java.lang.String type) {
		set("type", type);
	}

	public java.lang.String getType() {
		return get("type");
	}

	public void setDr(java.lang.Integer dr) {
		set("dr", dr);
	}

	public java.lang.Integer getDr() {
		return get("dr");
	}

}
