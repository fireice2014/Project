package com.snwd.dao;

import java.util.List;

import com.snwd.model.ReplyDetail;

public interface ReplyDetailDao extends GenericDao<ReplyDetail,Long>{
	public void saveReplyDetail(ReplyDetail replyDetail);//保存
	public List getReplyDetails(String sql);//获取列表
	public void deleteReplyDetail(String replyCode);//删除
	public ReplyDetail getReplyDetail(String replyCode);//获取对象
}
