package com.snwd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snwd.dao.ChannelDao;
import com.snwd.model.Channel;
import com.snwd.service.ChannelManager;

@Service("channelManager")
public class ChannelManagerImpl extends GenericManagerImpl<Channel, Long> implements ChannelManager{
	public ChannelDao channelDao;
	@Autowired
	public void setChannelDao(ChannelDao channelDao){
		this.dao = channelDao;
		this.channelDao = channelDao;
	}
	@Override
	public void deleteChannel(String channelCode) {
		channelDao.deleteChannel(channelCode);
		
	}

	@Override
	public Channel editChannel(String channelCode) {
		
		return channelDao.editChannel(channelCode);
	}

	@Override
	public List getChannels(String sql) {
		
		return channelDao.getChannels(sql);
	}

	@Override
	public void saveChannel(Channel channel) {
		channelDao.saveChannel(channel);
	}

	

}
