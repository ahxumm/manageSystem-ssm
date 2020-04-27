package com.xumeng.domain;

import com.xumeng.utils.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@ToString
@Data
@NoArgsConstructor
public class Orders implements Serializable {
    private Integer id;
    private String orderNum;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date orderTime;
    private String orderTimeStr;
    private Integer orderStatus;
    private String orderStatusStr;
    private int peopleCount;
    private Integer payType;
    private String payTypeStr;
    private String orderDesc;
    private Integer memberId;
    private Integer productId;

    private Member member;
    private Product product;
    private List<Traveller> travellers;

    public String getOrderTimeStr() {
        if(orderTime != null){
            orderTimeStr = DateUtils.date2String(orderTime, "yyyy-MM-dd HH:mm");
        }
        return orderTimeStr;
    }

    public void setOrderTimeStr(String orderTimeStr) {
        this.orderTimeStr = orderTimeStr;
    }

    public void setOrderStatusStr(String orderStatusStr){
        this.orderStatusStr = orderStatusStr;
    }
    public String getOrderStatusStr(){
        if(orderStatus != null){
            if(orderStatus == 0){
                orderStatusStr = "未支付";
            }if(orderStatus == 1){
                orderStatusStr = "已支付";
            }
        }
        return orderStatusStr;
    }

    public void setPayTypeStr(String payTypeStr){
        this.payTypeStr = payTypeStr;
    }
    public String getPayTypeStr(){
        if(payType != null){
            if(payType == 0){
                payTypeStr = "支付宝";
            }
            if (payType == 1){
                payTypeStr = "微信";
            }
            if(payType == 2){
                payTypeStr = "其他";
            }
        }
        return payTypeStr;
    }
}
