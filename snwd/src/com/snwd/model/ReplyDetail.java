package com.snwd.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.compass.annotations.SearchableId;

@Entity
@Table(name="replyDetail")
public class ReplyDetail extends BaseObject{
	private Long replyCode;//回复编码
	private String invitationCode;//帖子编码
	private String replyer;//回复人
	private String replyTime;//回复时间
	private String replyContent;//回复内容
	//临时字段
	private String roleName;
	//临时字段
	//private String channelCode;//频道编码
	
//	//预留字段
//	private String one;
//	private String two;
//	private String three;
//	private String four;
//	private String five;
//	private String six;
//	private String seven;
//	private String eight;
//	private String nine;
//	private String ten;
//	private String eleven;
//	private String twelve;
//	private String thirteen;
//	private String fourteen;
//	private String fifteen;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @SearchableId
	public Long getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(Long replyCode) {
		this.replyCode = replyCode;
	}

	public String getInvitationCode() {
		return invitationCode;
	}

	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

//	public String getOne() {
//		return one;
//	}
//
//	public void setOne(String one) {
//		this.one = one;
//	}
//
//	public String getTwo() {
//		return two;
//	}
//
//	public void setTwo(String two) {
//		this.two = two;
//	}
//
//	public String getThree() {
//		return three;
//	}
//
//	public void setThree(String three) {
//		this.three = three;
//	}
//
//	public String getFour() {
//		return four;
//	}
//
//	public void setFour(String four) {
//		this.four = four;
//	}
//
//	public String getFive() {
//		return five;
//	}
//
//	public void setFive(String five) {
//		this.five = five;
//	}
//
//	public String getSix() {
//		return six;
//	}
//
//	public void setSix(String six) {
//		this.six = six;
//	}
//
//	public String getSeven() {
//		return seven;
//	}
//
//	public void setSeven(String seven) {
//		this.seven = seven;
//	}
//
//	public String getEight() {
//		return eight;
//	}
//
//	public void setEight(String eight) {
//		this.eight = eight;
//	}
//
//	public String getNine() {
//		return nine;
//	}
//
//	public void setNine(String nine) {
//		this.nine = nine;
//	}
//
//	public String getTen() {
//		return ten;
//	}
//
//	public void setTen(String ten) {
//		this.ten = ten;
//	}
//
//	public String getEleven() {
//		return eleven;
//	}
//
//	public void setEleven(String eleven) {
//		this.eleven = eleven;
//	}
//
//	public String getTwelve() {
//		return twelve;
//	}
//
//	public void setTwelve(String twelve) {
//		this.twelve = twelve;
//	}
//
//	public String getThirteen() {
//		return thirteen;
//	}
//
//	public void setThirteen(String thirteen) {
//		this.thirteen = thirteen;
//	}
//
//	public String getFourteen() {
//		return fourteen;
//	}
//
//	public void setFourteen(String fourteen) {
//		this.fourteen = fourteen;
//	}
//
//	public String getFifteen() {
//		return fifteen;
//	}
//
//	public void setFifteen(String fifteen) {
//		this.fifteen = fifteen;
//	}
//	@Transient
//	public String getChannelCode() {
//		return channelCode;
//	}
//
//	public void setChannelCode(String channelCode) {
//		this.channelCode = channelCode;
//	}
	@Transient
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
