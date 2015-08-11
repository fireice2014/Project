package com.snwd.dao;


import java.util.List;

import com.snwd.model.Channel;

public interface ChannelDao extends GenericDao<Channel,Long>{
	public void saveChannel(Channel channel);//保存
	public void deleteChannel(String channelCode);//删除
	public Channel editChannel(String channelCode);//获取对象
	public List getChannels(String sql);//获取List
}
