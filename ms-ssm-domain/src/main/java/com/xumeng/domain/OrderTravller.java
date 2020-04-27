package com.xumeng.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class OrderTravller {
    private Integer orderId;
    private Integer travellerId;
}
