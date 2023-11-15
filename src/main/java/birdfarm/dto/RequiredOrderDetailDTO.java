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
 * @author Minh
 */
public class RequiredOrderDetailDTO implements Serializable{

    private int idRequiredOrderDetail;
    private int idRequireOrder;
    private String idBirdFather;
    private String idBirdNest;
    private String idBirdMother;
    private double price;
    private double fee;
    private double feePairing;
    private int birdNestMale;
    private int birdNestFemale;
    private Date createdDate;
    private String status;
    private String birdFatherName;
    private String birdMotherName;
    private String reason;
    private String imageURL;
    private String trackingDate;
    private String birdNestName;
    private String descriptionOfBirdFather;
    private String descriptionOfBirdMother;
    private boolean isPairing;
    private double feeBirdNestMale;
    private double feeBirdNestFemale;
    private String birdFatherImage;
    private String BirdMotherImage;
    public RequiredOrderDetailDTO() {
        
    }

    public RequiredOrderDetailDTO(int idRequireOrder, String idBirdNest, int birdNestMale, int birdNestFemale, String descriptionOfBirdFather, String descriptionOfBirdMother, boolean isPairing, double feeBirdNestMale, double feeBirdNestFemale, String birdFatherImage, String birdMotherImage, String birdFatherName, String birdMotherName) {
        this.idRequireOrder = idRequireOrder;
        this.idBirdNest = idBirdNest;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
        this.descriptionOfBirdFather = descriptionOfBirdFather;
        this.descriptionOfBirdMother = descriptionOfBirdMother;
        this.isPairing = isPairing;
        this.feeBirdNestMale = feeBirdNestMale;
        this.feeBirdNestFemale = feeBirdNestFemale;
        this.birdFatherImage = birdFatherImage;
        this.BirdMotherImage = birdMotherImage;
        this.birdFatherName = birdFatherName;
        this.birdMotherName = birdMotherName;
    }
    
    public RequiredOrderDetailDTO(int idRequiredOrderDetail, int idRequireOrder, String idBirdFather, String idBirdNest, String idBirdMother, double price, double fee, double feePairing, int birdNestMale, int birdNestFemale) {
        this.idRequiredOrderDetail = idRequiredOrderDetail;
        this.idRequireOrder = idRequireOrder;
        this.idBirdFather = idBirdFather;
        this.idBirdNest = idBirdNest;
        this.idBirdMother = idBirdMother;
        this.price = price;
        this.fee = fee;
        this.feePairing = feePairing;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
    }

    public RequiredOrderDetailDTO(int idRequireOrder, String idBirdNest, double fee, Date createdDate, String status, String birdFatherName, String birdMotherName,int birdNestMale, int birdNestFemale,double feeBirdNestMale, double feeBirdNestFemale) {
        this.idRequireOrder = idRequireOrder;
        this.idBirdNest = idBirdNest;
        this.fee = fee;
        this.createdDate = createdDate;
        this.status = status;
        this.birdFatherName = birdFatherName;
        this.birdMotherName = birdMotherName;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
        this.feeBirdNestMale = feeBirdNestMale;
        this.feeBirdNestFemale = feeBirdNestFemale;
    }
    public RequiredOrderDetailDTO(int idRequireOrder, int birdNestMale, int birdNestFemale, String status, String birdFatherName, String birdMotherName, String reason, String imageURL, String trackingDate) {
        this.idRequireOrder = idRequireOrder;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
        this.status = status;
        this.birdFatherName = birdFatherName;
        this.birdMotherName = birdMotherName;
        this.reason = reason;
        this.imageURL = imageURL;
        this.trackingDate = trackingDate;
    }
     public RequiredOrderDetailDTO(int idRequireOrder, int birdNestMale, int birdNestFemale, String status, String birdFatherName, String birdMotherName, String reason, String imageURL, String trackingDate, String birdNestName) {
        this.idRequireOrder = idRequireOrder;
        this.birdNestMale = birdNestMale;
        this.birdNestFemale = birdNestFemale;
        this.status = status;
        this.birdFatherName = birdFatherName;
        this.birdMotherName = birdMotherName;
        this.reason = reason;
        this.imageURL = imageURL;
        this.trackingDate = trackingDate;
        this.birdNestName = birdNestName;
    }
                    
    public int getIdRequiredOrderDetail() {
        return idRequiredOrderDetail;
    }

    public void setIdRequiredOrderDetail(int idRequiredOrderDetail) {
        this.idRequiredOrderDetail = idRequiredOrderDetail;
    }

    public int getIdRequireOrder() {
        return idRequireOrder;
    }

    public void setIdRequireOrder(int idRequireOrder) {
        this.idRequireOrder = idRequireOrder;
    }

    public String getIdBirdFather() {
        return idBirdFather;
    }

    public void setIdBirdFather(String idBirdFather) {
        this.idBirdFather = idBirdFather;
    }

    public String getIdBirdNest() {
        return idBirdNest;
    }

    public void setIdBirdNest(String idBirdNest) {
        this.idBirdNest = idBirdNest;
    }

    public String getIdBirdMother() {
        return idBirdMother;
    }

    public void setIdBirdMother(String idBirdMother) {
        this.idBirdMother = idBirdMother;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    public double getFeePairing() {
        return feePairing;
    }

    public void setFeePairing(double feePairing) {
        this.feePairing = feePairing;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBirdFatherName() {
        return birdFatherName;
    }

    public void setBirdFatherName(String birdFatherName) {
        this.birdFatherName = birdFatherName;
    }

    public String getBirdMotherName() {
        return birdMotherName;
    }

    public void setBirdMotherName(String birdMotherName) {
        this.birdMotherName = birdMotherName;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getTrackingDate() {
        return trackingDate;
    }

    public void setTrackingDate(String trackingDate) {
        this.trackingDate = trackingDate;
    }

    public String getBirdNestName() {
        return birdNestName;
    }

    public void setBirdNestName(String birdNestName) {
        this.birdNestName = birdNestName;
    }

    public String getDescriptionOfBirdFather() {
        return descriptionOfBirdFather;
    }

    public void setDescriptionOfBirdFather(String descriptionOfBirdFather) {
        this.descriptionOfBirdFather = descriptionOfBirdFather;
    }

    public String getDescriptionOfBirdMother() {
        return descriptionOfBirdMother;
    }

    public void setDescriptionOfBirdMother(String descriptionOfBirdMother) {
        this.descriptionOfBirdMother = descriptionOfBirdMother;
    }

    public boolean isIsPairing() {
        return isPairing;
    }

    public void setIsPairing(boolean isPairing) {
        this.isPairing = isPairing;
    }

    public double getFeeBirdNestMale() {
        return feeBirdNestMale;
    }

    public void setFeeBirdNestMale(double feeBirdNestMale) {
        this.feeBirdNestMale = feeBirdNestMale;
    }

    public double getFeeBirdNestFemale() {
        return feeBirdNestFemale;
    }

    public void setFeeBirdNestFemale(double feeBirdNestFemale) {
        this.feeBirdNestFemale = feeBirdNestFemale;
    }

    public String getBirdFatherImage() {
        return birdFatherImage;
    }

    public void setBirdFatherImage(String birdFatherImage) {
        this.birdFatherImage = birdFatherImage;
    }

    public String getBirdMotherImage() {
        return BirdMotherImage;
    }

    public void setBirdMotherImage(String BirdMotherImage) {
        this.BirdMotherImage = BirdMotherImage;
    }
    

}
