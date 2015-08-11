package com.snwd.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snwd.dao.ReplyDetailDao;
import com.snwd.model.ReplyDetail;
import com.snwd.service.ReplyDetailManager;
@Service("replyDetailManager")
public class ReplyDetailManagerImpl extends GenericManagerImpl<ReplyDetail,Long> implements ReplyDetailManager{
	private ReplyDetailDao replyDetailDao;
	@Autowired
	public void setReplyDetailManagerImpl(ReplyDetailDao replyDetailDao){
		this.dao = replyDetailDao;
		this.replyDetailDao=replyDetailDao;
	}
	//删除
	public void deleteReplyDetail(String replyCode) {
		replyDetailDao.deleteReplyDetail(replyCode);
	}
	//获取对象
	public ReplyDetail getReplyDetail(String replyCode) {
		return replyDetailDao.getReplyDetail(replyCode);
	}
	//获取List
	public List getReplyDetails(String sql) {
		return replyDetailDao.getReplyDetails(sql);
	}
	//保存
	public void saveReplyDetail(ReplyDetail replyDetail) {
		replyDetailDao.saveReplyDetail(replyDetail);
	}
}
