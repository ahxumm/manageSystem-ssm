package com.xumeng.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

@Data
@ToString
@NoArgsConstructor
public class Traveller implements Serializable {
    private Integer id;
    private String name;
    private String sex;
    private String phoneNum;
    private Integer credentialsType;
    private String credentialsTypeStr;
    private String credentialsNum;
    private Integer travellerType;
    private String travellerTypeStr;

    public void setTravellerType(Integer travellerType){
        this.travellerType = travellerType;
    }
    public String getTravellerTypeStr(){
        if(travellerType != null){
            if(travellerType == 0){
                travellerTypeStr = "成人";
            }if(travellerType == 1){
                travellerTypeStr = "儿童";
            }
        }
        return travellerTypeStr;
    }

    public void setCredentialsType(Integer credentialsType){
        this.credentialsType = credentialsType;
    }

    public String getCredentialsTypeStr(){
        if(credentialsType != null){
            if(credentialsType == 0){
                credentialsTypeStr = "身份证";
            }
            if (credentialsType == 1){
                credentialsTypeStr = "护照";
            }
            if(credentialsType == 2){
                credentialsTypeStr = "军官证";
            }
        }
        return credentialsTypeStr;
    }
}
