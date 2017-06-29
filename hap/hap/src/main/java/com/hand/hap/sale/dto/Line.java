package com.hand.hap.sale.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

@MultiLanguage
@Table(name="hap_om_order_lines_b")
public class Line extends BaseDTO{
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 3720464461862756327L;

     @Id
	 @Column
	 @GeneratedValue(generator = GENERATOR_TYPE)
	 private long lineId;
	 
	 @Column 
	 private long headerId;
	 
	 @Column
	 private long lineNumber;
	 
	 @Column 
	 private long inventoryItemId;
	 
	 @Column
	 private long orderdQuantity;
	 
	 @Column
	 @MultiLanguageField
	 private String orderQuantityUom;
	 
	 @Column
	 private long unitSellingPrice;
	 
	 @Column 
	 @MultiLanguageField
	 private String description;
	 
	 @Column
	 private long companyId;
	 
	 private String itemCode;
	 
	 @Column
	 private long lastUpdateLogin;
		
	 private String itemUom;
	 
	 
	
	 private String itemDescription;
	 
	 private long lineSal;
	 
	 
	 
	 public Long getLastUpdateLogin() {
		return lastUpdateLogin;
	}

	public void setLastUpdateLogin(long lastUpdateLogin) {
		this.lastUpdateLogin = lastUpdateLogin;
	}

	public long getLineSal() {
		return lineSal;
	}

	public void setLineSal(long lineSal) {
		this.lineSal = lineSal;
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

	public long getLineId() {
		return lineId;
	}

	public void setLineId(long lineId) {
		this.lineId = lineId;
	}

	public long getHeaderId() {
		return headerId;
	}

	public void setHeaderId(long headerId) {
		this.headerId = headerId;
	}

	public long getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(long lineNumber) {
		this.lineNumber = lineNumber;
	}

	public long getInventoryItemId() {
		return inventoryItemId;
	}

	public void setInventoryItemId(long inventoryItemId) {
		this.inventoryItemId = inventoryItemId;
	}

	public long getOrderdQuantity() {
		return orderdQuantity;
	}

	public void setOrderdQuantity(long orderdQuantity) {
		this.orderdQuantity = orderdQuantity;
	}

	public String getOrderQuantityUom() {
		return orderQuantityUom;
	}

	public void setOrderQuantityUom(String orderQuantityUom) {
		this.orderQuantityUom = orderQuantityUom;
	}

	public long getUnitSellingPrice() {
		return unitSellingPrice;
	}

	public void setUnitSellingPrice(long unitSellingPrice) {
		this.unitSellingPrice = unitSellingPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}
	 
	 
	 
	 
	 
	 
	 
	 
	 

}
