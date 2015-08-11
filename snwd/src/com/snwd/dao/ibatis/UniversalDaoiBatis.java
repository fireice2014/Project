 package com.snwd.dao.ibatis;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.util.ClassUtils;

import com.snwd.dao.UniversalDao;

public class UniversalDaoiBatis extends SqlMapClientDaoSupport
  implements UniversalDao
{
  protected final Log log = LogFactory.getLog(getClass());

  public List getAll(Class clazz)
  {
    return getSqlMapClientTemplate().queryForList(iBatisDaoUtils.getSelectQuery(ClassUtils.getShortName(clazz)), null);
  }

  public Object get(Class clazz, Serializable primaryKey)
  {
    Object object = getSqlMapClientTemplate().queryForObject(iBatisDaoUtils.getFindQuery(ClassUtils.getShortName(clazz)), primaryKey);

    if (object == null) {
      throw new ObjectRetrievalFailureException(ClassUtils.getShortName(clazz), primaryKey);
    }
    return object;
  }

  public Object save(Object object)
  {
    String className = ClassUtils.getShortName(object.getClass());
    Object primaryKey = iBatisDaoUtils.getPrimaryKeyValue(object);
    String keyId = null;

    if (primaryKey != null) {
      keyId = primaryKey.toString();
    }

    if (StringUtils.isBlank(keyId)) {
      iBatisDaoUtils.prepareObjectForSaveOrUpdate(object);
      primaryKey = getSqlMapClientTemplate().insert(iBatisDaoUtils.getInsertQuery(className), object);

      if (primaryKey != null) {
        keyId = primaryKey.toString();
      }
      iBatisDaoUtils.setPrimaryKey(object, Long.class, new Long(keyId));
    } else {
      iBatisDaoUtils.prepareObjectForSaveOrUpdate(object);
      getSqlMapClientTemplate().update(iBatisDaoUtils.getUpdateQuery(className), object);
    }

    if (iBatisDaoUtils.getPrimaryKeyValue(object) == null) {
      throw new ObjectRetrievalFailureException(className, object);
    }
    return object;
  }

  public void remove(Class clazz, Serializable primaryKey)
  {
    getSqlMapClientTemplate().update(iBatisDaoUtils.getDeleteQuery(ClassUtils.getShortName(clazz)), primaryKey);
  }
}

