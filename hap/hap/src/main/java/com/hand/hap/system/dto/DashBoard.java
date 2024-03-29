package com.hand.hap.system.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.hand.hap.core.annotation.MultiLanguage;
import com.hand.hap.core.annotation.MultiLanguageField;
import com.hand.hap.mybatis.annotation.ExtensionAttribute;
import com.hand.hap.system.dto.BaseDTO;

/**
 * DashBoard配置的DTO.
 *
 * @author zhizheng.yang@hand-china.com
 */

@MultiLanguage
@Table(name = "sys_dashboard_b")
@ExtensionAttribute(disable = true)
public class DashBoard extends BaseDTO {

    private static final long serialVersionUID = 1L;

    /**
     * 表ID，主键，供其他表做外键.
     */
    @Id
    @Column
    @GeneratedValue(generator = GENERATOR_TYPE)
    private Long dashboardId;

    /**
     * 配置编码.
     */
    @Column
    private String dashboardCode;

    /**
     * 描述.
     */
    @Column
    @MultiLanguageField
    private String description;

    /**
     * 标题.
     */
    @Column
    @MultiLanguageField
    private String title;

    /**
     * 资源ID.
     */
    @Column
    private Long resourceId;

    @Transient
    private String resourceName;
    
    @Transient
    private String url;

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public Long getDashboardId() {
        return dashboardId;
    }

    public void setDashboardId(Long dashboardId) {
        this.dashboardId = dashboardId;
    }

    public String getDashboardCode() {
        return dashboardCode;
    }

    public void setDashboardCode(String dashboardCode) {
        this.dashboardCode = dashboardCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getResourceId() {
        return resourceId;
    }

    public void setResourceId(Long resourceId) {
        this.resourceId = resourceId;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
    
}
