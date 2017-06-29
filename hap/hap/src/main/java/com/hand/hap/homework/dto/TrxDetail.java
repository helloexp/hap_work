package com.hand.hap.homework.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.mybatis.annotation.ExtensionAttribute;
import com.hand.hap.system.dto.BaseDTO;

@Table(name="hss_setup_trx_detail_b")
@ExtensionAttribute(disable=true)
public class TrxDetail extends BaseDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7728258529756229330L;
	@Id
	@GeneratedValue
	private Long trxDetailId;
	@Column
	private Long trxId;
	@Column
	private String detailTrxType;
	@Column
	private String detailTrxTypeName;
	@Column
	private String categoryCode;
	@Column
	private Long parentDetailId;
	@Column
	private String isDisplayFlag; 
	@Column
	private Long sscId;
	@Column
	private Long objectVersionNumber;
	
	public Long getTrxDetailId() {
		return trxDetailId;
	}
	public void setTrxDetailId(Long trxDetailId) {
		this.trxDetailId = trxDetailId;
	}
	public Long getTrxId() {
		return trxId;
	}
	public void setTrxId(Long trxId) {
		this.trxId = trxId;
	}
	public String getDetailTrxType() {
		return detailTrxType;
	}
	public void setDetailTrxType(String detailTrxType) {
		this.detailTrxType = detailTrxType;
	}
	public String getDetailTrxTypeName() {
		return detailTrxTypeName;
	}
	public void setDetailTrxTypeName(String detailTrxTypeName) {
		this.detailTrxTypeName = detailTrxTypeName;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public Long getParentDetailId() {
		return parentDetailId;
	}
	public void setParentDetailId(Long parentDetailId) {
		this.parentDetailId = parentDetailId;
	}
	public String getIsDisplayFlag() {
		return isDisplayFlag;
	}
	public void setIsDisplayFlag(String isDisplayFlag) {
		this.isDisplayFlag = isDisplayFlag;
	}
	public Long getSscId() {
		return sscId;
	}
	public void setSscId(Long sscId) {
		this.sscId = sscId;
	}
	public Long getObjectVersionNumber() {
		return objectVersionNumber;
	}
	public void setObjectVersionNumber(Long objectVersionNumber) {
		this.objectVersionNumber = objectVersionNumber;
	}
	

}
