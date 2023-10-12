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
public class ManagerTrackingBirđTO implements Serializable{
    private int idRequiredOrder;
    private String idUser;
    private String createdDate;
    private String status; 
    private Double total; 
    private String deliveryDate;
    private String reason;
    private String imgTracking;
    
    private int idRequiredOrderDetail;
    private String idBirdFather;
    private String idBirdMother;
    private Double feePairing;
    private Double finalPricePairing;
    
    private String fullName;
    private String phoneNumber;

    public ManagerTrackingBirđTO(int idRequiredOrder, String status, 
            String deliveryDate, String idBirdFather, String idBirdMother, String fullName) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.deliveryDate = deliveryDate;
        this.idBirdFather = idBirdFather;
        this.idBirdMother = idBirdMother;
        this.fullName = fullName;
    }

    public ManagerTrackingBirđTO() {
    }

    public int getIdRequiredOrder() {
        return idRequiredOrder;
    }

    public void setIdRequiredOrder(int idRequiredOrder) {
        this.idRequiredOrder = idRequiredOrder;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getImgTracking() {
        return imgTracking;
    }

    public void setImgTracking(String imgTracking) {
        this.imgTracking = imgTracking;
    }

    public int getIdRequiredOrderDetail() {
        return idRequiredOrderDetail;
    }

    public void setIdRequiredOrderDetail(int idRequiredOrderDetail) {
        this.idRequiredOrderDetail = idRequiredOrderDetail;
    }

    public String getIdBirdFather() {
        return idBirdFather;
    }

    public void setIdBirdFather(String idBirdFather) {
        this.idBirdFather = idBirdFather;
    }

    public String getIdBirdMother() {
        return idBirdMother;
    }

    public void setIdBirdMother(String idBirdMother) {
        this.idBirdMother = idBirdMother;
    }

    public Double getFeePairing() {
        return feePairing;
    }

    public void setFeePairing(Double feePairing) {
        this.feePairing = feePairing;
    }

    public Double getFinalPricePairing() {
        return finalPricePairing;
    }

    public void setFinalPricePairing(Double finalPricePairing) {
        this.finalPricePairing = finalPricePairing;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    
    
    
}
