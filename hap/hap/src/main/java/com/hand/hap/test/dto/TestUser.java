package com.hand.hap.test.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.system.dto.BaseDTO;

/**
 * 岗位表
 *
 * @author hailin.xu@hand-china.com 
 */


@MultiLanguage
@Table(name = "test_user_b")
public class TestUser extends BaseDTO  {
     
	
	 @Id
	 @Column
	 @GeneratedValue(generator = GENERATOR_TYPE)
	 private long userId;
     
	 
	 @MultiLanguageField
     private String name;
     
	 
	 @Column
     private String email;
     
	 
	 @Column
     private String phonenumber;
     
	 
	 @Column
     private Date birthday;


	public long getUserId() {
		return userId;
	}


	public void setUserId(long userId) {
		this.userId = userId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	 
	 
	 
	
	
}
