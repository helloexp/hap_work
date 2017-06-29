package com.hand.hap.sale.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

@MultiLanguage
@Table(name="hap_org_companys_b")
public class Companys extends BaseDTO{

	 /**
	 * 
	 */
	private static final long serialVersionUID = -8945469403404325563L;
    @Id
    @Column
    @GeneratedValue(generator = GENERATOR_TYPE)
	private Long companyId;
	
	@Column
	private String companyNumber;
	
	@Column
	@MultiLanguageField
	private String companyName;
	
	@Column
	private String enabled;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyNumber() {
		return companyNumber;
	}

	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
