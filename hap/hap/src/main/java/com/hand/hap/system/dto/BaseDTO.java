/*
 * #{copyright}#
 */
package com.hand.hap.system.dto;

import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.lang3.builder.StandardToStringStyle;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.commons.lang3.time.DateFormatUtils;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.hand.hap.core.BaseConstants;
import com.hand.hap.core.util.TimeZoneUtil;
import com.hand.hap.extensible.dto.IBaseDto;
import com.hand.hap.mybatis.annotation.Condition;

/**
 * 带有标准字段的 DTO 基类.
 *
 * @author shengyang.zhou@hand-china.com
 */
public class BaseDTO implements Serializable, BaseConstants, IBaseDto {

    @Transient
    @XmlTransient
    @JsonIgnore
    protected Map<String, Object> innerMap = new HashMap<>();

    @Transient
    @JsonIgnore
    @SuppressWarnings("unchecked")
    protected <T> T innerGet(String key) {
        return (T) innerMap.get(key);
    }

    protected void innerSet(String key, Object value) {
        innerMap.put(key, value);
    }

    /**
     * 数据标识字段.
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    private String __id;

    /**
     * 数据状态字段. add,update,delete
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    @XmlTransient
    private String __status;

    /**
     * 存放所有多语言字段的描述信息.
     * <p>
     * data example:
     *
     * <pre>
     * __tls:{
     *      roleName : {
     *          zh_CN : '管理员',
     *          en_GB : 'Admin'
     *      },
     *      description : {
     *          zh_CN : '管理员',
     *          en_GB : 'administrator'
     *      }
     *   }
     * </pre>
     */
    @Transient
    private Map<String, Map<String, String>> __tls = Collections.emptyMap();

    /**
     * 排序字段.
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    private String sortname;

    /**
     * 排序方式.
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    private String sortorder;

    /**
     * 防篡改校验字段(非数据库字段).
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Transient
    private String _token;

    /**
     * 对Record最后一次操作的系统内部请求id.
     */
    @JsonIgnore
    @Column
    @Condition(exclude = true)
    private Long requestId = -1L;

    /**
     * 对Record最后一次操作的系统内部程序id.
     */
    @JsonIgnore
    @Column
    @Condition(exclude = true)
    private Long programId = -1L;

    /**
     * Record的版本号，每发生update则自增.
     * <p>
     * 用于实现乐观锁,无法替代数据库锁.
     * <p>
     * 不能通过 update xx set object_version_number = 3 where xxx 来更新.<br>
     * 只能是自动的 update xx set a=1, object_version_number = object_version_number +
     * 1 where xxx
     */
    @Column(updatable = false)
    @Condition(exclude = true)
    private Long objectVersionNumber;

    //// 下面是标准 WHO 字段////

    @JsonIgnore
    @Column(updatable = false)
    @Condition(exclude = true)
    private Long createdBy;

    @JsonIgnore
    @Column(updatable = false)
    @Condition(exclude = true)
    private Date creationDate;

    @JsonIgnore
    @Column
    @Condition(exclude = true)
    private Long lastUpdatedBy;

    @JsonIgnore
    @Column
    @Condition(exclude = true)
    private Date lastUpdateDate;

    @JsonIgnore
    @Column
    @Condition(exclude = true)
    private Long lastUpdateLogin;

    //// 下面是扩展属性字段////

    /**
     * 扩展属性分类.
     */
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attributeCategory;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute1;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute2;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute3;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute4;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute5;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute6;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute7;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute8;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute9;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute10;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute11;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute12;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute13;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute14;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Column
    private String attribute15;

    public String get__id() {
        return __id;
    }

    public void set__id(String __id) {
        this.__id = __id;
    }

    public String get__status() {
        return __status;
    }

    public void set__status(String __status) {
        this.__status = __status;
    }

    @JsonIgnore
    @XmlTransient
    public Map<String, Map<String, String>> get__tls() {
        return __tls;
    }

    @JsonProperty
    public void set__tls(Map<String, Map<String, String>> __tls) {
        if (__tls != null) {
            this.__tls = __tls;
        }
    }

    public String getSortname() {
        return sortname;
    }

    public void setSortname(String sortname) {
        this.sortname = sortname;
    }

    public String getSortorder() {
        return sortorder;
    }

    public void setSortorder(String sortorder) {
        this.sortorder = sortorder;
    }

    public String get_token() {
        return _token;
    }

    public void set_token(String _token) {
        this._token = _token;
    }

    public Long getRequestId() {
        return requestId;
    }

    public void setRequestId(Long requestId) {
        this.requestId = requestId;
    }

    public Long getProgramId() {
        return programId;
    }

    public void setProgramId(Long programId) {
        this.programId = programId;
    }

    public Long getObjectVersionNumber() {
        return objectVersionNumber;
    }

    public void setObjectVersionNumber(Long objectVersionNumber) {
        this.objectVersionNumber = objectVersionNumber;
    }

    public Long getLastUpdateLogin() {
        return lastUpdateLogin;
    }

    public void setLastUpdateLogin(Long lastUpdateLogin) {
        this.lastUpdateLogin = lastUpdateLogin;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(Long lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getAttributeCategory() {
        return attributeCategory;
    }

    public void setAttributeCategory(String attributeCategory) {
        this.attributeCategory = attributeCategory;
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    public String getAttribute3() {
        return attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    public String getAttribute4() {
        return attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    public String getAttribute5() {
        return attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
    }

    public String getAttribute6() {
        return attribute6;
    }

    public void setAttribute6(String attribute6) {
        this.attribute6 = attribute6;
    }

    public String getAttribute7() {
        return attribute7;
    }

    public void setAttribute7(String attribute7) {
        this.attribute7 = attribute7;
    }

    public String getAttribute8() {
        return attribute8;
    }

    public void setAttribute8(String attribute8) {
        this.attribute8 = attribute8;
    }

    public String getAttribute9() {
        return attribute9;
    }

    public void setAttribute9(String attribute9) {
        this.attribute9 = attribute9;
    }

    public String getAttribute10() {
        return attribute10;
    }

    public void setAttribute10(String attribute10) {
        this.attribute10 = attribute10;
    }

    public String getAttribute11() {
        return attribute11;
    }

    public void setAttribute11(String attribute11) {
        this.attribute11 = attribute11;
    }

    public String getAttribute12() {
        return attribute12;
    }

    public void setAttribute12(String attribute12) {
        this.attribute12 = attribute12;
    }

    public String getAttribute13() {
        return attribute13;
    }

    public void setAttribute13(String attribute13) {
        this.attribute13 = attribute13;
    }

    public String getAttribute14() {
        return attribute14;
    }

    public void setAttribute14(String attribute14) {
        this.attribute14 = attribute14;
    }

    public String getAttribute15() {
        return attribute15;
    }

    public void setAttribute15(String attribute15) {
        this.attribute15 = attribute15;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, TO_STRING_STYLE);
    }

    private static final ToStringStyle TO_STRING_STYLE = new StandardToStringStyle() {
        @Override
        public void append(StringBuffer buffer, String fieldName, Object value, Boolean fullDetail) {
            if (value == null) {
                return;
            }
            if (fieldName.startsWith("_")) {
                return;
            }
            if (value instanceof Date) {
                value = DateFormatUtils.format((Date) value, BaseConstants.DATE_TIME_FORMAT,
                        TimeZoneUtil.getTimeZone());
            }
            super.append(buffer, fieldName, value, fullDetail);
        }
    };

    @JsonAnyGetter
    public Object getAttribute(String key) {
        return innerMap.get(key);
    }

    @JsonAnySetter
    public void setAttribute(String key, Object obj) {
        //TODO auto convert data type
        innerMap.put(key, obj);
    }
}
