package com.snwd.webapp.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.snwd.model.Invitation;
import com.snwd.model.ReplyDetail;

public class ReplyDetailAction extends BaseAction{
	private ReplyDetail replyDetail = new ReplyDetail();
	private List list = new ArrayList();
	private String replyCode;
	private String invitationCode;
	private String channelCode;
	/*
	 * 保存回复
	 */
	public String save(){
		String invitationCode = getRequest().getParameter("invitationCode");
		String channelCode = getRequest().getParameter("channelCode");
		String replyContent = getRequest().getParameter("replyContent");
		String username = getRequest().getRemoteUser();//获得当前系统登录用户
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());//获得当前系统时间
		if(invitationCode!=null && !"".equals(invitationCode)){
			replyDetail.setInvitationCode(invitationCode);
		}
		Invitation in = invitationManager.editInvitation(invitationCode);
		int newrespondTimes=0;
		newrespondTimes = Integer.valueOf(in.getRespondTimes())+1;
		in.setRespondTimes(String.valueOf(newrespondTimes));
		invitationManager.saveInvitation(in);
		replyDetail.setReplyer(username);
		replyDetail.setReplyTime(time);
		replyDetail.setReplyContent(replyContent);
		replyDetailManager.saveReplyDetail(replyDetail);
		return SUCCESS;
	}
	public ReplyDetail getReplyDetail() {
		return replyDetail;
	}
	public void setReplyDetail(ReplyDetail replyDetail) {
		this.replyDetail = replyDetail;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public String getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}
	public String getInvitationCode() {
		return invitationCode;
	}
	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
}
