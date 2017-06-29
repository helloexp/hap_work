package com.hand.hap.sale.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;


@MultiLanguage
@Table(name="hap_ar_customers_b")
public class Customer extends BaseDTO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9158921332873618917L;

	 @Id
	 @Column
	 @GeneratedValue(generator = GENERATOR_TYPE)
	 private Long customerId;
	 
	 @Column
	 private String customerNumber;
	 
	 @Column
	 @MultiLanguageField
	 private String CustomerName;
	 
	 @Column
	 private Long companyId;
	 
	 @Column
	 private String enabledFlag;

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(String customerNumber) {
		this.customerNumber = customerNumber;
	}

	public String getCustomerName() {
		return CustomerName;
	}

	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getEnabledFlag() {
		return enabledFlag;
	}

	public void setEnabledFlag(String enabledFlag) {
		this.enabledFlag = enabledFlag;
	}

	
	 
	
	
}
