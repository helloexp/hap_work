package com.hand.hap.sale.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

@MultiLanguage
@Table(name="hap_inv_inventory_items_b")
public class Item extends BaseDTO{

	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 2561201950786926017L;

	 @Id
	 @Column
	 @GeneratedValue(generator = GENERATOR_TYPE)
	 private Long inventoryItemId;
	 
	 @Column
	 private String itemCode;
	 
	 @Column
	 private String itemUom;
	 
	 @Column
	 @MultiLanguageField
	 private String itemDescription;
	 
	 @Column
	 private String orderFlag;
	 
	 @Column
	 private String startActiveDate;
	 
	 @Column
	 private String endActiveDate;
	 
	 @Column
	 private String enabledFlag;

	public Long getInventoryItemId() {
		return inventoryItemId;
	}

	public void setInventoryItemId(Long inventoryItemId) {
		this.inventoryItemId = inventoryItemId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemUom() {
		return itemUom;
	}

	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getOrderFlag() {
		return orderFlag;
	}

	public void setOrderFlag(String orderFlag) {
		this.orderFlag = orderFlag;
	}

	public String getStartActiveDate() {
		return startActiveDate;
	}

	public void setStartActiveDate(String startActiveDate) {
		this.startActiveDate = startActiveDate;
	}

	public String getEndActiveDate() {
		return endActiveDate;
	}

	public void setEndActiveDate(String endActiveDate) {
		this.endActiveDate = endActiveDate;
	}

	public String getEnabledFlag() {
		return enabledFlag;
	}

	public void setEnabledFlag(String enabledFlag) {
		this.enabledFlag = enabledFlag;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	 
	 
}
