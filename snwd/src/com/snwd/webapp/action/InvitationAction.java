package com.snwd.webapp.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.snwd.model.Channel;
import com.snwd.model.Invitation;
import com.snwd.model.ReplyDetail;
import com.snwd.model.Role;
import com.snwd.model.User;

public class InvitationAction extends BaseAction{
	//  帖子列表
	private List list = new ArrayList();
	private Invitation invitation  =new Invitation();
	private String invitationCode;
	private String channelCode;
	private ReplyDetail replyDetail = new ReplyDetail();
	private List replyDetails = new ArrayList();
	private Channel channel = new Channel();
	public String backList(){
		String channelCode = getRequest().getParameter("channelCode");
		String sql=" where 1=1";
		if(channelCode!=null && !"".equals(channelCode)){
			sql+=" and channelCode='"+channelCode+"' order by zdTime desc";
		}
		list = invitationManager.getInvitations(sql);
		return SUCCESS;
	}
	/*
	 * 帖子列表页
	 */
	public String list(){
		String channelCode = getRequest().getParameter("channelCode");
		String sql=" where 1=1";
		if(channelCode!=null && !"".equals(channelCode)){
			sql+=" and channelCode='"+channelCode+"' order by zdTime desc";
		}
//		Invitation a =invitationManager.editInvitation(" where invitationCode='"+invitationCode+"'") ;
//		List list = invitationManager.getInvitations(" where channelCode='"+channelCode+"'");
		List list0 = invitationManager.getInvitations(sql);
		for(int m=0;m<list0.size();m++){
			Invitation ii = (Invitation) list0.get(m);
			List listr = replyDetailManager.getReplyDetails(" where invitationCode='"+ii.getInvitationCode()+"' order by replyTime desc");
			if(listr.size()>0){
				ReplyDetail rr =(ReplyDetail) listr.get(0);
				User user = userManager.getUserObject(rr.getReplyer());
				ii.setEndUser(user.getFirstName());
				ii.setEndTime(rr.getReplyTime());
			}
			list.add(ii);
		}
		//今日帖子数
		String time = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		List list2 = invitationManager.getInvitations(" where sendName like'%"+time+"%'");
		if(list2.size()>0){
			channel.setTodayNum(String.valueOf(list2.size()));
		}else{
			channel.setTodayNum("0");
		}
		//所有帖子数
		List list3 = invitationManager.getInvitations("");
		if(list3.size()>0){
			channel.setAllNum(String.valueOf(list3.size()));
		}else{
			channel.setAllNum("0");
		}
		//所有会员
		List list4 = userManager.getAll();
		if(list4.size()>0){
			channel.setAllUser(String.valueOf(list4.size()));
		}else{
			channel.setAllUser("0");
		}
		return SUCCESS;
	}
	/**
	 * 帖子详细页
	 * @return
	 */
	public String showTizi(){
		String invitationCode = getRequest().getParameter("invitationCode");
		
		if(invitationCode!=null && !"".equals(invitationCode)){
			invitation = invitationManager.editInvitation(invitationCode);
			if(invitation!=null){
				User user = userManager.getUserObject(invitation.getSendEr());
				if(user!=null){
					invitation.setSendEr(user.getFirstName());
					Role role = roleManager.getRoleObject(user.getId().toString());
					if(role!=null){
						invitation.setRoleName(role.getName());
					}
				}
			}
			int newviewTimes =0;
			newviewTimes = Integer.valueOf(invitation.getViewTimes())+1;
			invitation.setViewTimes(String.valueOf(newviewTimes));
			invitationManager.saveInvitation(invitation);
			List list = replyDetailManager.getReplyDetails(" where invitationCode='"+invitationCode+"'");
			
			for(int i=0;i<list.size();i++){
				ReplyDetail rr =(ReplyDetail) list.get(i);
				User user = userManager.getUserObject(rr.getReplyer());
				if(user!=null){
					rr.setReplyer(user.getFirstName());
					Role role = roleManager.getRoleObject(user.getId().toString());
					if(role!=null){
						rr.setRoleName(role.getName());
					}
				}
				replyDetails.add(rr);
			}
		}
		//今日帖子数
		String time = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		List list2 = invitationManager.getInvitations(" where sendName like'%"+time+"%'");
		if(list2.size()>0){
			channel.setTodayNum(String.valueOf(list2.size()));
		}else{
			channel.setTodayNum("0");
		}
		//所有帖子数
		List list3 = invitationManager.getInvitations("");
		if(list3.size()>0){
			channel.setAllNum(String.valueOf(list3.size()));
		}else{
			channel.setAllNum("0");
		}
		//所有会员
		List list4 = userManager.getAll();
		if(list4.size()>0){
			channel.setAllUser(String.valueOf(list4.size()));
		}else{
			channel.setAllUser("0");
		}
		return SUCCESS;
	}
	public String save(){
		if(channelCode!=null && !"".equals(channelCode)){
			invitation.setChannelCode(channelCode);
		}
		String invitationContent = getRequest().getParameter("invitationContent");
		String username = getRequest().getRemoteUser();
		invitation.setSendEr(username);
		invitation.setInvitationContent(invitationContent);
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		invitation.setSendName(time);
		invitationManager.saveInvitation(invitation);
		return SUCCESS;
	}
	public String edit(){
		if(invitationCode!=null && !"".equals(invitationCode)){
			invitation = invitationManager.editInvitation(invitationCode);
		}
		return SUCCESS;
	}
	public String delete(){
		if(invitationCode!=null && !"".equals(invitationCode)){
			invitationManager.deleteInvitation(invitationCode);
		}
		return SUCCESS;
	}
	/*
	 * 发帖验证是否登陆
	 */
	public String newTiezi(){
		//今日帖子数
		String time = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		List list2 = invitationManager.getInvitations(" where sendName like'%"+time+"%'");
		if(list2.size()>0){
			channel.setTodayNum(String.valueOf(list2.size()));
		}else{
			channel.setTodayNum("0");
		}
		//所有帖子数
		List list3 = invitationManager.getInvitations("");
		if(list3.size()>0){
			channel.setAllNum(String.valueOf(list3.size()));
		}else{
			channel.setAllNum("0");
		}
		//所有会员
		List list4 = userManager.getAll();
		if(list4.size()>0){
			channel.setAllUser(String.valueOf(list4.size()));
		}else{
			channel.setAllUser("0");
		}
		return SUCCESS;
	}
	public String sticky(){
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		if(invitationCode!=null && !"".equals(invitationCode)){
			invitation = invitationManager.editInvitation(invitationCode);
			invitation.setZdTime(time);
			invitationManager.saveInvitation(invitation);
		}
		return SUCCESS;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Invitation getInvitation() {
		return invitation;
	}
	public void setInvitation(Invitation invitation) {
		this.invitation = invitation;
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
	public ReplyDetail getReplyDetail() {
		return replyDetail;
	}
	public void setReplyDetail(ReplyDetail replyDetail) {
		this.replyDetail = replyDetail;
	}
	public List getReplyDetails() {
		return replyDetails;
	}
	public void setReplyDetails(List replyDetails) {
		this.replyDetails = replyDetails;
	}
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	
}
