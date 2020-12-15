package com.luo.materialmanagement.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.models.auth.In;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

/**
 * @author luo Fuqiang
 * @date 2020/12/5 11:28
 */
@ApiModel
public class MaterialVO {
    private String code;
    private String uom;
    private String description;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startActiveDate;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endActiveDate;
    private Integer enabledFlag;

    @Override
    public String toString() {
        return "MaterialVO{" +
                "code='" + code + '\'' +
                ", uom='" + uom + '\'' +
                ", description='" + description + '\'' +
                ", startActiveDate=" + startActiveDate +
                ", endActiveDate=" + endActiveDate +
                ", enabledFlag=" + enabledFlag +
                '}';
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartActiveDate() {
        return startActiveDate;
    }

    public void setStartActiveDate(Date startActiveDate) {
        this.startActiveDate = startActiveDate;
    }

    public Date getEndActiveDate() {
        return endActiveDate;
    }

    public void setEndActiveDate(Date endActiveDate) {
        this.endActiveDate = endActiveDate;
    }

    public Integer getEnabledFlag() {
        return enabledFlag;
    }

    public void setEnabledFlag(Integer enabledFlag) {
        this.enabledFlag = enabledFlag;
    }
}
