 package com.snwd.dao.ibatis;
 
 import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.util.ClassUtils;

import com.snwd.dao.GenericDao;
 
 public class GenericDaoiBatis<T, PK extends Serializable> extends SqlMapClientDaoSupport
   implements GenericDao<T, PK>
 {
   protected final Log log = LogFactory.getLog(getClass());
   private Class<T> persistentClass;
 
   public GenericDaoiBatis(Class<T> persistentClass)
   {
     this.persistentClass = persistentClass;
   }
 
   public List<T> getAll()
   {
     return getSqlMapClientTemplate().queryForList(iBatisDaoUtils.getSelectQuery(ClassUtils.getShortName(this.persistentClass)), null);
   }
 
   public T get(PK id)
   {
     Object object = getSqlMapClientTemplate().queryForObject(iBatisDaoUtils.getFindQuery(ClassUtils.getShortName(this.persistentClass)), id);
 
     if (object == null) {
       this.log.warn("Uh oh, '" + this.persistentClass + "' object with id '" + id + "' not found...");
       throw new ObjectRetrievalFailureException(ClassUtils.getShortName(this.persistentClass), id);
     }
     return (T) object;
   }
 
   public boolean exists(PK id)
   {
     Object object = getSqlMapClientTemplate().queryForObject(iBatisDaoUtils.getFindQuery(ClassUtils.getShortName(this.persistentClass)), id);
 
     return object != null;
   }
 
   public T save(T object)
   {
     String className = ClassUtils.getShortName(object.getClass());
     Object primaryKey = iBatisDaoUtils.getPrimaryKeyValue(object);
     Class primaryKeyClass = iBatisDaoUtils.getPrimaryKeyFieldType(object);
     String keyId = null;
 
     if (primaryKey != null) {
       keyId = primaryKey.toString();
     }
 
     if (StringUtils.isBlank(keyId)) {
       iBatisDaoUtils.prepareObjectForSaveOrUpdate(object);
       primaryKey = getSqlMapClientTemplate().insert(iBatisDaoUtils.getInsertQuery(className), object);
       iBatisDaoUtils.setPrimaryKey(object, primaryKeyClass, primaryKey);
     } else {
       iBatisDaoUtils.prepareObjectForSaveOrUpdate(object);
       getSqlMapClientTemplate().update(iBatisDaoUtils.getUpdateQuery(className), object);
     }
 
     if (iBatisDaoUtils.getPrimaryKeyValue(object) == null) {
       throw new ObjectRetrievalFailureException(className, object);
     }
     return object;
   }
 
   public void remove(PK id)
   {
     getSqlMapClientTemplate().update(iBatisDaoUtils.getDeleteQuery(ClassUtils.getShortName(this.persistentClass)), id);
   }

@Override
public List<T> findByNamedQuery(String arg0, Map<String, Object> arg1) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<T> getAllDistinct() {
	// TODO Auto-generated method stub
	return null;
}
 }

