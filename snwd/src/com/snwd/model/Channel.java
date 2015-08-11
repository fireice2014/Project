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
@Table(name="channel")
public class Channel extends BaseObject implements Serializable{
	private Long channelCode;//频道编码
	private String channelName;//频道名称
	private String superCode;//上级编码
	private String lookNum;//查看数
	private String invitationNum;//帖子数
	private String isDelete="0";//是否删除     1：是  0：否
	private String level;//级别
	//临时字段
	private String todayNum;//今日帖子数
	private String yesterdayNum;//昨日帖子数
	private String allNum;//所有帖子数
	private String allUser;//所有会员数
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@SearchableId
	public Long getChannelCode() {
		return channelCode;
	}

	public void setChannelCode(Long channelCode) {
		this.channelCode = channelCode;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getSuperCode() {
		return superCode;
	}

	public void setSuperCode(String superCode) {
		this.superCode = superCode;
	}

	public String getLookNum() {
		return lookNum;
	}

	public void setLookNum(String lookNum) {
		this.lookNum = lookNum;
	}

	public String getInvitationNum() {
		return invitationNum;
	}

	public void setInvitationNum(String invitationNum) {
		this.invitationNum = invitationNum;
	}
	
	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	@Transient
	public String getTodayNum() {
		return todayNum;
	}

	public void setTodayNum(String todayNum) {
		this.todayNum = todayNum;
	}
	@Transient
	public String getYesterdayNum() {
		return yesterdayNum;
	}

	public void setYesterdayNum(String yesterdayNum) {
		this.yesterdayNum = yesterdayNum;
	}
	@Transient
	public String getAllNum() {
		return allNum;
	}

	public void setAllNum(String allNum) {
		this.allNum = allNum;
	}
	@Transient
	public String getAllUser() {
		return allUser;
	}

	public void setAllUser(String allUser) {
		this.allUser = allUser;
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
