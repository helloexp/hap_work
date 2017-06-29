package com.hand.hap.homework.dto;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.mybatis.annotation.ExtensionAttribute;
import com.hand.hap.system.dto.BaseDTO;
@MultiLanguage
@Table(name="HSS_TASK_ITEM_HEADER_B")
@ExtensionAttribute(disable=true)
public class ItemHeader extends BaseDTO {
	
	private static final long serialVersionUID = 2776430709705510697L;
	@Id
	@GeneratedValue
	private Long itemHeaderId;//头表id
	/*
	 * 映射名称
	 */
	private String  interfaceName;
	/*
	 * 映射说明
	 */
	private String  description;
	/*
	 * 系统代码
	 */
	private String  sourceSystemCode;	
	/*
	 * 系统名称
	 */
	private String systemName;
	/*
	 * 数据类型
	 */
	private String dataTypeCode;
	/*
	 * 创建人
	 */
	private String createdName;
	/*
	 * 创建日期
	 */
	private Date creationDate;
	/*
	 * 有效日期从
	 */
	private Date startDate;
	/*
	 * 有效日期至
	 */
	private Date endDate;
	/*
	 * 校验类名
	 */
	private String validateClass;
	/*
	 * 打印单据URL
	 */
	private String printUrl;
	/*
	 * 父映射
	 */
	private String parentItemHeaderName;
	/*
	 * 启用状态
	 */
	private String enabledFlag;
	/*
	 * 是否冻结
	 */
	private String  frozenFlag;
	
	public Long getItemHeaderId() {
		return itemHeaderId;
	}
	public void setItemHeaderId(Long itemHeaderId) {
		this.itemHeaderId = itemHeaderId;
	}
	public String getInterfaceName() {
		return interfaceName;
	}
	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSourceSystemCode() {
		return sourceSystemCode;
	}
	public void setSourceSystemCode(String sourceSystemCode) {
		this.sourceSystemCode = sourceSystemCode;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public String getDataTypeCode() {
		return dataTypeCode;
	}
	public void setDataTypeCode(String dataTypeCode) {
		this.dataTypeCode = dataTypeCode;
	}
	public String getCreatedName() {
		return createdName;
	}
	public void setCreatedName(String createdName) {
		this.createdName = createdName;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getValidateClass() {
		return validateClass;
	}
	public void setValidateClass(String validateClass) {
		this.validateClass = validateClass;
	}
	public String getPrintUrl() {
		return printUrl;
	}
	public void setPrintUrl(String printUrl) {
		this.printUrl = printUrl;
	}
	public String getParentItemHeaderName() {
		return parentItemHeaderName;
	}
	public void setParentItemHeaderName(String parentItemHeaderName) {
		this.parentItemHeaderName = parentItemHeaderName;
	}
	public String getEnabledFlag() {
		return enabledFlag;
	}
	public void setEnabledFlag(String enabledFlag) {
		this.enabledFlag = enabledFlag;
	}
	
	public String getFrozenFlag() {
		return frozenFlag;
	}
	public void setFrozenFlag(String frozenFlag) {
		this.frozenFlag = frozenFlag;
	}
	

	
}
