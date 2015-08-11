package com.snwd.dao.ibatis;

import java.util.List;

import com.snwd.dao.ReplyDetailDao;
import com.snwd.model.ReplyDetail;

public class ReplyDetailDaoiBatis extends GenericDaoiBatis<ReplyDetail,Long>implements ReplyDetailDao{
	public ReplyDetailDaoiBatis() {
		super(ReplyDetail.class);
	}

	//删除
	public void deleteReplyDetail(String replyCode) {
		getSqlMapClientTemplate().delete("deleteReplyDetail",replyCode);		
	}
	//获取对象
	public ReplyDetail getReplyDetail(String replyCode) {
		ReplyDetail replyDetail = (ReplyDetail) getSqlMapClientTemplate().queryForObject("getReplyDetail",replyCode);
		return replyDetail;
	}

	//获取列表
	public List getReplyDetails(String sql) {
		List list = getSqlMapClientTemplate().queryForList("getReplyDetails",sql);
		return list;
	}
	//保存
	public void saveReplyDetail(ReplyDetail replyDetail) {
		if (replyDetail.getReplyCode()!=null && !"".equals(replyDetail.getReplyCode())){
			getSqlMapClientTemplate().update("updateReplyDetail",replyDetail);
		}else{
			getSqlMapClientTemplate().insert("addReplyDetail",replyDetail);
		}
	}
	
}
