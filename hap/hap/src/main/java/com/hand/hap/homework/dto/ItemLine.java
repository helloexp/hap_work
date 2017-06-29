package com.hand.hap.homework.dto;


import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.mybatis.annotation.ExtensionAttribute;
import com.hand.hap.system.dto.BaseDTO;
@MultiLanguage
@Table(name="HSS_TASK_ITEM_LINE_B")
@ExtensionAttribute(disable=true)
public class ItemLine extends BaseDTO {
	
	private static final long serialVersionUID = 2776430709705510697L;
	@Id
	@GeneratedValue
	private Long itemLineId;//行表id
	/*
	 * 头表Id
	 */
	private Long  itemHeaderId;
	/*
	 * 字段描述
	 */
	private String  titleText;
	/*
	 * 字段类型
	 */
	private String  columnTypeCode;
	/*
	 * 列名
	 */
	private String columnName;
	/*
	 * 序号
	 */
	private Long seqNum;
	/*
	 * 值类型
	 */
	private String valueType;
	/*
	 * 字段长度
	 */
	private Long columnLen;
	/*
	 * 验证值集
	 */
	private String valueSet;
	/*
	 *验证格式
	 */
	private String columnFormat;
	/*
	 * 必输字段
	 */
	private String requiredFlag;
	/*
	 * 显示
	 */
	private String showFlag;
	/*
	 * 是否启用
	 */
	private String enableFlag;
	/*
	 * 是否唯一
	 */
	private String uniqueFlag;
	/*
	 * 显示宽度
	 */
	private Long displayWidth;
	
	
	public Long getItemLineId() {
		return itemLineId;
	}
	public void setItemLineId(Long itemLineId) {
		this.itemLineId = itemLineId;
	}

	public Long getItemHeaderId() {
		return itemHeaderId;
	}
	public void setItemHeaderId(Long itemHeaderId) {
		this.itemHeaderId = itemHeaderId;
	}
	public String getTitleText() {
		return titleText;
	}
	public void setTitleText(String titleText) {
		this.titleText = titleText;
	}
	public String getColumnTypeCode() {
		return columnTypeCode;
	}
	public void setColumnTypeCode(String columnTypeCode) {
		this.columnTypeCode = columnTypeCode;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public Long getSeqNum() {
		return seqNum;
	}
	public void setSeqNum(Long seqNum) {
		this.seqNum = seqNum;
	}
	public String getValueType() {
		return valueType;
	}
	public void setValueType(String valueType) {
		this.valueType = valueType;
	}
	public Long getColumnLen() {
		return columnLen;
	}
	public void setColumnLen(Long columnLen) {
		this.columnLen = columnLen;
	}

	public String getValueSet() {
		return valueSet;
	}
	public void setValueSet(String valueSet) {
		this.valueSet = valueSet;
	}
	public String getColumnFormat() {
		return columnFormat;
	}
	public void setColumnFormat(String columnFormat) {
		this.columnFormat = columnFormat;
	}
	public String getRequiredFlag() {
		return requiredFlag;
	}
	public void setRequiredFlag(String requiredFlag) {
		this.requiredFlag = requiredFlag;
	}
	public String getShowFlag() {
		return showFlag;
	}
	public void setShowFlag(String showFlag) {
		this.showFlag = showFlag;
	}
	public String getEnableFlag() {
		return enableFlag;
	}
	public void setEnableFlag(String enableFlag) {
		this.enableFlag = enableFlag;
	}
	public String getUniqueFlag() {
		return uniqueFlag;
	}
	public void setUniqueFlag(String uniqueFlag) {
		this.uniqueFlag = uniqueFlag;
	}
	public Long getDisplayWidth() {
		return displayWidth;
	}
	public void setDisplayWidth(Long displayWidth) {
		this.displayWidth = displayWidth;
	}
	
	
	
}
