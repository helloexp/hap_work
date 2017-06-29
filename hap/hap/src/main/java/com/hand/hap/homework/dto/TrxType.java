package com.hand.hap.homework.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.system.dto.BaseDTO;
@Table(name="hss_setup_trx_type_b")
@MultiLanguage
public class TrxType extends BaseDTO {
	private static final long serialVersionUID = 9068915837021938252L;

	/**
	 * 序列号
	 */
	@Id
	@GeneratedValue
	private Long trxTypeId;
	/**
	 * 事务类型标识
	 */
	@Column
	private String trxType;
	/**
	 * 事务类型名称
	 */
	@Column
	
	private String trxTypeName;
	/**
	 * 版本
	 */
	@Column
	private Long versionNumber;
	/**
	 * 升版事务类型ID
	 */
	@Column
	private Long oriTrxTypeId;
	/**
	 * 状态
	 */
	@Column
	private String statusCode;
	/**
	 * 有效日期从
	 */
	@Column
	private String startDate;
	/**
	 * 有效日期至
	 */
	@Column
	private String endDate;
	/**
	 * 启用层级数
	 */
	@Column
	private Long levelNo;
	/**
	 * 启用层级数
	 */
	@Column
	private String programUpdateDate;

	public String getProgramUpdateDate() {
		return programUpdateDate;
	}

	public void setProgramUpdateDate(String programUpdateDate) {
		this.programUpdateDate = programUpdateDate;
	}

	public Long getTrxTypeId() {
		return trxTypeId;
	}

	public void setTrxTypeId(Long trxTypeId) {
		this.trxTypeId = trxTypeId;
	}

	public String getTrxType() {
		return trxType;
	}

	public void setTrxType(String trxType) {
		this.trxType = trxType;
	}

	public String getTrxTypeName() {
		return trxTypeName;
	}

	public void setTrxTypeName(String trxTypeName) {
		this.trxTypeName = trxTypeName;
	}

	public Long getVersionNumber() {
		return versionNumber;
	}

	public void setVersionNumber(Long versionNumber) {
		this.versionNumber = versionNumber;
	}

	public Long getOriTrxTypeId() {
		return oriTrxTypeId;
	}

	public void setOriTrxTypeId(Long oriTrxTypeId) {
		this.oriTrxTypeId = oriTrxTypeId;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Long getLevelNo() {
		return levelNo;
	}

	public void setLevelNo(Long levelNo) {
		this.levelNo = levelNo;
	}

}
