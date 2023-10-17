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
public class ManagerTrackingBirdDTO implements Serializable{
    private int idRequiredOrder;
    private String idUser;
    private String createdDate;
    private String status; 
    private Double total; 
    private String deliveryDate;
    private String reason;
    private String imgTracking;
    private String trackingDate;
    
    private int idRequiredOrderDetail;
    private String birdFather;
    private String birdMother;
    private Double feePairing;
    private Double finalPricePairing;
    
    private String fullName;
    private String phoneNumber;

    private String name;
    private Double importPrice;
    private Double importPriceBirdDad;
    private Double importPriceBirdMom;

    private int birdNestMale;
    private int birdNestFemale;
    
    public ManagerTrackingBirdDTO(int idRequiredOrder, String status, String trackingDate, String fullName, String name) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.trackingDate = trackingDate;
        this.fullName = fullName;
        this.name = name;
    }


    public ManagerTrackingBirdDTO(int idRequiredOrder, String status, String reason, String imgTracking, String birdFather, String birdMother, Double feePairing, String fullName, Double importPriceBirdDad, Double importPriceBirdMom, int birdNestMale, int birdNestFemale) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.reason = reason;
        this.imgTracking = imgTracking;
        this.birdFather = birdFather;
        this.birdMother = birdMother;
        this.feePairing = feePairing;
        this.fullName = fullName;
        this.importPriceBirdDad = importPriceBirdDad;
        this.importPriceBirdMom = importPriceBirdMom;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
    }
    
    

    public int getBirdNestMale() {
        return birdNestMale;
    }

    public void setBirdNestMale(int birdNestMale) {
        this.birdNestMale = birdNestMale;
    }

    public int getBirdNestFemale() {
        return birdNestFemale;
    }

    public void setBirdNestFemale(int birdNestFemale) {
        this.birdNestFemale = birdNestFemale;
    }
  
    

    public String getTrackingDate() {
        return trackingDate;
    }

    public void setTrackingDate(String trackingDate) {
        this.trackingDate = trackingDate;
    }

    public Double getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(Double importPrice) {
        this.importPrice = importPrice;
    }        
    
    public ManagerTrackingBirdDTO() {
    }

    public int getIdRequiredOrder() {
        return idRequiredOrder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getBirdFather() {
        return birdFather;
    }

    public void setBirdFather(String birdFather) {
        this.birdFather = birdFather;
    }

    public String getBirdMother() {
        return birdMother;
    }

    public void setBirdMother(String birdMother) {
        this.birdMother = birdMother;
    }

    public Double getImportPriceBirdDad() {
        return importPriceBirdDad;
    }

    public void setImportPriceBirdDad(Double importPriceBirdDad) {
        this.importPriceBirdDad = importPriceBirdDad;
    }

    public Double getImportPriceBirdMom() {
        return importPriceBirdMom;
    }

    public void setImportPriceBirdMom(Double importPriceBirdMom) {
        this.importPriceBirdMom = importPriceBirdMom;
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
