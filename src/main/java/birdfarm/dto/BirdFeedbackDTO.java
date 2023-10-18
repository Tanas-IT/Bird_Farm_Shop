/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.util.Date;

public class BirdFeedbackDTO {
    private String userFullName;
    private String birdName;
    private String content;
    private Date createDate;
    
    public BirdFeedbackDTO() {
        
    }

    public BirdFeedbackDTO(String userFullName, String birdName, String content, Date createDate) {
        this.userFullName = userFullName;
        this.birdName = birdName;
        this.content = content;
        this.createDate = createDate;
    }

    /**
     * @return the userFullName
     */
    public String getUserFullName() {
        return userFullName;
    }

    /**
     * @param userFullName the userFullName to set
     */
    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    /**
     * @return the birdName
     */
    public String getBirdName() {
        return birdName;
    }

    /**
     * @param birdName the birdName to set
     */
    public void setBirdName(String birdName) {
        this.birdName = birdName;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    
}
