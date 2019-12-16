package com.hand.wzl25722.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

public class Items {
    private Long itemId;
    private String itemCode;
    private String itemUom;
    private String iteDescription;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date startActiveDate;//生效起始时间


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date endActiveDate;

    private boolean enabledFlag;
    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
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

    public String getIteDescription() {
        return iteDescription;
    }

    public void setIteDescription(String iteDescription) {
        this.iteDescription = iteDescription;
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

    public boolean isEnabledFlag() {
        return enabledFlag;
    }

    public void setEnabledFlag(boolean enabledFlag) {
        this.enabledFlag = enabledFlag;
    }


    public Items() {
        super();
    }

    public Items(Long itemId, String itemCode, String itemUom, String iteDescription, Date startActiveDate, Date endActiveDate, boolean enabledFlag, Long objectaVersionNumber, Timestamp creationDate, Long createdBy, Long lastUpdatedBy, Timestamp lastUpdateDate) {
        this.itemId = itemId;
        this.itemCode = itemCode;
        this.itemUom = itemUom;
        this.iteDescription = iteDescription;
        this.startActiveDate = startActiveDate;
        this.endActiveDate = endActiveDate;
        this.enabledFlag = enabledFlag;

    }
}
