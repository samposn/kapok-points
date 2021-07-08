package com.gdgxwl.base.common;

/**
 * @author Will WM. Zhang
 *
 */
public class Constant {

	public static final String YES_OR_NO = "YesOrNo";
	public static final String YES_OR_NO_Y = "Y";
	public static final String YES_OR_NO_N = "N";

	public static final String USER_STATUS = "UserStatus";
	public static final String USER_STATUS_ENABLED = "enabled";
	public static final String USER_STATUS_DISABLED = "disabled";

	public static final String Accident_Type = "AccidentType";//案件管理的 安全事故类型字典值

	public static final String Order_Status = "OrderStatus";//案件管理的 单据状态字典值

	public static final String Other_Equipment_Type = "OtherEquipmentType";//特种设备的 设备类型字典值

	public static final String Equipment_Status ="EquipmentStatus";//设备状态

	public static final String Equipment_Types ="EquipmentTypes";//设备类型

	public static final String SEND_TYPE = "SendType";//案件进度的送达方式字典值

	public static final String RISK_LEVEL = "SisRiskLevel";//风险等级

	public static final String ENTERPRISE_CLAIM = "EnterpriseClaim";//经济户口认领状态

	public static final String NOTICE_ACCEPTER_TYPE = "NoticeAccepterType";//通知接收者类型

	//这段SQL语句是查询所有用户的所有资源
	public static final String V_USERRESOURCE = ""
		+ " SELECT DISTINCT"
		+ "     ur.user_id           AS user_id,"
		+ "     rr.resource_id       AS resource_id,"
		+ "     r.resource_code      AS resource_code,"
		+ "     r.resource_name      AS resource_name,"
		+ "     r.resource_label     AS resource_label,"
		+ "     r.parent_resource_id AS parent_resource_id,"
		+ "     r.resource_type      AS resource_type,"
		+ "     r.url                AS url,"
		+ "     r.seq                AS seq,"
		+ "     r.image_path         AS image_path,"
		+ "     r.open_mode          AS open_mode,"
		+ "     r.fullpath           AS fullpath,"
		+ "     r.enable             AS enable,"
		+ "     r.is_branch          AS is_branch,"
		+ "     r.system_type        AS system_type,"
		+ "     r.resource_desc      AS resource_desc,"
		+ "     r.remark             AS remark"
		+ " FROM (SELECT"
		+ "           t2.user_id AS user_id,"
		+ "           t1.role_id AS role_id"
		+ "       FROM (SELECT"
		+ "                 org_id,"
		+ "                 role_id"
		+ "             FROM gxwl_sys_roleorg"
		+ "             WHERE if(isnull(is_inherited), 'N', is_inherited) = 'Y') t1"
		+ "           JOIN gxwl_sys_orguser t2"
		+ "       WHERE t1.org_id = t2.org_id"
		+ "       UNION SELECT"
		+ "                 t3.user_id AS user_id,"
		+ "                 t3.role_id AS role_id"
		+ "             FROM gxwl_sys_roleuser t3) ur"
		+ "     JOIN gxwl_sys_roleresource rr"
		+ "     JOIN gxwl_sys_resource r"
		+ " WHERE"
		+ "     ur.role_id = rr.role_id"
		+ "     AND rr.resource_id = r.resource_id"
		+ "     AND if(isnull(r.enable), 'N', r.enable) = 'Y'";

}
