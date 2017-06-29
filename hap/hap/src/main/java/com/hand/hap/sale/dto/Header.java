package com.hand.hap.sale.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

@MultiLanguage
@Table(name="hap_om_order_headers_b")
public class Header extends BaseDTO{
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 4653899923334318384L;


	 @Id
	 @Column
	 @GeneratedValue(generator = GENERATOR_TYPE)
	 private String headerId;
     
	 
	 @Column
	 private String orderNumber;
	 
	 @Column
	 private String companyId;
	 
	 @Column
	 private String orderDate;
	 
	 @Column 
	 @MultiLanguageField
	 private String orderStatus;
	 
	 @Column 
	 private String customerId;

		/**
		 * 公司名
		 */
		@NotEmpty
		private String companyName; 
	
		/**
		 * 客户名
		 */
		@NotEmpty
		private String  customerName;
		/**
		 * 金额
		 */
		@NotEmpty
		private String orderSal;
		
		@MultiLanguageField
		 private String itemDescription;
		
		/*	LINE_ID,LINE_NUMBER,INVENTORY_ITEM_ID,
		ORDERD_QUANTITY,ORDER_QUANTITY_UOM,UNIT_SELLING_PRICE,DESCRIPTION*/
		/**
		 * 订单行ID
		 */
		@NotEmpty
		private String lineId;
		
		/**
		 * 行号
		 */
		@NotEmpty
		private String lineNumber;
		/**
		 * 产品ID
		 */
		@NotEmpty
		private String inventoryItemId;
		
		/**
		 *数量
		 */
		private String orderQuantity;
		/**
		 * 产品单位
		 */
		@NotEmpty
		private String orderQuantityUom;
		/**
		 * 销售单价
		 */
		@NotEmpty
		private String  unitSellingPrice;
		
		/**
		 * 备注
		 */
		@NotEmpty
		private String description;

		public String getHeaderId() {
			return headerId;
		}

		public void setHeaderId(String headerId) {
			this.headerId = headerId;
		}

		public String getOrderNumber() {
			return orderNumber;
		}

		public void setOrderNumber(String orderNumber) {
			this.orderNumber = orderNumber;
		}

		public String getCompanyId() {
			return companyId;
		}

		public void setCompanyId(String companyId) {
			this.companyId = companyId;
		}

		public String getOrderDate() {
			return orderDate;
		}

		public void setOrderDate(String orderDate) {
			this.orderDate = orderDate;
		}

		public String getOrderStatus() {
			return orderStatus;
		}

		public void setOrderStatus(String orderStatus) {
			this.orderStatus = orderStatus;
		}

		public String getCustomerId() {
			return customerId;
		}

		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}

		public String getCompanyName() {
			return companyName;
		}

		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}

		public String getCustomerName() {
			return customerName;
		}

		public void setCustomerName(String customerName) {
			this.customerName = customerName;
		}

		public String getOrderSal() {
			return orderSal;
		}

		public void setOrderSal(String orderSal) {
			this.orderSal = orderSal;
		}

		public String getItemDescription() {
			return itemDescription;
		}

		public void setItemDescription(String itemDescription) {
			this.itemDescription = itemDescription;
		}

		public String getLineId() {
			return lineId;
		}

		public void setLineId(String lineId) {
			this.lineId = lineId;
		}

		public String getLineNumber() {
			return lineNumber;
		}

		public void setLineNumber(String lineNumber) {
			this.lineNumber = lineNumber;
		}

		public String getInventoryItemId() {
			return inventoryItemId;
		}

		public void setInventoryItemId(String inventoryItemId) {
			this.inventoryItemId = inventoryItemId;
		}

		public String getOrderQuantity() {
			return orderQuantity;
		}

		public void setOrderQuantity(String orderQuantity) {
			this.orderQuantity = orderQuantity;
		}

		public String getOrderQuantityUom() {
			return orderQuantityUom;
		}

		public void setOrderQuantityUom(String orderQuantityUom) {
			this.orderQuantityUom = orderQuantityUom;
		}

		public String getUnitSellingPrice() {
			return unitSellingPrice;
		}

		public void setUnitSellingPrice(String unitSellingPrice) {
			this.unitSellingPrice = unitSellingPrice;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		@Override
		public String toString() {
			return "Header [headerId=" + headerId + ", orderNumber=" + orderNumber + ", companyId=" + companyId
					+ ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", customerId=" + customerId
					+ ", companyName=" + companyName + ", customerName=" + customerName + ", orderSal=" + orderSal
					+ ", itemDescription=" + itemDescription + ", lineId=" + lineId + ", lineNumber=" + lineNumber
					+ ", inventoryItemId=" + inventoryItemId + ", orderQuantity=" + orderQuantity
					+ ", orderQuantityUom=" + orderQuantityUom + ", unitSellingPrice=" + unitSellingPrice
					+ ", description=" + description + "]";
		}
	 	 
	
	 
     
}
