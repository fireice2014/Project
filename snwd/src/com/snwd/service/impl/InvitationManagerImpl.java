package com.snwd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snwd.dao.InvitationDao;
import com.snwd.model.Invitation;
import com.snwd.service.InvitationManager;

@Service("invitationManager")
public class InvitationManagerImpl extends GenericManagerImpl<Invitation,Long> implements InvitationManager{
	public InvitationDao invitationDao;
	@Autowired
	public void setInvitationDao(InvitationDao invitationDao){
		this.dao = invitationDao;
		this.invitationDao = invitationDao;
	}
	@Override
	public void deleteInvitation(String invitationCode) {
		invitationDao.deleteInvitation(invitationCode);
	}
	@Override
	public Invitation editInvitation(String invitationCode) {
		return invitationDao.editInvitation(invitationCode);
	}
	@Override
	public List getInvitations(String sql) {
		return invitationDao.getInvitations(sql);
	}
	@Override
	public void saveInvitation(Invitation invitation) {
		invitationDao.saveInvitation(invitation);
	}
}
