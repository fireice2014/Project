 package com.snwd.dao.ibatis;
 
 import java.util.List;

import com.snwd.dao.LookupDao;
import com.snwd.model.Role;
 
 public class LookupDaoiBatis extends UniversalDaoiBatis
   implements LookupDao
 {
   public List<Role> getRoles()
   {
     this.log.debug("Retrieving all role names...");
 
     return getSqlMapClientTemplate().queryForList("getRoles", null);
   }
 }

