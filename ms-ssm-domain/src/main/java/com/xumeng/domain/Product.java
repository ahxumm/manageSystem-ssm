package com.xumeng.domain;

import com.xumeng.utils.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@ToString
@NoArgsConstructor
public class Product {
    private Integer id; // 主键
    private String productNum; // 编号 唯一
    private String productName; // 名称
    private String cityName; // 出发城市
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date departureTime; // 出发时间
    private String departureTimeStr;
    private double productPrice; // 产品价格
    private String productDesc; // 产品描述
    private Integer productStatus; // 状态 0 关闭 1 开启
    private String productStatusStr;

    public void setDepartureTimeStr(String departureTimeStr) {
        this.departureTimeStr = departureTimeStr;
    }

    public String getDepartureTimeStr() {
        if(departureTime != null){
            departureTimeStr = DateUtils.date2String(departureTime, "yyyy-MM-dd HH:mm");
        }
        return departureTimeStr;
    }

    public void setProductStatusStr(String productStatusStr) {
        this.productStatusStr = productStatusStr;
    }

    public String getProductStatusStr() {
        if(productStatus != null){
            if(productStatus == 0)
                productStatusStr = "关闭";
            if(productStatus == 1)
                productStatusStr = "开启";
        }
        return productStatusStr;
    }
}
