package com.snwd.service;

import java.util.List;

import com.snwd.model.Channel;


public interface ChannelManager extends GenericManager<Channel, Long>{
	public void saveChannel(Channel channel);//保存
	public void deleteChannel(String channelCode);//删除
	public Channel editChannel(String channelCode);//获取对象
	public List getChannels(String sql);//获取List
}
