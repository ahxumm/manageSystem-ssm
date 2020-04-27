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
public class SysLog {
    private Integer id;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date visitTime;
    private String visitTimeStr;
    private String username;
    private String ip;
    private String url;
    private Long executionTime;
    private String method;

    public void setVisitTimeStr(String visitTimeStr) {
        this.visitTimeStr = visitTimeStr;
    }

    public String getVisitTimeStr() {
        if(visitTime != null){
            visitTimeStr = DateUtils.date2String(visitTime, "yyyy-MM-dd HH:mm");
        }
        return visitTimeStr;
    }
}
