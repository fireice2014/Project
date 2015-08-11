package com.snwd.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.compass.annotations.SearchableId;

@Entity
@Table(name="invitation")
public class Invitation extends BaseObject implements Serializable{ 
	private Long invitationCode;//帖子编码
	private String invitationTitle;//帖子标题
	private String invitationContent;//帖子内容
	private String viewTimes="0";//查看次数
	private String respondTimes="0";//回复数
	private String sendName;//发送时间
	private String isTop;//是否置顶
	private String isEssence;//是否精华
	private String channelCode;//所属频道编码
	private String sendEr;//发送人
	private String zdTime;//置顶时间
	private String isShow="1";//是否显示 0:显示1:不显示
	//临时字段
	private String roleName;//角色名称
	private String endUser;//最后发帖人
	private String endTime;//最后发帖时间
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @SearchableId
	public Long getInvitationCode() {
		return invitationCode;
	}
	public void setInvitationCode(Long invitationCode) {
		this.invitationCode = invitationCode;
	}
	public String getInvitationTitle() {
		return invitationTitle;
	}
	public void setInvitationTitle(String invitationTitle) {
		this.invitationTitle = invitationTitle;
	}
	public String getInvitationContent() {
		return invitationContent;
	}
	public void setInvitationContent(String invitationContent) {
		this.invitationContent = invitationContent;
	}
	
	public String getViewTimes() {
		return viewTimes;
	}
	public void setViewTimes(String viewTimes) {
		this.viewTimes = viewTimes;
	}
	public String getRespondTimes() {
		return respondTimes;
	}
	public void setRespondTimes(String respondTimes) {
		this.respondTimes = respondTimes;
	}
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public String getIsTop() {
		return isTop;
	}
	public void setIsTop(String isTop) {
		this.isTop = isTop;
	}
	public String getIsEssence() {
		return isEssence;
	}
	public void setIsEssence(String isEssence) {
		this.isEssence = isEssence;
	}
	
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
	
	public String getSendEr() {
		return sendEr;
	}
	public void setSendEr(String sendEr) {
		this.sendEr = sendEr;
	}
	@Transient
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	@Transient
	public String getEndUser() {
		return endUser;
	}
	public void setEndUser(String endUser) {
		this.endUser = endUser;
	}
	@Transient
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getZdTime() {
		return zdTime;
	}
	public void setZdTime(String zdTime) {
		this.zdTime = zdTime;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	@Override
	public boolean equals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return null;
	}
}
