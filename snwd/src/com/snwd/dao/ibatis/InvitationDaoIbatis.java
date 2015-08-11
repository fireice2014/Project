package com.snwd.dao.ibatis;

import java.util.List;

import com.snwd.dao.InvitationDao;
import com.snwd.model.Invitation;

public class InvitationDaoIbatis extends GenericDaoiBatis<Invitation,Long> implements InvitationDao{
	public InvitationDaoIbatis(){
		super(Invitation.class);
	}
	//删除
	@Override
	public void deleteInvitation(String invitationCode) {
		getSqlMapClientTemplate().delete("deleteInvitation",invitationCode);
	}
	//获取对象
	@Override
	public Invitation editInvitation(String invitationCode) {
		Invitation invitation =(Invitation) getSqlMapClientTemplate().queryForObject("getInvitation",invitationCode);
		return invitation;
	}
	//获取列表
	@Override
	public List getInvitations(String sql) {
		List list = getSqlMapClientTemplate().queryForList("getInvitations",sql);
		return list;
	}
	//保存
	@Override
	public void saveInvitation(Invitation invitation) {
		if(invitation.getInvitationCode()!=null && !"".equals(invitation.getInvitationCode())){
			getSqlMapClientTemplate().update("updateInvitation", invitation);
		}else{
			getSqlMapClientTemplate().insert("addInvitation", invitation);
		}
	}
}
