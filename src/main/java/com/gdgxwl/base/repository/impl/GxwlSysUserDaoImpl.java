package com.gdgxwl.base.repository.impl;

import com.gdgxwl.base.repository.GxwlSysUserDaoPlus;
import com.gdgxwl.core.repository.impl.BaseDaoImpl;

import java.util.List;
import java.util.Map;

import static com.gdgxwl.base.common.Constant.V_USERRESOURCE;

/**
 * @author Will WM. Zhang
 * 
 */
public class GxwlSysUserDaoImpl extends BaseDaoImpl implements
		GxwlSysUserDaoPlus {

	@Override
	public List<Map<String, Object>> getUserPermissionList(Integer userId) {
		String sqlString = " SELECT"
			+ " v.RESOURCE_CODE as resourceCode"
			+ " FROM"
			+ " (" + V_USERRESOURCE + ") v"
			+ " WHERE"
			+ " v.USER_ID = " + userId;

		return selectBySql(sqlString);
	}
	
}
