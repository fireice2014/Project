 package com.snwd.dao.ibatis;
 
 import java.lang.reflect.Field;
 import java.lang.reflect.Method;
 import java.text.MessageFormat;
 import org.apache.commons.logging.Log;
 import org.apache.commons.logging.LogFactory;
 import org.springframework.util.ClassUtils;
 
 public final class iBatisDaoUtils
 {
   protected static final Log log = LogFactory.getLog(iBatisDaoUtils.class);
 
   protected static String getPrimaryKeyFieldName(Object o)
   {
     Field[] fieldlist = o.getClass().getDeclaredFields();
     String fieldName = null;
     for (Field fld : fieldlist) {
       if ((fld.getName().equals("id")) || (fld.getName().indexOf("Id") > -1) || (fld.getName().equals("version"))) {
         fieldName = fld.getName();
         break;
       }
     }
     return fieldName;
   }
 
   protected static Class getPrimaryKeyFieldType(Object o)
   {
     Field[] fieldlist = o.getClass().getDeclaredFields();
     Class fieldType = null;
     for (Field fld : fieldlist) {
       if ((fld.getName().equals("id")) || (fld.getName().indexOf("Id") > -1) || (fld.getName().equals("version"))) {
         fieldType = fld.getType();
         break;
       }
     }
     return fieldType;
   }
 
   protected static Object getPrimaryKeyValue(Object o)
   {
     String fieldName = getPrimaryKeyFieldName(o);
     String getterMethod = "get" + Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
     try
     {
       Method getMethod = o.getClass().getMethod(getterMethod, (Class[])null);
       return getMethod.invoke(o, (Object[])null);
     } catch (Exception e) {
       e.printStackTrace();
       log.error("Could not invoke method '" + getterMethod + "' on " + ClassUtils.getShortName(o.getClass()));
     }
     return null;
   }
 
   protected static void prepareObjectForSaveOrUpdate(Object o)
   {
     try
     {
       Field[] fieldlist = o.getClass().getDeclaredFields();
       for (Field fld : fieldlist) {
         String fieldName = fld.getName();
         if (fieldName.equals("version")) {
           Method setMethod = o.getClass().getMethod("setVersion", new Class[] { Integer.class });
           Object value = o.getClass().getMethod("getVersion", (Class[])null).invoke(o, (Object[])null);
           if (value == null)
             setMethod.invoke(o, new Object[] { Integer.valueOf(1) });
           else
             setMethod.invoke(o, new Object[] { Integer.valueOf(((Integer)value).intValue() + 1) });
         }
       }
     }
     catch (Exception e) {
       e.printStackTrace();
       log.error("Could not prepare '" + ClassUtils.getShortName(o.getClass()) + "' for insert/update");
     }
   }
 
   protected static void setPrimaryKey(Object o, Class clazz, Object value)
   {
     String fieldName = getPrimaryKeyFieldName(o);
     String setMethodName = "set" + Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
     try
     {
       Method setMethod = o.getClass().getMethod(setMethodName, new Class[] { clazz });
       if (value != null)
         setMethod.invoke(o, new Object[] { value });
     }
     catch (Exception e) {
       e.printStackTrace();
       log.error(MessageFormat.format("Could not set ''{0}.{1} with value {2}", new Object[] { ClassUtils.getShortName(o.getClass()), fieldName, value }));
     }
   }
 
   public static String getSelectQuery(String className)
   {
     return "get" + className + "s";
   }
 
   public static String getFindQuery(String className)
   {
     return "get" + className;
   }
 
   public static String getInsertQuery(String className)
   {
     return "add" + className;
   }
 
   public static String getUpdateQuery(String className)
   {
     return "update" + className;
   }
 
   public static String getDeleteQuery(String className)
   {
     return "delete" + className;
   }
 }
