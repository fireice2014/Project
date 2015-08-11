package com.snwd.dao.ibatis;

import java.util.List;

import com.snwd.dao.ChannelDao;
import com.snwd.model.Channel;

public class ChannelDaoiBatis extends GenericDaoiBatis<Channel, Long> implements ChannelDao{
	public ChannelDaoiBatis(){
		super(Channel.class);
	}
	//删除
	@Override
	public void deleteChannel(String channelCode) {
		getSqlMapClientTemplate().delete("deleteChannel",channelCode);
		
	}
    //获取对象
	@Override
	public Channel editChannel(String channelCode) {
		Channel channel = (Channel) getSqlMapClientTemplate().queryForObject("getChannel",channelCode);
		return channel;
	}
    //获取列表
	@Override
	public List getChannels(String sql) {
		List list = getSqlMapClientTemplate().queryForList("getChannels",sql);
		return list;
	}
    //保存
	@Override
	public void saveChannel(Channel channel) {
		if (channel.getChannelCode()!=null && !"".equals(channel.getChannelCode())){
			getSqlMapClientTemplate().update("updateChannel",channel);
		}else{
			getSqlMapClientTemplate().insert("addChannel",channel);
		}
	}

}
