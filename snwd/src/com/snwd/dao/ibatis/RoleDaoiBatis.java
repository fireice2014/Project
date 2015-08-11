 package com.snwd.dao.ibatis;
 
 import java.util.List;

import com.snwd.dao.RoleDao;
import com.snwd.model.Role;
 
 public class RoleDaoiBatis extends GenericDaoiBatis<Role, Long>
   implements RoleDao
 {
   public RoleDaoiBatis()
   {
     super(Role.class);
   }
 
   public List<Role> getAll()
   {
     return getSqlMapClientTemplate().queryForList("getRoles", null);
   }
 
   public Role getRoleByName(String name)
   {
     return (Role)getSqlMapClientTemplate().queryForObject("getRoleByName", name);
   }
 
   public Role save(Role role)
   {
     if (role.getId() == null)
       getSqlMapClientTemplate().insert("addRole", role);
     else {
       getSqlMapClientTemplate().update("updateRole", role);
     }
     return role;
   }
 
   public void removeRole(String rolename)
   {
     getSqlMapClientTemplate().update("deleteRole", rolename);
   }
   @Override
	public Role getRoleObject(String id) {
		return (Role) getSqlMapClientTemplate().queryForObject("getRole",id);
	}
 }

