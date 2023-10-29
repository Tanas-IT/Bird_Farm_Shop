/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;

/**
 *
 * @author HP
 */
public class HistoryDTO implements Serializable{
    private String imageURL;
    private String status;
    private String trackingDate;
    private String reason;

    public HistoryDTO() {
    }

    public HistoryDTO(String imageURL, String status, String trackingDate, String reason) {
        this.imageURL = imageURL;
        this.status = status;
        this.trackingDate = trackingDate;
        this.reason = reason;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

   

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTrackingDate() {
        return trackingDate;
    }

    public void setTrackingDate(String trackingDate) {
        this.trackingDate = trackingDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    
    
}
