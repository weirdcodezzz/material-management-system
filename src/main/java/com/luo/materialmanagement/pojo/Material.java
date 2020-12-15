package com.luo.materialmanagement.pojo;

import com.luo.materialmanagement.annotation.IgnoreSwaggerParameter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.Length;



import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 * @author luo Fuqiang
 * @date 2020/12/2 11:44
 */
@ApiModel
public class Material implements Serializable {

    private Long id;
    @Length(min = 1, max = 60)
    private String code;
    @Length(min = 1, max = 60)
    private String uom;
    @Length(min = 1, max = 60)
    private String description;
    private Date startActiveDate;
    private Date endActiveDate;
    private Integer enabledFlag;
    private Long objectVersionNumber;
    @IgnoreSwaggerParameter
    private Timestamp creationDate;
    private Long createdBy;
    private Long lastUpdatedBy;
    @IgnoreSwaggerParameter
    private Timestamp lastUpdateDate;

    @Override
    public String toString() {
        return "Material{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", uom='" + uom + '\'' +
                ", description='" + description + '\'' +
                ", startActiveDate=" + startActiveDate +
                ", endActiveDate=" + endActiveDate +
                ", enabledFlag=" + enabledFlag +
                ", objectVersionNumber=" + objectVersionNumber +
                ", creationDate=" + creationDate +
                ", createdBy=" + createdBy +
                ", lastUpdatedBy=" + lastUpdatedBy +
                ", lastUpdateDate=" + lastUpdateDate +
                '}';
    }

    @ApiModelProperty(hidden = true)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ApiModelProperty(value = "物料编码，新增物料信息忽略此属性")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @ApiModelProperty(value = "物料单位")
    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    @ApiModelProperty(value = "物料描述")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @ApiModelProperty(value = "生效起始时间")
    public Date getStartActiveDate() {
        return startActiveDate;
    }

    public void setStartActiveDate(Date startActiveDate) {
        this.startActiveDate = startActiveDate;
    }

    @ApiModelProperty(value = "生效结束时间")
    public Date getEndActiveDate() {
        return endActiveDate;
    }

    public void setEndActiveDate(Date endActiveDate) {
        this.endActiveDate = endActiveDate;
    }

    @ApiModelProperty(value = "启用标志")
    public Integer getEnabledFlag() {
        return enabledFlag;
    }

    public void setEnabledFlag(Integer enabledFlag) {
        this.enabledFlag = enabledFlag;
    }

    @ApiModelProperty(hidden = true)
    public Long getObjectVersionNumber() {
        return objectVersionNumber;
    }

    public void setObjectVersionNumber(Long objectVersionNumber) {
        this.objectVersionNumber = objectVersionNumber;
    }

    @ApiModelProperty(hidden = true)
    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    @ApiModelProperty(hidden = true)
    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @ApiModelProperty(hidden = true)
    public Long getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(Long lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    @ApiModelProperty(hidden = true)
    public Timestamp getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Timestamp lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }
}
