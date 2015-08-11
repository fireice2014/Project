package com.snwd.service;

import java.util.List;

import com.snwd.model.Invitation;

public interface InvitationManager extends GenericManager<Invitation,Long>{
	public void saveInvitation(Invitation invitation);//保存
	public void deleteInvitation(String invitationCode);//删除
	public Invitation editInvitation(String invitationCode);//获取对象
	public List getInvitations(String sql);//获取List
}
