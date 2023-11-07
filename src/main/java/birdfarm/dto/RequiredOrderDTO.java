/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class RequiredOrderDTO implements Serializable{
    private int idRequiredOrder;
    private String idUser;
    private Date createdDate;
    private String status;
    private double total;
    private Date deliveryDate;
    private String receiverAddress;
    private String receiverName;
    private String receiverPhoneNumber;
    private int paymentID;
    private String reason;
    private String imgTracking;
    private Date trackingDate;
    private boolean isPay;
    private String idBirdNest;
    private String orderCode;
    private String note;
    private String imageURL;
    private double feeBirdNest;
    private String name;
    private String BirdFatherName;
    private String BirdMotherName;
    private double fee;
    private int birdNestMale;
    private int birdNestFemale;
    public RequiredOrderDTO() {
       
        
    }

    public RequiredOrderDTO(int idRequiredOrder, Date createdDate, String status, String receiverAddress, String receiverName, String receiverPhoneNumber, String note, String BirdFatherName, String BirdMotherName, double fee, int paymentID,int birdNestMale, int birdNestFemale) {
        this.idRequiredOrder = idRequiredOrder;
        this.createdDate = createdDate;
        this.status = status;
        this.receiverAddress = receiverAddress;
        this.receiverName = receiverName;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.note = note;
        this.BirdFatherName = BirdFatherName;
        this.BirdMotherName = BirdMotherName;
        this.fee = fee;
        this.paymentID = paymentID;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
    }

    public RequiredOrderDTO(int idRequiredOrder, String idUser, Date createdDate, String status, double total, Date deliveryDate, String receiverAddress, String receiverName, String receiverPhoneNumber, int paymentID, String reason, String imgTracking, Date trackingDate) {
        this.idRequiredOrder = idRequiredOrder;
        this.idUser = idUser;
        this.createdDate = createdDate;
        this.status = status;
        this.total = total;
        this.deliveryDate = deliveryDate;
        this.receiverAddress = receiverAddress;
        this.receiverName = receiverName;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.paymentID = paymentID;
        this.reason = reason;
        this.imgTracking = imgTracking;
        this.trackingDate = trackingDate;
        
    }
        
    /**
     * @return the idRequiredOrder
     */
//equiredOrderDTO(idUser, createDate, status, total, 
    //receiverAddress, receiverPhoneNumber, receiverName, paymentId, isPay, idBirdNest);
    
    
    public RequiredOrderDTO(String idUser, Date createdDate, String status, double total, String receiverAddress, String receiverName, String receiverPhoneNumber, int paymentID, boolean isPay,String idBirdNest, String note, String orderCode) {
        this.idUser = idUser;
        this.createdDate = createdDate;
        this.status = status;
        this.total = total;
        this.receiverAddress = receiverAddress;
        this.receiverName = receiverName;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.paymentID = paymentID;
        this.isPay = isPay;
        this.idBirdNest = idBirdNest;
        this.note = note;
        this.orderCode = orderCode;
    }
    
    public RequiredOrderDTO(int idRequiredOrder, String status, double total, String receiverAddress, String receiverName, String receiverPhoneNumber, String note, String imageURL, double feeBirdNest, String name) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.total = total;
        this.receiverAddress = receiverAddress;
        this.receiverName = receiverName;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.note = note;
        this.imageURL = imageURL;
        this.feeBirdNest = feeBirdNest;
        this.name = name;
    }
                    
                    
    public int getIdRequiredOrder() {
        return idRequiredOrder;
    }

    /**
     * @param idRequiredOrder the idRequiredOrder to set
     */
    public void setIdRequiredOrder(int idRequiredOrder) {
        this.idRequiredOrder = idRequiredOrder;
    }

    /**
     * @return the idUser
     */
    public String getIdUser() {
        return idUser;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    /**
     * @return the createdDate
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     * @param createdDate the createdDate to set
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     * @return the deliveryDate
     */
    public Date getDeliveryDate() {
        return deliveryDate;
    }

    /**
     * @param deliveryDate the deliveryDate to set
     */
    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    /**
     * @return the receiverAddress
     */
    public String getReceiverAddress() {
        return receiverAddress;
    }

    /**
     * @param receiverAddress the receiverAddress to set
     */
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    /**
     * @return the receiverName
     */
    public String getReceiverName() {
        return receiverName;
    }

    /**
     * @param receiverName the receiverName to set
     */
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * @return the receiverPhoneNumber
     */
    public String getReceiverPhoneNumber() {
        return receiverPhoneNumber;
    }

    /**
     * @param receiverPhoneNumber the receiverPhoneNumber to set
     */
    public void setReceiverPhoneNumber(String receiverPhoneNumber) {
        this.receiverPhoneNumber = receiverPhoneNumber;
    }

    /**
     * @return the paymentID
     */
    public int getPaymentID() {
        return paymentID;
    }

    /**
     * @param paymentID the paymentID to set
     */
    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }

    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * @return the imgTracking
     */
    public String getImgTracking() {
        return imgTracking;
    }

    /**
     * @param imgTracking the imgTracking to set
     */
    public void setImgTracking(String imgTracking) {
        this.imgTracking = imgTracking;
    }

    /**
     * @return the trackingDate
     */
    public Date getTrackingDate() {
        return trackingDate;
    }

    /**
     * @param trackingDate the trackingDate to set
     */
    public void setTrackingDate(Date trackingDate) {
        this.trackingDate = trackingDate;
    }

    /**
     * @return the isPay
     */
    public boolean isIsPay() {
        return isPay;
    }

    /**
     * @param isPay the isPay to set
     */
    public void setIsPay(boolean isPay) {
        this.isPay = isPay;
    }

    /**
     * @return the idBirdNest
     */
    public String getIdBirdNest() {
        return idBirdNest;
    }

    /**
     * @param idBirdNest the idBirdNest to set
     */
    public void setIdBirdNest(String idBirdNest) {
        this.idBirdNest = idBirdNest;
    }

    /**
     * @return the orderCode
     */
    public String getOrderCode() {
        return orderCode;
    }

    /**
     * @param orderCode the orderCode to set
     */
    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the imageURL
     */
    public String getImageURL() {
        return imageURL;
    }

    /**
     * @param imageURL the imageURL to set
     */
    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    /**
     * @return the feeBirdNest
     */
    public double getFeeBirdNest() {
        return feeBirdNest;
    }

    /**
     * @param feeBirdNest the feeBirdNest to set
     */
    public void setFeeBirdNest(double feeBirdNest) {
        this.feeBirdNest = feeBirdNest;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the BirdFatherName
     */
    public String getBirdFatherName() {
        return BirdFatherName;
    }

    /**
     * @param BirdFatherName the BirdFatherName to set
     */
    public void setBirdFatherName(String BirdFatherName) {
        this.BirdFatherName = BirdFatherName;
    }

    /**
     * @return the BirdMotherName
     */
    public String getBirdMotherName() {
        return BirdMotherName;
    }

    /**
     * @param BirdMotherName the BirdMotherName to set
     */
    public void setBirdMotherName(String BirdMotherName) {
        this.BirdMotherName = BirdMotherName;
    }

    /**
     * @return the fee
     */
    public double getFee() {
        return fee;
    }

    /**
     * @param fee the fee to set
     */
    public void setFee(double fee) {
        this.fee = fee;
    }

    /**
     * @return the birdNestMale
     */
    public int getBirdNestMale() {
        return birdNestMale;
    }

    /**
     * @param birdNestMale the birdNestMale to set
     */
    public void setBirdNestMale(int birdNestMale) {
        this.birdNestMale = birdNestMale;
    }

    /**
     * @return the birdNestFemale
     */
    public int getBirdNestFemale() {
        return birdNestFemale;
    }

    /**
     * @param birdNestFemale the birdNestFemale to set
     */
    public void setBirdNestFemale(int birdNestFemale) {
        this.birdNestFemale = birdNestFemale;
    }
    
    
}
