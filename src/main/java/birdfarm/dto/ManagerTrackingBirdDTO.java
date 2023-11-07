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
public class ManagerTrackingBirdDTO implements Serializable {

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
    
    private String imageBirdFather;
    private String imageBirdMother;
    
    private String shortDescriptionBirdFather;
    private String shortDescriptionBirdMother;

    private String fullName;
    private String phoneNumber;

    private String name;
    private Double importPrice;
    private Double importPriceBirdDad;
    private Double importPriceBirdMom;
    private Double fee;
    private String email;
    private String idBirdNest;

    private int birdNestMale;
    private int birdNestFemale;

    public ManagerTrackingBirdDTO(int idRequiredOrder, String status, String trackingDate, String birdFather, String birdMother, String fullName) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.trackingDate = trackingDate;
        this.birdFather = birdFather;
        this.birdMother = birdMother;
        this.fullName = fullName;
    }
    
    public ManagerTrackingBirdDTO(int idRequiredOrder, String status, String trackingDate, String birdFather, String birdMother, String fullName, String createdDate) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.trackingDate = trackingDate;
        this.birdFather = birdFather;
        this.birdMother = birdMother;
        this.fullName = fullName;
        this.createdDate = createdDate;
    }

    public ManagerTrackingBirdDTO(int idRequiredOrder, String status,
            String reason, String imgTracking, String birdFather,
            String birdMother, String fullName,
            Double importPriceBirdDad, Double importPriceBirdMom,
            Double fee, int birdNestMale, int birdNestFemale, String email ,
            String idBirdNest, String imageBirdFather, String imageBirdMother,
            String shortDescriptionBirdFather ,  String shortDescriptionBirdMother,
            Double total) {
        this.idRequiredOrder = idRequiredOrder;
        this.status = status;
        this.reason = reason;
        this.imgTracking = imgTracking;
        this.birdFather = birdFather;
        this.birdMother = birdMother;
        this.fullName = fullName;
        this.importPriceBirdDad = importPriceBirdDad;
        this.importPriceBirdMom = importPriceBirdMom;
        this.fee = fee;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
        this.email = email;
        this.idBirdNest = idBirdNest;
        this.imageBirdFather = imageBirdFather;
        this.imageBirdMother = imageBirdMother;
        this.shortDescriptionBirdFather = shortDescriptionBirdFather;
        this.shortDescriptionBirdMother = shortDescriptionBirdMother;
        this.total = total;
    }

    public String getImageBirdFather() {
        return imageBirdFather;
    }

    public void setImageBirdFather(String imageBirdFather) {
        this.imageBirdFather = imageBirdFather;
    }

    public String getImageBirdMother() {
        return imageBirdMother;
    }

    public void setImageBirdMother(String imageBirdMother) {
        this.imageBirdMother = imageBirdMother;
    }

    public String getShortDescriptionBirdFather() {
        return shortDescriptionBirdFather;
    }

    public void setShortDescriptionBirdFather(String shortDescriptionBirdFather) {
        this.shortDescriptionBirdFather = shortDescriptionBirdFather;
    }

    public String getShortDescriptionBirdMother() {
        return shortDescriptionBirdMother;
    }

    public void setShortDescriptionBirdMother(String shortDescriptionBirdMother) {
        this.shortDescriptionBirdMother = shortDescriptionBirdMother;
    }

    public String getIdBirdNest() {
        return idBirdNest;
    }

    public void setIdBirdNest(String idBirdNest) {
        this.idBirdNest = idBirdNest;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Double getFee() {
        return fee;
    }

    public void setFee(Double fee) {
        this.fee = fee;
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
