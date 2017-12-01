package com.blog.common.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("article_sort", "type_id", ArticleSort.class);
		arp.addMapping("blog_friend", "id", BlogFriend.class);
		arp.addMapping("blog_info", "id", BlogInfo.class);
		arp.addMapping("blog_user", "user_id", BlogUser.class);
		arp.addMapping("content_info", "content_id", ContentInfo.class);
		arp.addMapping("friendly_link", "id", FriendlyLink.class);
		arp.addMapping("power_list", "id", PowerList.class);
		arp.addMapping("secret_message", "id", SecretMessage.class);
		arp.addMapping("stay_message", "id", StayMessage.class);
		arp.addMapping("sys_log", "id", SysLog.class);
		arp.addMapping("sys_login_record", "id", SysLoginRecord.class);
		arp.addMapping("sys_res", "id", SysRes.class);
		arp.addMapping("sys_role", "id", SysRole.class);
		arp.addMapping("sys_role_res", "id", SysRoleRes.class);
		arp.addMapping("sys_user_role", "id", SysUserRole.class);
		arp.addMapping("system_message", "id", SystemMessage.class);
		arp.addMapping("user_attention", "id", UserAttention.class);
		arp.addMapping("user_comment", "id", UserComment.class);
		arp.addMapping("user_rank", "rank_id", UserRank.class);
		arp.addMapping("visitor", "id", Visitor.class);
	}
}

