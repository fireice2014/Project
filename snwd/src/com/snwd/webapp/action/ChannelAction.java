package com.snwd.webapp.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.snwd.model.Channel;

public class ChannelAction  extends BaseAction{
	//频道列表
	private List list = new ArrayList();
	private Channel channel = new Channel();
	private String channelCode;
	private Map channelMap = new TreeMap();
	private List list11 = new ArrayList();
	/*
	 * 首页频道展示
	 */
	public String listTwo(){
		List list = channelManager.getChannels(" where isDelete='0'");
		for(int i=0;i<list.size();i++){
			Channel channel = (Channel) list.get(i);
			String sql="where channelCode='"+channel.getChannelCode()+"' order by sendName";
			List list1 = invitationManager.getInvitations(sql);
			if(list1.size()>0){
				channel.setInvitationNum(String.valueOf(list1.size()));
			}else{
				channel.setInvitationNum("0");
			}
			list11.add(channel);
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
	public String list(){
		List lists = channelManager.getChannels(" where isDelete='0'");
		for(int i=0;i<lists.size();i++){
			Channel c = (Channel) lists.get(i);
			if(c.getSuperCode()!=null && !"".equals(c.getSuperCode())){
				Channel cc = channelManager.editChannel(c.getSuperCode().toString());
				c.setSuperCode(cc.getChannelName());
			}
			list.add(c);
		}
		return SUCCESS;
	}
	public String save(){
		if(channel.getSuperCode()!=null && !"".equals(channel.getSuperCode())){
			channel.setLevel("2");
		}else{
			channel.setLevel("1");
		}
		channelManager.saveChannel(channel);
		return SUCCESS;
	}
    public String edit(){
    	List list = channelManager.getChannels(" where isDelete='0' and level='1'");
    	channelMap.put("", "请选择");
    	for(int i=0;i<list.size();i++){
    		Channel cc = (Channel) list.get(i);
    		channelMap.put(cc.getChannelCode().toString(),cc.getChannelName());
    	}
    	if(channelCode!=null && !"".equals(channelCode)){
    		channel = channelManager.editChannel(channelCode);
    	}
    	return SUCCESS;
    }
    public String delete(){
    	String channelCodes[] = getRequest().getParameterValues("channelCodes");
    	if(channelCodes!=null && !"".equals(channelCodes)){
    		for(int i=0;i<channelCodes.length;i++){
    			channelManager.deleteChannel(channelCodes[i]);
        	}
    	}
    	return SUCCESS;
    }
	public Map getChannelMap() {
		return channelMap;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
	public List getList11() {
		return list11;
	}
}
